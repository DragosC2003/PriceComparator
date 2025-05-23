package com.accesa.internship.price_comparator.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@NoArgsConstructor
@Getter
@Setter
public class ProductWithDiscountAndTimePeriod extends ProductWithDiscount {
    private LocalDate fromDate;
    private LocalDate toDate;

    public ProductWithDiscountAndTimePeriod(ProductWithDiscount product, LocalDate fromDate, LocalDate toDate) {
        this.setId(product.getId());
        this.setProductName(product.getProductName());
        this.setProductCategory(product.getProductCategory());
        this.setBrand(product.getBrand());
        this.setPackageQuantity(product.getPackageQuantity());
        this.setPackageUnit(product.getPackageUnit());
        this.setPrice(product.getPrice());
        this.setCurrency(product.getCurrency());
        this.setStore(product.getStore());
        this.setPricePerUnit(product.getPricePerUnit());
        this.setCreatedAt(product.getCreatedAt());
        this.setValuePerUnitWithDiscount(product.getValuePerUnitWithDiscount());
        this.setValueWithDiscount(product.getValueWithDiscount());
        this.fromDate = fromDate;
        this.toDate = toDate;
    }
}
