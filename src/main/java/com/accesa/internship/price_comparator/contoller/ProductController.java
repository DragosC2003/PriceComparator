package com.accesa.internship.price_comparator.contoller;

import com.accesa.internship.price_comparator.model.Product;
import com.accesa.internship.price_comparator.model.ShoppingListBody;
import com.accesa.internship.price_comparator.service.ProductService;
import jakarta.validation.Valid;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
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

    @PostMapping("/shopping-list")
    public ResponseEntity<List<Product>> splitShoppingList(@RequestBody @Valid ShoppingListBody requestBody) {
        LocalDate date = requestBody.getDate();
        if (date == null) {
            date = LocalDate.now();
        }
        List<Product> products = productService.splitShoppingCart(date, requestBody.getProductNames());
        return ResponseEntity.ok(products);
    }

    @GetMapping("/price-history")
    public ResponseEntity<String> priceHistoryGraph(@RequestParam(required = false) String store, @RequestParam(required = false) String productCategory, @RequestParam(required = false) String brand) {
        int count = 0;
        if (store != null) count++;
        if (productCategory != null) count++;
        if (brand != null) count++;

        if (count == 0) {
            return ResponseEntity.badRequest().body("At least one parameter must be provided.");
        }

        if (count > 1) {
            return ResponseEntity.badRequest().body("Only one parameter can be provided at a time.");
        }

        if (store != null) {
            return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(productService.priceHistoryGraphByStore(store));
        } else if (productCategory != null) {
            return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(productService.priceHistoryGraphByCategory(productCategory));
        } else {
            return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(productService.priceHistoryGraphByBrand(brand));
        }
    }
}
