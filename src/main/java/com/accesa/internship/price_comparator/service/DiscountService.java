package com.accesa.internship.price_comparator.service;

import com.accesa.internship.price_comparator.model.Discount;
import com.accesa.internship.price_comparator.repository.DiscountRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DiscountService {
    private final DiscountRepository discountRepository;

    public List<Discount> getAllDiscounts(String productId) {
        return discountRepository.findAll();
    }


}

