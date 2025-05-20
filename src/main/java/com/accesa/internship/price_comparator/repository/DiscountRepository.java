package com.accesa.internship.price_comparator.repository;

import com.accesa.internship.price_comparator.model.Discount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public interface DiscountRepository extends JpaRepository<Discount,Long> {

    @Query("SELECT d FROM discount d WHERE :date BETWEEN d.fromDate AND d.toDate ORDER BY d.percentageOfDiscount DESC LIMIT :limit")
    List<Discount> findBestDiscounts(@Param("date") LocalDate date, @Param("limit") int limit);

    List<Discount> findByCreatedAtAfter(LocalDateTime timestamp);
}
