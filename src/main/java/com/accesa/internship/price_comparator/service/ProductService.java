package com.accesa.internship.price_comparator.service;

import com.accesa.internship.price_comparator.exception.NotFoundException;
import com.accesa.internship.price_comparator.model.Discount;
import com.accesa.internship.price_comparator.model.Product;
import com.accesa.internship.price_comparator.model.ProductWithDiscount;
import com.accesa.internship.price_comparator.model.ProductWithDiscountAndTimePeriod;
import com.accesa.internship.price_comparator.repository.DiscountRepository;
import com.accesa.internship.price_comparator.repository.ProductRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;

@Service
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final DiscountRepository discountRepository;
    private final ObjectMapper objectMapper;

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

            double effectivePricePerUnit = product.getPricePerUnit();
            double effectivePrice = product.getPrice();

            if (discount.isPresent() && discount.get().getPercentageOfDiscount() != null) {
                double discountPercent = discount.get().getPercentageOfDiscount() / 100.0;
                effectivePricePerUnit = effectivePricePerUnit * (1 - discountPercent);
                effectivePrice = effectivePrice * (1 - discountPercent);
            }

            ProductWithDiscount productWithDiscount = new ProductWithDiscount(product, effectivePricePerUnit, effectivePrice);

            ProductWithDiscount currentBest = bestProductMap.get(product.getProductName());

            if (currentBest == null || effectivePricePerUnit < currentBest.getValuePerUnitWithDiscount()) {
                bestProductMap.put(product.getProductName(), productWithDiscount);
            }
        }

        return new ArrayList<>(bestProductMap.values());
    }

    public String priceHistoryGraphByStore(String store) {
        List<Product> products = productRepository.findByStore(store);
        return generatePriceHistoryGraph(products);
    }

    public String priceHistoryGraphByCategory(String category) {
        List<Product> products = productRepository.findByProductCategory(category);
        return generatePriceHistoryGraph(products);
    }

    public String priceHistoryGraphByBrand(String brand) {
        List<Product> products = productRepository.findProductByBrand(brand);
        return generatePriceHistoryGraph(products);
    }

    private String generatePriceHistoryGraph(List<Product> products) {
        Map<String, List<ProductWithDiscountAndTimePeriod>> priceHistoryGraph = new HashMap<>();

        for (Product product : products) {
            double price = product.getPrice();
            double pricePerUnit = product.getPricePerUnit();

            List<Discount> discounts = discountRepository.findByStoreAndProductNameAndBrandOrderByFromDate(
                    product.getStore(), product.getProductName(), product.getBrand());

            List<ProductWithDiscountAndTimePeriod> entries = new ArrayList<>();

            for (Discount discount : discounts) {
                double discountPercent = discount.getPercentageOfDiscount() / 100.0;
                double effectivePrice = price * (1 - discountPercent);
                double effectivePricePerUnit = pricePerUnit * (1 - discountPercent);

                entries.add(new ProductWithDiscountAndTimePeriod(
                        new ProductWithDiscount(product, effectivePricePerUnit, effectivePrice),
                        discount.getFromDate(),
                        discount.getToDate()
                ));
            }

            if (entries.isEmpty()) {
                entries = List.of(new ProductWithDiscountAndTimePeriod(
                        new ProductWithDiscount(product, pricePerUnit, price), null, null));
            }

            String key = product.getProductName() + "_" + product.getBrand() + "_" + product.getStore();
            priceHistoryGraph.put(key, entries);
        }

        try {
            return objectMapper.writeValueAsString(priceHistoryGraph);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Failed to write price history graph to JSON: " + e.getMessage(), e);
        }
    }

}


