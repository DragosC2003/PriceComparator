package com.accesa.internship.price_comparator.service;

import com.accesa.internship.price_comparator.model.Discount;
import com.accesa.internship.price_comparator.repository.DiscountRepository;
import com.accesa.internship.price_comparator.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class DiscountService {
    private final DiscountRepository discountRepository;
    private final ProductRepository productRepository;

    public List<Discount> getAllDiscounts() {
        return discountRepository.findAll();
    }

    public List<Discount> getBestDiscounts(LocalDate date, int limit) {
        return discountRepository.findBestDiscounts(date, limit);
    }

    public List<Discount> getNewDiscounts() {
        LocalDateTime yesterday = LocalDateTime.now().minusHours(24);
        return discountRepository.findByCreatedAtAfter(yesterday);
    }
}