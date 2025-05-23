package com.accesa.internship.price_comparator.service;

import com.accesa.internship.price_comparator.exception.NotFoundException;
import com.accesa.internship.price_comparator.model.Discount;
import com.accesa.internship.price_comparator.model.PriceAlert;
import com.accesa.internship.price_comparator.model.Product;
import com.accesa.internship.price_comparator.repository.DiscountRepository;
import com.accesa.internship.price_comparator.repository.PriceAlertRepository;
import com.accesa.internship.price_comparator.repository.ProductRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import static org.hibernate.internal.util.collections.CollectionHelper.listOf;

@Service
@RequiredArgsConstructor
public class PriceAlertService {

    private final PriceAlertRepository priceAlertRepository;
    private final ProductRepository productRepository;
    private final DiscountRepository discountRepository;
    private final ObjectMapper objectMapper = new ObjectMapper();

    public String checkPriceAlert(String productName) {
        List<PriceAlert> alerts = priceAlertRepository.findByProductNameAndActiveIsTrue(productName);
        Optional<Product> productOpt = productRepository.findFirstByProductName(productName);
        List<Discount> discounts = discountRepository.findByDateAndProductNames(LocalDate.now(), listOf(productName));

        if (alerts.isEmpty() || productOpt.isEmpty()) {
            throw new NotFoundException("Alerts or product not found.");
        }

        Map<String, String> reachedTargetPrices = new HashMap<>();

        Product product = productOpt.get();
        double price = product.getPrice();

        discounts.forEach(discount -> {
            double discountPercent = discount.getPercentageOfDiscount() / 100.0;
            double effectivePrice = price * (1 - discountPercent);

            alerts.forEach(alert -> {
                if (effectivePrice <= alert.getTargetPrice()) {
                    alert.setActive(false);
                    priceAlertRepository.save(alert);
                    reachedTargetPrices.put(alert.getId() + "_" + discount.getStore(), "Product %s reached target price %f at %s".formatted(productName, alert.getTargetPrice(), discount.getStore()));
                }
            });
        });

        if (reachedTargetPrices.isEmpty()) {
            return " Product '" + productName + "' price (" + price + ") did not reach any active target.";
        } else {
            try {
                return objectMapper.writeValueAsString(reachedTargetPrices);
            } catch (JsonProcessingException e) {
                throw new RuntimeException("Failed to write price alerts to JSON: " + e.getMessage());
            }
        }
    }


    public PriceAlert saveAlert(PriceAlert alert) {
        alert.setActive(true);
        return priceAlertRepository.save(alert);
    }
}
