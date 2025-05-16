package com.accesa.internship.price_comparator.repository;

import com.accesa.internship.price_comparator.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long> {

    List<Product> findByStore(String store);


}
