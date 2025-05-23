package com.accesa.internship.price_comparator.repository;


import com.accesa.internship.price_comparator.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    List<Product> findByStore(String store);

    List<Product> findByProductName(String productName);

    List<Product> findByStoreAndProductName(String store, String productName);

    List<Product> findByProductNameIn(List<String> names);

    Optional<Product> findFirstByProductName(String productName);

    List<Product> findByProductCategory(String productCategory);

    List<Product> findProductByBrand(String brand);

    @Query(value = """
            SELECT *
            FROM (
                SELECT p.*,
                       ROW_NUMBER() OVER (PARTITION BY product_name ORDER BY price_per_unit ASC) as rn
                FROM product p
                WHERE p.product_name IN (:names)
            ) sub
            WHERE rn = 1
            """, nativeQuery = true)
    List<Product> findBestPricesByProductNames(@Param("names") List<String> names);


}
