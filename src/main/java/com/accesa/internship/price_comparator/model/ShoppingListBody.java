package com.accesa.internship.price_comparator.model;

import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ShoppingListBody {
    private LocalDate date;

    @NotEmpty(message = "Product names list cannot be empty")
    private List<String> productNames;
}
