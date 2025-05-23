# Price Comparator - Market Backend

## Overview

This project is a backend service for a **Price Comparator - Market** application. It helps users compare prices of everyday grocery items across different supermarket chains (e.g., Lidl, Kaufland, Profi). The system enables users to track price changes, find the best deals, and manage shopping lists efficiently.

---

## Features

- **Daily Shopping Basket Monitoring**  
  Split a user’s basket into optimized shopping lists to maximize cost savings.

- **Best Discounts**  
  Retrieve products with the highest current percentage discounts across all tracked stores.

- **New Discounts**  
  List discounts newly added within a recent timeframe (e.g., last 24 hours).

- **Dynamic Price History Graphs**  
  Provide historical price data points, filterable by store, product category, or brand, to enable frontend visualizations of price trends.

- **Product Substitutes & Recommendations**  
  Highlight value per unit (price per kg, liter, etc.) to identify the best buy even if package sizes differ.

- **Custom Price Alert**  
  Users can set target prices for products and get notified when prices drop to or below those targets.

---

## API Endpoints

### ProductController (`/products`)

- `GET /products`  
  Get all products.

- `GET /products/{id}`  
  Get product details by ID.

- `GET /products/search?name=&store=`  
  Search products by name and/or store.

- `POST /products/best-prices`  
  Given a list of product names, get the best current prices.

- `POST /products/shopping-list`  
  Split a shopping list by date and product names, optimizing for cost savings.

- `GET /products/price-history?store=&productCategory=&brand=`  
  Retrieve price history data, filtered by exactly one of store, product category, or brand.

### DiscountController (`/discounts`)

- `GET /discounts`  
  List all discounts.

- `GET /discounts/best-discounts?date=&limit=`  
  Get best discounts on a given date (defaults to today) with an optional limit.

- `GET /discounts/new-discounts`  
  Get discounts added recently (e.g., last 24 hours).

### PriceAlertController (`/alerts`)

- `POST /alerts`  
  Create a new price alert.

- `GET /alerts/check?productName=`  
  Check if the product price meets the alert criteria.

> **Note:** You can find a Postman Collection with example requests in the src/main/resources folder
---

## Database Schema

### Tables

- **product**

  | Column           | Type          | Notes                           |
  |------------------|---------------|--------------------------------|
  | id               | BIGINT        | Primary Key, auto-increment    |
  | product_name     | VARCHAR(255)  |                                |
  | product_category | VARCHAR(255)  |                                |
  | brand            | VARCHAR(255)  |                                |
  | package_quantity | DECIMAL(10,2) |                                |
  | package_unit     | VARCHAR(255)  |                                |
  | price            | DECIMAL(10,2) |                                |
  | currency         | VARCHAR(255)  |                                |
  | store            | VARCHAR(255)  |                                |
  | price_per_unit   | DECIMAL(10,2) | Automatically calculated        |
  | created_at       | DATETIME      | Default current timestamp      |

- **discount**

  | Column                 | Type          | Notes                           |
  |------------------------|---------------|--------------------------------|
  | id                     | BIGINT        | Primary Key, auto-increment    |
  | product_name           | VARCHAR(100)  |                                |
  | brand                  | VARCHAR(100)  |                                |
  | package_quantity       | DOUBLE        |                                |
  | package_unit           | VARCHAR(10)   |                                |
  | product_category       | VARCHAR(100)  |                                |
  | from_date              | DATE          | Start of discount period       |
  | to_date                | DATE          | End of discount period         |
  | percentage_of_discount | DOUBLE        |                                |
  | store                  | VARCHAR(20)   |                                |
  | created_at             | DATETIME      | Default current timestamp      |

- **price_alert**

  | Column       | Type          | Notes                        |
  |--------------|---------------|------------------------------|
  | id           | BIGINT        | Primary Key, auto-increment  |
  | product_name | VARCHAR(255)  |                              |
  | target_price | DECIMAL(10,2) |                              |
  | active       | BIT           | Whether alert is active      |

### Triggers

- `trg_product_price_per_unit` — Automatically calculates `price_per_unit` on product insert, normalizing units like grams to kilograms or milliliters to liters.

---

## Validation & Error Handling

- Input validation (e.g., on `ShoppingListBody`).
- Validation for mutually exclusive query parameters (e.g., only one of `store`, `productCategory`, or `brand` allowed for price history).
- Proper HTTP status codes and error messages for invalid input or request errors.

---

## Technologies & Dependencies

- Java 17+
- Spring Boot (Web, Validation, Data JPA)
- Jackson (JSON serialization)
- H2/MySQL/PostgreSQL (or any relational DB supported by JPA)
- Lombok (for boilerplate code reduction)
- Hibernate Validator (for bean validation)

---

## How to Run

1. Clone the repository.
2. Configure your database settings in `application.properties` or `application.yml`.
3. Build the project with Maven or Gradle:
   ```bash
   ./mvnw clean install
4. Run the application:
   ```bash
   ./mvnw spring-boot:run
6. Access the API endpoints using an API testing tool such as Postman
