package com.accesa.internship.price_comparator.service;

import com.accesa.internship.price_comparator.exception.NotFoundException;
import com.accesa.internship.price_comparator.model.Discount;
import com.accesa.internship.price_comparator.model.Product;
import com.accesa.internship.price_comparator.model.ProductWithDiscount;
import com.accesa.internship.price_comparator.repository.DiscountRepository;
import com.accesa.internship.price_comparator.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;

@Service
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final DiscountRepository discountRepository;

    public List<Product> getProducts() {
        return productRepository.findAll();
    }

    public Product getProduct(Long id) {
        return productRepository.findById(id).orElseThrow(() -> new NotFoundException("Product " + id + " not found."));
    }

    public List<Product> searchProducts(String name, String store) {
        boolean hasName = name != null && !name.isBlank();
        boolean hasStore = store != null && !store.isBlank();

        if (hasName && hasStore) {
            return productRepository.findByStoreAndProductName(store, name);
        }
        if (hasName) {
            return productRepository.findByProductName(name);
        }
        if (hasStore) {
            return productRepository.findByStore(store);
        }
        return Collections.emptyList();
    }

    public List<Product> getBestPrices(List<String> productNames) {
        return productRepository.findBestPricesByProductNames(productNames);
    }

    public List<Product> splitShoppingCart(LocalDate date, List<String> productNames) {

        List<Product> products = productRepository.findByProductNameIn(productNames);
        List<Discount> discounts = discountRepository.findByDateAndProductNames(date, productNames);

        Map<String, ProductWithDiscount> bestProductMap = new HashMap<>();

        for (Product product : products) {
            Optional<Discount> discount = discounts
                    .stream()
                    .filter(d -> d.getProductName().equals(product.getProductName())
                            && d.getStore().equals(product.getStore()))
                    .findFirst();

            double effectivePrice = product.getPricePerUnit();

            if (discount.isPresent() && discount.get().getPercentageOfDiscount() != null) {
                double discountPercent = discount.get().getPercentageOfDiscount() / 100.0;
                effectivePrice = effectivePrice * (1 - discountPercent);
            }

            ProductWithDiscount productWithDiscount = new ProductWithDiscount(product, effectivePrice);

            ProductWithDiscount currentBest = bestProductMap.get(product.getProductName());

            if (currentBest == null || effectivePrice < currentBest.getValuePerUnitWithDiscount()) {
                bestProductMap.put(product.getProductName(), productWithDiscount);
            }
        }

        return new ArrayList<>(bestProductMap.values());
    }

}


