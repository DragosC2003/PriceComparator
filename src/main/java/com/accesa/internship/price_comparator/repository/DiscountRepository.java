package com.accesa.internship.price_comparator.repository;

import com.accesa.internship.price_comparator.model.Discount;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DiscountRepository extends JpaRepository<Discount,Long> {
    List<Discount> findByStoreAndData(String store, String data);
}
