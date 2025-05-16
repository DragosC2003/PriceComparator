package com.accesa.internship.price_comparator.contoller;

import com.accesa.internship.price_comparator.model.Discount;
import com.accesa.internship.price_comparator.repository.DiscountRepository;
import com.accesa.internship.price_comparator.service.DiscountService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/discount")
@RequiredArgsConstructor
public class DiscountController {

    private final DiscountService discountService;
    private final DiscountRepository discountRepository;

    @GetMapping
    public List<Discount> getAllDiscounts() {
        return discountRepository.findAll();
    }
}
