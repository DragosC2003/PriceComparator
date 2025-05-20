package com.accesa.internship.price_comparator.contoller;

import com.accesa.internship.price_comparator.model.Product;
import com.accesa.internship.price_comparator.service.ProductService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/products")
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;

    @GetMapping
    public List<Product> getProducts() {
        return productService.getProducts();
    }

    @GetMapping("/{id}")
    public Product getProductById(@PathVariable Long id) {
        return productService.getProduct(id);
    }

    @GetMapping("/search")
    public List<Product> searchProducts(@RequestParam(required = false) String name, @RequestParam(required = false) String store) {
        return productService.searchProducts(name, store);
    }

    @PostMapping("/best-prices")
    public ResponseEntity<List<Product>> getBestPrices(@RequestBody List<String> productNames) {
        List<Product> products = productService.getBestPrices(productNames);
        return ResponseEntity.ok(products);
    }

}
