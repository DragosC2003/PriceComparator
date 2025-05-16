package com.accesa.internship.price_comparator.service;

import com.accesa.internship.price_comparator.model.Product;
import com.accesa.internship.price_comparator.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;

    public List<Product> getProducts() {
        return productRepository.findAll();
    }

    public Product getProduct( Long id)
    {
        return productRepository.findById(id).orElse(null);
    }
    public List<Product>findProductByStore( String store)
    {
        return productRepository.findByStore(store);
    }
}

