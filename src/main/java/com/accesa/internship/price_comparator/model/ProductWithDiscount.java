package com.accesa.internship.price_comparator.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class ProductWithDiscount extends Product implements Comparable<ProductWithDiscount> {
    private Double valuePerUnitWithDiscount;
    private Double valueWithDiscount;

    public ProductWithDiscount(Product product, Double valuePerUnitWithDiscount, Double valueWithDiscount) {
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
        this.valuePerUnitWithDiscount = valuePerUnitWithDiscount;
        this.valueWithDiscount = valueWithDiscount;
    }

    @Override
    public int compareTo(ProductWithDiscount o) {
        return Double.compare(this.valuePerUnitWithDiscount, o.valuePerUnitWithDiscount);
    }
}
