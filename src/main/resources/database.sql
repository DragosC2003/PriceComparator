
CREATE TABLE product (
                id BIGINT AUTO_INCREMENT PRIMARY KEY,
                product_name VARCHAR(255),
                product_category VARCHAR(100),
                brand VARCHAR(100),
                package_quantity DECIMAL(10, 2),
                package_unit VARCHAR(20),
                price DECIMAL(10, 2),
                currency VARCHAR(10),
                store VARCHAR(20),
                price_per_unit DECIMAL(10, 2),
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER trg_product_price_per_unit
    BEFORE INSERT ON product
    FOR EACH ROW
BEGIN
    DECLARE quantity_standard DECIMAL(10, 6);
    DECLARE unit_lower VARCHAR(20);

    SET unit_lower = LOWER(NEW.package_unit);

    IF NEW.package_quantity IS NULL OR NEW.price IS NULL OR NEW.package_quantity = 0 THEN
        SET NEW.price_per_unit = NULL;
    ELSE
        CASE unit_lower
            WHEN 'g' THEN
                SET quantity_standard = NEW.package_quantity / 1000;  -- g to kg
    WHEN 'ml' THEN
                SET quantity_standard = NEW.package_quantity / 1000;  -- ml to l
    WHEN 'role' THEN
                SET quantity_standard = NEW.package_quantity;         -- role same as buc
    ELSE
                SET quantity_standard = NEW.package_quantity;         -- other units remain
END CASE;

SET NEW.price_per_unit = ROUND(NEW.price / quantity_standard, 2);
END IF;
END$$

DELIMITER ;


INSERT INTO product (product_name, product_category, brand, package_quantity, package_unit, price, currency, store) VALUES
('lapte zuzu', 'lactate', 'Zuzu', 1, 'l', 10.10, 'RON', 'Kaufland'),
('iaurt grecesc', 'lactate', 'Olympus', 0.4, 'kg', 11.80, 'RON', 'Kaufland'),
('ouă mărimea M', 'ouă', 'Ferma Veche', 10, 'buc', 13.50, 'RON', 'Kaufland'),
('brânză telemea', 'lactate', 'Hochland', 0.3, 'kg', 13.10, 'RON', 'Kaufland'),
('pâine albă', 'panificație', 'K-Classic', 500, 'g', 3.60, 'RON', 'Kaufland'),
('roșii cherry', 'legume și fructe', 'K-Bio', 250, 'g', 7.00, 'RON', 'Kaufland'),
('piept pui', 'carne', 'Agricola', 1, 'kg', 27.90, 'RON', 'Kaufland'),
('spaghetti nr.5', 'paste făinoase', 'Barilla', 500, 'g', 5.90, 'RON', 'Kaufland'),
('zahăr tos', 'alimente de bază', 'Mărgăritar', 1, 'kg', 4.50, 'RON', 'Kaufland'),
('apă plată', 'băuturi', 'Dorna', 2, 'l', 5.30, 'RON', 'Kaufland'),
('banane', 'legume și fructe', 'Generic', 1, 'kg', 6.20, 'RON', 'Kaufland'),
('ulei floarea-soarelui', 'alimente de bază', 'Floriol', 1, 'l', 9.50, 'RON', 'Kaufland'),
('biscuiți cu unt', 'gustări', 'Milka', 0.2, 'kg', 7.50, 'RON', 'Kaufland'),
('cafea măcinată', 'cafea', 'Jacobs', 0.25, 'kg', 23.00, 'RON', 'Kaufland'),
('detergent lichid', 'produse de menaj', 'Ariel', 2.5, 'l', 50.50, 'RON', 'Kaufland'),
('șampon păr gras', 'îngrijire personală', 'Elseve', 400, 'ml', 18.00, 'RON', 'Kaufland'),
('hârtie igienică 3 straturi', 'produse de menaj', 'Pufina', 10, 'role', 19.20, 'RON', 'Kaufland'),
('piper negru măcinat', 'condimente', 'Fuchs', 50, 'g', 6.10, 'RON', 'Kaufland'),
('vin alb demisec', 'băuturi', 'Recas', 0.75, 'l', 24.00, 'RON', 'Kaufland'),
('ciocolată neagră 70%', 'gustări', 'Heidi', 100, 'g', 4.10, 'RON', 'Kaufland'),
('cartofi albi', 'legume și fructe', 'Generic', 1, 'kg', 3.20, 'RON', 'Kaufland'),
('ceapă galbenă', 'legume și fructe', 'Generic', 1, 'kg', 2.90, 'RON', 'Kaufland'),
('morcovi', 'legume și fructe', 'Generic', 0.5, 'kg', 2.50, 'RON', 'Kaufland'),
('suc portocale', 'băuturi', 'Cappy', 1, 'l', 7.80, 'RON', 'Kaufland'),
('cașcaval', 'lactate', 'Delaco', 0.25, 'kg', 15.00, 'RON', 'Kaufland');

INSERT INTO product (product_name, product_category, brand, package_quantity, package_unit, price, currency, store) VALUES
('lapte zuzu', 'lactate', 'Zuzu', 1, 'l', 9.90, 'RON', 'Lidl'),
('iaurt grecesc', 'lactate', 'Lidl', 0.4, 'kg', 11.50, 'RON', 'Lidl'),
('ouă mărimea M', 'ouă', 'Lidl', 10, 'buc', 13.20, 'RON', 'Lidl'),
('brânză telemea', 'lactate', 'Pilos', 0.3, 'kg', 12.80, 'RON', 'Lidl'),
('pâine albă', 'panificație', 'Lidl', 500, 'g', 3.50, 'RON', 'Lidl'),
('roșii cherry', 'legume și fructe', 'Lidl', 250, 'g', 6.80, 'RON', 'Lidl'),
('piept pui', 'carne', 'Lidl', 1, 'kg', 28.50, 'RON', 'Lidl'),
('spaghetti nr.5', 'paste făinoase', 'Barilla', 500, 'g', 5.80, 'RON', 'Lidl'),
('zahăr tos', 'alimente de bază', 'Lidl', 1, 'kg', 4.40, 'RON', 'Lidl'),
('apă plată', 'băuturi', 'Aqua Carpatica', 2, 'l', 5.20, 'RON', 'Lidl'),
('banane', 'legume și fructe', 'Lidl', 1, 'kg', 6.10, 'RON', 'Lidl'),
('ulei floarea-soarelui', 'alimente de bază', 'Bunica', 1, 'l', 9.20, 'RON', 'Lidl'),
('biscuiți cu unt', 'gustări', 'Deluxe', 0.2, 'kg', 7.10, 'RON', 'Lidl'),
('cafea măcinată', 'cafea', 'Davidoff', 0.25, 'kg', 22.40, 'RON', 'Lidl'),
('detergent lichid', 'produse de menaj', 'Persil', 2.5, 'l', 49.90, 'RON', 'Lidl'),
('șampon păr gras', 'îngrijire personală', 'Head & Shoulders', 400, 'ml', 17.80, 'RON', 'Lidl'),
('hârtie igienică 3 straturi', 'produse de menaj', 'Zewa', 10, 'role', 18.90, 'RON', 'Lidl'),
('piper negru măcinat', 'condimente', 'Kotanyi', 50, 'g', 6.00, 'RON', 'Lidl'),
('vin alb demisec', 'băuturi', 'Jidvei', 0.75, 'l', 23.50, 'RON', 'Lidl'),
('ciocolată neagră 70%', 'gustări', 'Fin Carre', 100, 'g', 3.90, 'RON', 'Lidl');

INSERT INTO product (product_name, product_category, brand, package_quantity, package_unit, price, currency, store) VALUES
('lapte zuzu', 'lactate', 'Zuzu', 1, 'l', 12.90, 'RON', 'Profi'),
('iaurt grecesc', 'lactate', 'Lidl', 0.4, 'kg', 11.50, 'RON', 'Profi'),
('ouă mărimea M', 'ouă', 'Lidl', 10, 'buc', 12.20, 'RON', 'Profi'),
('brânză telemea', 'lactate', 'Pilos', 0.3, 'kg', 12.80, 'RON', 'Profi'),
('pâine albă', 'panificație', 'Lidl', 500, 'g', 3.50, 'RON', 'Profi'),
('roșii cherry', 'legume și fructe', 'Lidl', 250, 'g', 8.80, 'RON', 'Profi'),
('piept pui', 'carne', 'Lidl', 1, 'kg', 26.50, 'RON', 'Profi'),
('spaghetti nr.5', 'paste făinoase', 'Barilla', 500, 'g', 5.80, 'RON', 'Profi'),
('zahăr tos', 'alimente de bază', 'Lidl', 1, 'kg', 4.40, 'RON', 'Profi'),
('apă plată', 'băuturi', 'Aqua Carpatica', 2, 'l', 5.20, 'RON', 'Profi'),
('banane', 'legume și fructe', 'Lidl', 1, 'kg', 6.10, 'RON', 'Profi'),
('ulei floarea-soarelui', 'alimente de bază', 'Bunica', 1, 'l', 9.20, 'RON', 'Profi'),
('biscuiți cu unt', 'gustări', 'Deluxe', 0.2, 'kg', 7.10, 'RON', 'Profi'),
('cafea măcinată', 'cafea', 'Davidoff', 0.25, 'kg', 22.40, 'RON', 'Profi'),
('detergent lichid', 'produse de menaj', 'Persil', 2.5, 'l', 49.90, 'RON', 'Profi'),
('șampon păr gras', 'îngrijire personală', 'Head & Shoulders', 400, 'ml', 17.80, 'RON', 'Profi'),
('hârtie igienică 3 straturi', 'produse de menaj', 'Zewa', 10, 'role', 18.90, 'RON', 'Profi'),
('piper negru măcinat', 'condimente', 'Kotanyi', 50, 'g', 6.00, 'RON', 'Profi'),
('vin alb demisec', 'băuturi', 'Jidvei', 0.75, 'l', 23.50, 'RON', 'Profi'),
('ciocolată neagră 70%', 'gustări', 'Fin Carre', 100, 'g', 3.90, 'RON', 'Profi');

INSERT INTO product (product_name, product_category, brand, package_quantity, package_unit, price, currency, store, price_per_unit) VALUES
('lapte zuzu', 'lactate', 'Zuzu', 1, 'l', 9.80, 'RON', 'Lidl', 9.80),
('iaurt grecesc', 'lactate', 'Lidl', 0.4, 'kg', 11.60, 'RON', 'Lidl', 29.00),
('ouă mărimea M', 'ouă', 'Lidl', 10, 'buc', 13.10, 'RON', 'Lidl', 1.31),
('brânză telemea', 'lactate', 'Pilos', 0.3, 'kg', 12.90, 'RON', 'Lidl', 43.00),
('pâine albă', 'panificație', 'Lidl', 500, 'g', 3.40, 'RON', 'Lidl', 6.80),
('roșii cherry', 'legume și fructe', 'Lidl', 250, 'g', 6.90, 'RON', 'Lidl', 27.60),
('piept pui', 'carne', 'Lidl', 1, 'kg', 28.90, 'RON', 'Lidl', 28.90),
('spaghetti nr.5', 'paste făinoase', 'Barilla', 500, 'g', 5.70, 'RON', 'Lidl', 11.40),
('zahăr tos', 'alimente de bază', 'Lidl', 1, 'kg', 4.30, 'RON', 'Lidl', 4.30),
('apă plată', 'băuturi', 'Aqua Carpatica', 2, 'l', 5.10, 'RON', 'Lidl', 2.55),
('banane', 'legume și fructe', 'Lidl', 1, 'kg', 6.00, 'RON', 'Lidl', 6.00),
('ulei floarea-soarelui', 'alimente de bază', 'Bunica', 1, 'l', 9.30, 'RON', 'Lidl', 9.30),
('biscuiți cu unt', 'gustări', 'Deluxe', 0.2, 'kg', 7.00, 'RON', 'Lidl', 35.00),
('cafea măcinată', 'cafea', 'Davidoff', 0.25, 'kg', 22.60, 'RON', 'Lidl', 90.40),
('detergent lichid', 'produse de menaj', 'Persil', 2.5, 'l', 49.50, 'RON', 'Lidl', 19.80),
('șampon păr gras', 'îngrijire personală', 'Head & Shoulders', 400, 'ml', 17.90, 'RON', 'Lidl', 44.75),
('hârtie igienică 3 straturi', 'produse de menaj', 'Zewa', 10, 'role', 18.80, 'RON', 'Lidl', 1.88),
('piper negru măcinat', 'condimente', 'Kotanyi', 50, 'g', 6.05, 'RON', 'Lidl', 12.10),
('vin alb demisec', 'băuturi', 'Jidvei', 0.75, 'l', 23.30, 'RON', 'Lidl', 31.07),
('ciocolată neagră 70%', 'gustări', 'Fin Carre', 100, 'g', 3.80, 'RON', 'Lidl', 3.80),
('cartofi albi', 'legume și fructe', 'Lidl', 1, 'kg', 3.00, 'RON', 'Lidl', 3.00),
('ceapă galbenă', 'legume și fructe', 'Lidl', 1, 'kg', 2.80, 'RON', 'Lidl', 2.80),
('mălai extra', 'alimente de bază', 'Pambac', 1, 'kg', 5.50, 'RON', 'Lidl', 5.50),
('file somon', 'pește', 'Lidl', 0.2, 'kg', 25.00, 'RON', 'Lidl', 125.00),
('cremă de brânză', 'lactate', 'Almette', 0.15, 'kg', 8.50, 'RON', 'Lidl', 56.67);

INSERT INTO product (product_name, product_category, brand, package_quantity, package_unit, price, currency, store, price_per_unit) VALUES
('lapte zuzu', 'lactate', 'Zuzu', 1, 'l', 13.00, 'RON', 'Profi', 13.00),
('iaurt grecesc', 'lactate', 'Proxi', 0.4, 'kg', 11.40, 'RON', 'Profi', 28.50),
('ouă mărimea M', 'ouă', 'Din Ogradă', 10, 'buc', 12.50, 'RON', 'Profi', 1.25),
('brânză telemea', 'lactate', 'Proxi', 0.3, 'kg', 12.70, 'RON', 'Profi', 42.33),
('pâine albă', 'panificație', 'Proxi', 500, 'g', 3.60, 'RON', 'Profi', 7.20),
('roșii cherry', 'legume și fructe', 'Generic', 250, 'g', 8.70, 'RON', 'Profi', 34.80),
('piept pui', 'carne', 'Avicola', 1, 'kg', 26.80, 'RON', 'Profi', 26.80),
('spaghetti nr.5', 'paste făinoase', 'Barilla', 500, 'g', 5.90, 'RON', 'Profi', 11.80),
('zahăr tos', 'alimente de bază', 'Proxi', 1, 'kg', 4.50, 'RON', 'Profi', 4.50),
('apă plată', 'băuturi', 'Aqua Carpatica', 2, 'l', 5.30, 'RON', 'Profi', 2.65),
('banane', 'legume și fructe', 'Generic', 1, 'kg', 6.15, 'RON', 'Profi', 6.15),
('ulei floarea-soarelui', 'alimente de bază', 'Spornic', 1, 'l', 9.10, 'RON', 'Profi', 9.10),
('biscuiți cu unt', 'gustări', 'RoStar', 0.2, 'kg', 7.20, 'RON', 'Profi', 36.00),
('cafea măcinată', 'cafea', 'Tchibo', 0.25, 'kg', 22.00, 'RON', 'Profi', 88.00),
('detergent lichid', 'produse de menaj', 'Dero', 2.5, 'l', 48.90, 'RON', 'Profi', 19.56),
('șampon păr gras', 'îngrijire personală', 'Schauma', 400, 'ml', 17.50, 'RON', 'Profi', 43.75),
('hârtie igienică 3 straturi', 'produse de menaj', 'Motto', 10, 'role', 18.50, 'RON', 'Profi', 1.85),
('piper negru măcinat', 'condimente', 'Kamis', 50, 'g', 6.10, 'RON', 'Profi', 12.20),
('vin alb demisec', 'băuturi', 'Cotnari', 0.75, 'l', 23.00, 'RON', 'Profi', 30.67),
('ciocolată neagră 70%', 'gustări', 'Poiana', 100, 'g', 4.00, 'RON', 'Profi', 4.00),
('morcovi', 'legume și fructe', 'Generic', 0.5, 'kg', 2.60, 'RON', 'Profi', 5.20),
('orez bob lung', 'alimente de bază', 'Deroni', 1, 'kg', 8.00, 'RON', 'Profi', 8.00),
('iaurt de băut', 'lactate', 'Activia', 0.33, 'kg', 5.00, 'RON', 'Profi', 15.15),
('pastă de dinți', 'îngrijire personală', 'Colgate', 100, 'ml', 10.50, 'RON', 'Profi', 105.00),
('bere blondă', 'băuturi', 'Ursus', 0.5, 'l', 3.80, 'RON', 'Profi', 7.60);

INSERT INTO product (product_name, product_category, brand, package_quantity, package_unit, price, currency, store) VALUES
('lapte zuzu', 'lactate', 'Zuzu', 1, 'l', 10.00, 'RON', 'Kaufland'),
('iaurt grecesc', 'lactate', 'Olympus', 0.4, 'kg', 11.70, 'RON', 'Kaufland'),
('ouă mărimea M', 'ouă', 'Ferma Veche', 10, 'buc', 13.60, 'RON', 'Kaufland'),
('brânză telemea', 'lactate', 'Hochland', 0.3, 'kg', 13.00, 'RON', 'Kaufland'),
('pâine albă', 'panificație', 'K-Classic', 500, 'g', 3.55, 'RON', 'Kaufland'),
('roșii cherry', 'legume și fructe', 'K-Bio', 250, 'g', 7.10, 'RON', 'Kaufland'),
('piept pui', 'carne', 'Agricola', 1, 'kg', 28.00, 'RON', 'Kaufland'),
('spaghetti nr.5', 'paste făinoase', 'Barilla', 500, 'g', 5.85, 'RON', 'Kaufland'),
('zahăr tos', 'alimente de bază', 'Mărgăritar', 1, 'kg', 4.45, 'RON', 'Kaufland'),
('apă plată', 'băuturi', 'Dorna', 2, 'l', 5.25, 'RON', 'Kaufland'),
('banane', 'legume și fructe', 'Generic', 1, 'kg', 6.25, 'RON', 'Kaufland'),
('ulei floarea-soarelui', 'alimente de bază', 'Floriol', 1, 'l', 9.60, 'RON', 'Kaufland'),
('biscuiți cu unt', 'gustări', 'Milka', 0.2, 'kg', 7.40, 'RON', 'Kaufland'),
('cafea măcinată', 'cafea', 'Jacobs', 0.25, 'kg', 23.10, 'RON', 'Kaufland'),
('detergent lichid', 'produse de menaj', 'Ariel', 2.5, 'l', 50.80, 'RON', 'Kaufland'),
('șampon păr gras', 'îngrijire personală', 'Elseve', 400, 'ml', 18.10, 'RON', 'Kaufland'),
('hârtie igienică 3 straturi', 'produse de menaj', 'Pufina', 10, 'role', 19.30, 'RON', 'Kaufland'),
('piper negru măcinat', 'condimente', 'Fuchs', 50, 'g', 6.15, 'RON', 'Kaufland'),
('vin alb demisec', 'băuturi', 'Recas', 0.75, 'l', 24.10, 'RON', 'Kaufland'),
('ciocolată neagră 70%', 'gustări', 'Heidi', 100, 'g', 4.15, 'RON', 'Kaufland'),
('cartofi albi', 'legume și fructe', 'Generic', 1, 'kg', 3.10, 'RON', 'Kaufland'),
('ceapă galbenă', 'legume și fructe', 'Generic', 1, 'kg', 2.95, 'RON', 'Kaufland'),
('morcovi', 'legume și fructe', 'Generic', 0.5, 'kg', 2.40, 'RON', 'Kaufland'),
('suc portocale', 'băuturi', 'Santorini', 1, 'l', 7.60, 'RON', 'Kaufland'),
('cașcaval', 'lactate', 'K-Classic', 0.25, 'kg', 14.80, 'RON', 'Kaufland');






CREATE TABLE discount (
                id BIGINT PRIMARY KEY AUTO_INCREMENT,
                product_name VARCHAR(100) NOT NULL,
                brand VARCHAR(100) NOT NULL,
                package_quantity DOUBLE NOT NULL,
                package_unit VARCHAR(10) NOT NULL,
                product_category VARCHAR(100) NOT NULL,
                from_date DATE NOT NULL,
                to_date DATE NOT NULL,
                percentage_of_discount DOUBLE NOT NULL,
                store VARCHAR(20),
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO discount (
product_name, brand, package_quantity, package_unit,product_category, from_date, to_date, percentage_of_discount, store
) VALUES
('lapte zuzu', 'Zuzu', 1, 'l', 'lactate', '2025-05-01', '2025-05-07', 8, 'Profi'),
('brânză telemea', 'Proxi', 0.3, 'kg', 'lactate', '2025-05-01', '2025-05-07', 12, 'Profi'),
('piept pui', 'Avicola', 1, 'kg', 'carne', '2025-05-02', '2025-05-08', 10, 'Profi'),
('apă plată', 'Aqua Carpatica', 2, 'l', 'băuturi', '2025-05-03', '2025-05-09', 5, 'Profi'),
('cafea măcinată', 'Tchibo', 0.25, 'kg', 'cafea', '2025-05-04', '2025-05-10', 15, 'Profi'),
('detergent lichid', 'Dero', 2.5, 'l', 'produse de menaj', '2025-05-01', '2025-05-07', 20, 'Profi'),
('șampon păr gras', 'Schauma', 400, 'ml', 'îngrijire personală', '2025-05-02', '2025-05-08', 10, 'Profi'),
('ciocolată neagră 70%', 'Poiana', 100, 'g', 'gustări', '2025-05-03', '2025-05-09', 10, 'Profi'),
('ouă mărimea M', 'Din Ogradă', 10, 'buc', 'ouă', '2025-05-04', '2025-05-10', 6, 'Profi'),
('banane', 'Generic', 1, 'kg', 'legume și fructe', '2025-05-01', '2025-05-07', 7, 'Profi');



INSERT INTO discount (
product_name, brand, package_quantity, package_unit,product_category, from_date, to_date, percentage_of_discount, store
) VALUES
('lapte zuzu', 'Zuzu', 1, 'l', 'lactate', '2025-05-01', '2025-05-07', 10, 'Lidl'),
('brânză telemea', 'Pilos', 0.3, 'kg', 'lactate', '2025-05-01', '2025-05-07', 15, 'Lidl'),
('spaghetti nr.5', 'Barilla', 500, 'g', 'paste făinoase', '2025-05-03', '2025-05-09', 20, 'Lidl'),
('cafea măcinată', 'Davidoff', 0.25, 'kg', 'cafea', '2025-05-04', '2025-05-10', 12, 'Lidl'),
('pâine albă', 'Lidl', 500, 'g', 'panificație', '2025-05-02', '2025-05-08', 5, 'Lidl'),
('roșii cherry', 'Lidl', 250, 'g', 'legume și fructe', '2025-05-02', '2025-05-08', 8, 'Lidl'),
('detergent lichid', 'Persil', 2.5, 'l', 'produse de menaj', '2025-05-06', '2025-05-12', 25, 'Lidl'),
('șampon păr gras', 'Head & Shoulders', 400, 'ml', 'îngrijire personală', '2025-05-05', '2025-05-11', 15, 'Lidl'),
('vin alb demisec', 'Jidvei', 0.75, 'l', 'băuturi', '2025-05-01', '2025-05-07', 10, 'Lidl'),
('ciocolată neagră 70%', 'Fin Carre', 100, 'g', 'gustări', '2025-05-03', '2025-05-09', 18, 'Lidl'),
('apă plată', 'Aqua Carpatica', 2, 'l', 'băuturi', '2025-05-01', '2025-05-07', 5, 'Lidl'),
('ouă mărimea M', 'Lidl', 10, 'buc', 'ouă', '2025-05-04', '2025-05-10', 7, 'Lidl'),
('piept pui', 'Lidl', 1, 'kg', 'carne', '2025-05-02', '2025-05-08', 6, 'Lidl'),
('ulei floarea-soarelui', 'Bunica', 1, 'l', 'alimente de bază', '2025-05-05', '2025-05-11', 10, 'Lidl'),
('piper negru măcinat', 'Kotanyi', 50, 'g', 'condimente', '2025-05-06', '2025-05-12', 12, 'Lidl'),
('biscuiți cu unt', 'Deluxe', 0.2, 'kg', 'gustări', '2025-05-04', '2025-05-10', 9, 'Lidl'),
('hârtie igienică 3 straturi', 'Zewa', 10, 'role', 'produse de menaj', '2025-05-03', '2025-05-09', 14, 'Lidl'),
('banane', 'Lidl', 1, 'kg', 'legume și fructe', '2025-05-06', '2025-05-12', 6, 'Lidl'),
('iaurt grecesc', 'Lidl', 0.4, 'kg', 'lactate', '2025-05-05', '2025-05-11', 11, 'Lidl'),
('roșii cherry', 'Lidl', 250, 'g', 'legume și fructe', '2025-05-06', '2025-05-12', 5, 'Lidl');

-- And the last batch:

INSERT INTO discount (
product_name, brand, package_quantity, package_unit,product_category, from_date, to_date, percentage_of_discount, store
) VALUES
('iaurt grecesc', 'Olympus', 0.4, 'kg', 'lactate', '2025-05-01', '2025-05-03', 10, 'Kaufland'),
('brânză telemea', 'Hochland', 0.3, 'kg', 'lactate', '2025-05-01', '2025-05-07', 10, 'Kaufland'),
('piept pui', 'Agricola', 1, 'kg', 'carne', '2025-05-02', '2025-05-08', 12, 'Kaufland'),
('spaghetti nr.5', 'Barilla', 500, 'g', 'paste făinoase', '2025-05-03', '2025-05-09', 18, 'Kaufland'),
('cafea măcinată', 'Jacobs', 0.25, 'kg', 'cafea', '2025-05-04', '2025-05-10', 10, 'Kaufland'),
('detergent lichid', 'Ariel', 2.5, 'l', 'produse de menaj', '2025-05-01', '2025-05-07', 22, 'Kaufland'),
('șampon păr gras', 'Elseve', 400, 'ml', 'îngrijire personală', '2025-05-02', '2025-05-08', 12, 'Kaufland'),
('vin alb demisec', 'Recas', 0.75, 'l', 'băuturi', '2025-05-01', '2025-05-07', 15, 'Kaufland'),
('ciocolată neagră 70%', 'Nestle', 100, 'g', 'gustări', '2025-05-03', '2025-05-09', 15, 'Kaufland'),
('banane', 'Kaufland', 1, 'kg', 'legume și fructe', '2025-05-01', '2025-05-07', 10, 'Kaufland'),
('ouă mărimea M', 'Kaufland', 10, 'buc', 'ouă', '2025-05-04', '2025-05-10', 8, 'Kaufland'),
('piept pui', 'Kaufland', 1, 'kg', 'carne', '2025-05-02', '2025-05-08', 9, 'Kaufland'),
('ulei floarea-soarelui', 'Kaufland', 1, 'l', 'alimente de bază', '2025-05-05', '2025-05-11', 12, 'Kaufland'),
('piper negru măcinat', 'Kaufland', 50, 'g', 'condimente', '2025-05-06', '2025-05-12', 15, 'Kaufland'),
('biscuiți cu unt', 'Kaufland', 0.2, 'kg', 'gustări', '2025-05-04', '2025-05-10', 11, 'Kaufland'),
('hârtie igienică 3 straturi', 'Kaufland', 10, 'role', 'produse de menaj', '2025-05-03', '2025-05-09', 16, 'Kaufland'),
('banane', 'Kaufland', 1, 'kg', 'legume și fructe', '2025-05-06', '2025-05-12', 9, 'Kaufland'),
('iaurt grecesc', 'Kaufland', 0.4, 'kg', 'lactate', '2025-05-05', '2025-05-11', 14, 'Kaufland'),
('roșii cherry', 'Kaufland', 250, 'g', 'legume și fructe', '2025-05-06', '2025-05-12', 7, 'Kaufland');

INSERT INTO discount (product_name, brand, package_quantity, package_unit, product_category, from_date, to_date, percentage_of_discount, store) VALUES
('lapte zuzu', 'Zuzu', 1, 'l', 'lactate', '2025-05-08', '2025-05-14', 12, 'Lidl'),
('brânză telemea', 'Pilos', 0.3, 'kg', 'lactate', '2025-05-08', '2025-05-14', 10, 'Lidl'),
('piept pui', 'Lidl', 1, 'kg', 'carne', '2025-05-09', '2025-05-15', 8, 'Lidl'),
('cafea măcinată', 'Davidoff', 0.25, 'kg', 'cafea', '2025-05-10', '2025-05-16', 15, 'Lidl'),
('ulei floarea-soarelui', 'Bunica', 1, 'l', 'alimente de bază', '2025-05-08', '2025-05-14', 7, 'Lidl'),
('detergent lichid', 'Persil', 2.5, 'l', 'produse de menaj', '2025-05-09', '2025-05-15', 20, 'Lidl'),
('șampon păr gras', 'Head & Shoulders', 400, 'ml', 'îngrijire personală', '2025-05-10', '2025-05-16', 18, 'Lidl'),
('hârtie igienică 3 straturi', 'Zewa', 10, 'role', 'produse de menaj', '2025-05-08', '2025-05-14', 10, 'Lidl'),
('ciocolată neagră 70%', 'Fin Carre', 100, 'g', 'gustări', '2025-05-09', '2025-05-15', 12, 'Lidl'),
('cartofi albi', 'Lidl', 1, 'kg', 'legume și fructe', '2025-05-10', '2025-05-16', 6, 'Lidl'),
('mălai extra', 'Pambac', 1, 'kg', 'alimente de bază', '2025-05-08', '2025-05-14', 5, 'Lidl'),
('file somon', 'Lidl', 0.2, 'kg', 'pește', '2025-05-09', '2025-05-15', 10, 'Lidl'),
('cremă de brânză', 'Almette', 0.15, 'kg', 'lactate', '2025-05-10', '2025-05-16', 8, 'Lidl');

INSERT INTO discount (product_name, brand, package_quantity, package_unit, product_category, from_date, to_date, percentage_of_discount, store) VALUES
('iaurt grecesc', 'Proxi', 0.4, 'kg', 'lactate', '2025-05-08', '2025-05-14', 9, 'Profi'),
('ouă mărimea M', 'Din Ogradă', 10, 'buc', 'ouă', '2025-05-08', '2025-05-14', 10, 'Profi'),
('spaghetti nr.5', 'Barilla', 500, 'g', 'paste făinoase', '2025-05-09', '2025-05-15', 15, 'Profi'),
('apă plată', 'Aqua Carpatica', 2, 'l', 'băuturi', '2025-05-10', '2025-05-16', 7, 'Profi'),
('ulei floarea-soarelui', 'Spornic', 1, 'l', 'alimente de bază', '2025-05-08', '2025-05-14', 6, 'Profi'),
('detergent lichid', 'Dero', 2.5, 'l', 'produse de menaj', '2025-05-09', '2025-05-15', 18, 'Profi'),
('hârtie igienică 3 straturi', 'Motto', 10, 'role', 'produse de menaj', '2025-05-10', '2025-05-16', 12, 'Profi'),
('vin alb demisec', 'Cotnari', 0.75, 'l', 'băuturi', '2025-05-08', '2025-05-14', 10, 'Profi'),
('morcovi', 'Generic', 0.5, 'kg', 'legume și fructe', '2025-05-09', '2025-05-15', 5, 'Profi'),
('orez bob lung', 'Deroni', 1, 'kg', 'alimente de bază', '2025-05-10', '2025-05-16', 8, 'Profi'),
('iaurt de băut', 'Activia', 0.33, 'kg', 'lactate', '2025-05-08', '2025-05-14', 10, 'Profi'),
('pastă de dinți', 'Colgate', 100, 'ml', 'îngrijire personală', '2025-05-09', '2025-05-15', 15, 'Profi'),
('bere blondă', 'Ursus', 0.5, 'l', 'băuturi', '2025-05-10', '2025-05-16', 6, 'Profi');

INSERT INTO discount (product_name, brand, package_quantity, package_unit, product_category, from_date, to_date, percentage_of_discount, store) VALUES
('lapte zuzu', 'Zuzu', 1, 'l', 'lactate', '2025-05-08', '2025-05-14', 9, 'Kaufland'),
('ouă mărimea M', 'Ferma Veche', 10, 'buc', 'ouă', '2025-05-08', '2025-05-14', 11, 'Kaufland'),
('pâine albă', 'K-Classic', 500, 'g', 'panificație', '2025-05-09', '2025-05-15', 7, 'Kaufland'),
('zahăr tos', 'Mărgăritar', 1, 'kg', 'alimente de bază', '2025-05-10', '2025-05-16', 6, 'Kaufland'),
('ulei floarea-soarelui', 'Floriol', 1, 'l', 'alimente de bază', '2025-05-08', '2025-05-14', 8, 'Kaufland'),
('biscuiți cu unt', 'Milka', 0.2, 'kg', 'gustări', '2025-05-09', '2025-05-15', 12, 'Kaufland'),
('cafea măcinată', 'Jacobs', 0.25, 'kg', 'cafea', '2025-05-10', '2025-05-16', 11, 'Kaufland'),
('hârtie igienică 3 straturi', 'Pufina', 10, 'role', 'produse de menaj', '2025-05-08', '2025-05-14', 13, 'Kaufland'),
('piper negru măcinat', 'Fuchs', 50, 'g', 'condimente', '2025-05-09', '2025-05-15', 10, 'Kaufland'),
('ceapă galbenă', 'Generic', 1, 'kg', 'legume și fructe', '2025-05-10', '2025-05-16', 5, 'Kaufland'),
('suc portocale', 'Santorini', 1, 'l', 'băuturi', '2025-05-08', '2025-05-14', 9, 'Kaufland'),
('cașcaval', 'K-Classic', 0.25, 'kg', 'lactate', '2025-05-09', '2025-05-15', 12, 'Kaufland');




CREATE TABLE price_alert (
                id BIGINT PRIMARY KEY AUTO_INCREMENT,
                product_name VARCHAR(255) NOT NULL,
                target_price  DECIMAL(10, 2),
                active BIT NOT NULL
);