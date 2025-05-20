package com.accesa.internship.price_comparator.contoller;

import com.accesa.internship.price_comparator.model.Discount;
import com.accesa.internship.price_comparator.service.DiscountService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/discount")
@RequiredArgsConstructor
public class DiscountController {

    private final DiscountService discountService;

    @GetMapping
    public List<Discount> getAllDiscounts() {
        return discountService.getAllDiscounts();
    }

    @GetMapping("/best-discounts")
    public List<Discount> getBestDiscounts(@RequestParam(required = false) LocalDate date, @RequestParam(defaultValue = "5") int limit) {
        return discountService.getBestDiscounts(date, limit);
    }

    @GetMapping("/new-discounts")
    public List<Discount> getNewDiscounts() {
        return discountService.getNewDiscounts();
    }
}
