package com.accesa.internship.price_comparator.contoller;

import com.accesa.internship.price_comparator.model.Product;
import com.accesa.internship.price_comparator.service.ProductService;
import lombok.Getter;
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
    public Product getProductById(@PathVariable Long  id) {
        return productService.getProduct(id);
    }
    @GetMapping("/store/{storeName}")
    public List<Product> getProductsByStoreName(@PathVariable String storeName) {
        return productService.findProductByStore(storeName);
    }

}
