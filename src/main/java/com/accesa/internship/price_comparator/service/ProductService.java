package com.accesa.internship.price_comparator.service;

import com.accesa.internship.price_comparator.model.Product;
import com.accesa.internship.price_comparator.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;

    public List<Product> getProducts() {
        return productRepository.findAll();
    }

    public Product getProduct(Long id) {
        return productRepository.findById(id).orElse(null);
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
}


