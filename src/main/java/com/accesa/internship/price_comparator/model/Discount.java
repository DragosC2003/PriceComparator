package com.accesa.internship.price_comparator.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity(name="discount")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
 public class Discount {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    private String product_id;
    private String product_name;
    private String product_category;
    private String brand;
    private Double package_quantity;
    private String package_unit;
    private Double price;
    private String currency;
    private String to_date;
    private String from_date;
    private String store;
    private String data;
    private Double percentageOfDiscount;
}
