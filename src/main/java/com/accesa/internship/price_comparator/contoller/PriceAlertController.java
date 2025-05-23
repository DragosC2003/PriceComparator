package com.accesa.internship.price_comparator.contoller;

import com.accesa.internship.price_comparator.model.PriceAlert;
import com.accesa.internship.price_comparator.service.PriceAlertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/alerts")
public class PriceAlertController {

    @Autowired
    private PriceAlertService priceAlertService;

    @PostMapping
    public ResponseEntity<PriceAlert> createAlert(@RequestBody PriceAlert alert) {
        PriceAlert saved = priceAlertService.saveAlert(alert);
        return ResponseEntity.ok(saved);
    }

    @GetMapping("/check")
    public ResponseEntity<String> checkAlert(@RequestParam String productName) {
        return ResponseEntity
                .ok()
                .contentType(MediaType.APPLICATION_JSON)
                .body(priceAlertService.checkPriceAlert(productName));
    }

}
