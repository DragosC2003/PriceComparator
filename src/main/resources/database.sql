
CREATE TABLE product (
                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                         product_id VARCHAR(10),
                         product_name VARCHAR(255),
                         product_category VARCHAR(100),
                         brand VARCHAR(100),
                         package_quantity DECIMAL(10, 2),
                         package_unit VARCHAR(20),
                         price DECIMAL(10, 2),
                         currency VARCHAR(10)

);

-- Insert product records
INSERT INTO product (product_id, product_name, product_category, brand, package_quantity, package_unit, price, currency) VALUES
                                                                                                                             ('P001', 'lapte zuzu', 'lactate', 'Zuzu', 1, 'l', 10.10, 'RON'),
                                                                                                                             ('P003', 'iaurt grecesc', 'lactate', 'Olympus', 0.4, 'kg', 11.80, 'RON'),
                                                                                                                             ('P006', 'ouă mărimea M', 'ouă', 'Ferma Veche', 10, 'buc', 13.50, 'RON'),
                                                                                                                             ('P009', 'brânză telemea', 'lactate', 'Hochland', 0.3, 'kg', 13.10, 'RON'),
                                                                                                                             ('P012', 'pâine albă', 'panificație', 'K-Classic', 500, 'g', 3.60, 'RON'),
                                                                                                                             ('P015', 'roșii cherry', 'legume și fructe', 'K-Bio', 250, 'g', 7.00, 'RON'),
                                                                                                                             ('P018', 'piept pui', 'carne', 'Agricola', 1, 'kg', 27.90, 'RON'),
                                                                                                                             ('P020', 'spaghetti nr.5', 'paste făinoase', 'Barilla', 500, 'g', 5.90, 'RON'),
                                                                                                                             ('P022', 'zahăr tos', 'alimente de bază', 'Mărgăritar', 1, 'kg', 4.50, 'RON'),
                                                                                                                             ('P025', 'apă plată', 'băuturi', 'Dorna', 2, 'l', 5.30, 'RON'),
                                                                                                                             ('P027', 'banane', 'legume și fructe', 'Generic', 1, 'kg', 6.20, 'RON'),
                                                                                                                             ('P029', 'ulei floarea-soarelui', 'alimente de bază', 'Floriol', 1, 'l', 9.50, 'RON'),
                                                                                                                             ('P032', 'biscuiți cu unt', 'gustări', 'Milka', 0.2, 'kg', 7.50, 'RON'),
                                                                                                                             ('P035', 'cafea măcinată', 'cafea', 'Jacobs', 0.25, 'kg', 23.00, 'RON'),
                                                                                                                             ('P038', 'detergent lichid', 'produse de menaj', 'Ariel', 2.5, 'l', 50.50, 'RON'),
                                                                                                                             ('P041', 'șampon păr gras', 'îngrijire personală', 'Elseve', 400, 'ml', 18.00, 'RON'),
                                                                                                                             ('P044', 'hârtie igienică 3 straturi', 'produse de menaj', 'Pufina', 10, 'role', 19.20, 'RON'),
                                                                                                                             ('P047', 'piper negru măcinat', 'condimente', 'Fuchs', 50, 'g', 6.10, 'RON'),
                                                                                                                             ('P050', 'vin alb demisec', 'băuturi', 'Recas', 0.75, 'l', 24.00, 'RON'),
                                                                                                                             ('P053', 'ciocolată neagră 70%', 'gustări', 'Heidi', 100, 'g', 4.10, 'RON'),
                                                                                                                             ('P056', 'cartofi albi', 'legume și fructe', 'Generic', 1, 'kg', 3.20, 'RON'),
                                                                                                                             ('P058', 'ceapă galbenă', 'legume și fructe', 'Generic', 1, 'kg', 2.90, 'RON'),
                                                                                                                             ('P059', 'morcovi', 'legume și fructe', 'Generic', 0.5, 'kg', 2.50, 'RON'),
                                                                                                                             ('P060', 'suc portocale', 'băuturi', 'Cappy', 1, 'l', 7.80, 'RON'),
                                                                                                                             ('P062', 'cașcaval', 'lactate', 'Delaco', 0.25, 'kg', 15.00, 'RON');
INSERT INTO product (product_id, product_name, product_category, brand, package_quantity, package_unit, price, currency,store) VALUES
                                                                                                                                   ('P001', 'lapte zuzu', 'lactate', 'Zuzu', 1, 'l', 9.90, 'RON', 'Lidl'),
                                                                                                                                   ('P002', 'iaurt grecesc', 'lactate', 'Lidl', 0.4, 'kg', 11.50, 'RON', 'Lidl'),
                                                                                                                                   ('P005', 'ouă mărimea M', 'ouă', 'Lidl', 10, 'buc', 13.20, 'RON', 'Lidl'),
                                                                                                                                   ('P008', 'brânză telemea', 'lactate', 'Pilos', 0.3, 'kg', 12.80, 'RON', 'Lidl'),
                                                                                                                                   ('P011', 'pâine albă', 'panificație', 'Lidl', 500, 'g', 3.50, 'RON', 'Lidl'),
                                                                                                                                   ('P014', 'roșii cherry', 'legume și fructe', 'Lidl', 250, 'g', 6.80, 'RON', 'Lidl'),
                                                                                                                                   ('P017', 'piept pui', 'carne', 'Lidl', 1, 'kg', 28.50, 'RON', 'Lidl'),
                                                                                                                                   ('P020', 'spaghetti nr.5', 'paste făinoase', 'Barilla', 500, 'g', 5.80, 'RON', 'Lidl'),
                                                                                                                                   ('P021', 'zahăr tos', 'alimente de bază', 'Lidl', 1, 'kg', 4.40, 'RON', 'Lidl'),
                                                                                                                                   ('P024', 'apă plată', 'băuturi', 'Aqua Carpatica', 2, 'l', 5.20, 'RON', 'Lidl'),
                                                                                                                                   ('P026', 'banane', 'legume și fructe', 'Lidl', 1, 'kg', 6.10, 'RON', 'Lidl'),
                                                                                                                                   ('P028', 'ulei floarea-soarelui', 'alimente de bază', 'Bunica', 1, 'l', 9.20, 'RON', 'Lidl'),
                                                                                                                                   ('P031', 'biscuiți cu unt', 'gustări', 'Deluxe', 0.2, 'kg', 7.10, 'RON', 'Lidl'),
                                                                                                                                   ('P034', 'cafea măcinată', 'cafea', 'Davidoff', 0.25, 'kg', 22.40, 'RON', 'Lidl'),
                                                                                                                                   ('P037', 'detergent lichid', 'produse de menaj', 'Persil', 2.5, 'l', 49.90, 'RON', 'Lidl'),
                                                                                                                                   ('P040', 'șampon păr gras', 'îngrijire personală', 'Head & Shoulders', 400, 'ml', 17.80, 'RON', 'Lidl'),
                                                                                                                                   ('P043', 'hârtie igienică 3 straturi', 'produse de menaj', 'Zewa', 10, 'role', 18.90, 'RON', 'Lidl'),
                                                                                                                                   ('P046', 'piper negru măcinat', 'condimente', 'Kotanyi', 50, 'g', 6.00, 'RON', 'Lidl'),
                                                                                                                                   ('P049', 'vin alb demisec', 'băuturi', 'Jidvei', 0.75, 'l', 23.50, 'RON', 'Lidl'),
                                                                                                                                   ('P052', 'ciocolată neagră 70%', 'gustări', 'Fin Carre', 100, 'g', 3.90, 'RON', 'Lidl');
INSERT INTO product (product_id, product_name, product_category, brand, package_quantity, package_unit, price, currency, store) VALUES
                                                                                                                                    ('P001', 'lapte zuzu', 'lactate', 'Zuzu', 1, 'l', 12.90, 'RON', 'Profi'),
                                                                                                                                    ('P002', 'iaurt grecesc', 'lactate', 'Lidl', 0.4, 'kg', 11.50, 'RON', 'Profi'),
                                                                                                                                    ('P005', 'ouă mărimea M', 'ouă', 'Lidl', 10, 'buc', 12.20, 'RON', 'Profi'),
                                                                                                                                    ('P008', 'brânză telemea', 'lactate', 'Pilos', 0.3, 'kg', 12.80, 'RON', 'Profi'),
                                                                                                                                    ('P011', 'pâine albă', 'panificație', 'Lidl', 500, 'g', 3.50, 'RON', 'Profi'),
                                                                                                                                    ('P014', 'roșii cherry', 'legume și fructe', 'Lidl', 250, 'g', 8.80, 'RON', 'Profi'),
                                                                                                                                    ('P017', 'piept pui', 'carne', 'Lidl', 1, 'kg', 26.50, 'RON', 'Profi'),
                                                                                                                                    ('P020', 'spaghetti nr.5', 'paste făinoase', 'Barilla', 500, 'g', 5.80, 'RON', 'Profi'),
                                                                                                                                    ('P021', 'zahăr tos', 'alimente de bază', 'Lidl', 1, 'kg', 4.40, 'RON', 'Profi'),
                                                                                                                                    ('P024', 'apă plată', 'băuturi', 'Aqua Carpatica', 2, 'l', 5.20, 'RON', 'Profi'),
                                                                                                                                    ('P026', 'banane', 'legume și fructe', 'Lidl', 1, 'kg', 6.10, 'RON', 'Profi'),
                                                                                                                                    ('P028', 'ulei floarea-soarelui', 'alimente de bază', 'Bunica', 1, 'l', 9.20, 'RON', 'Profi'),
                                                                                                                                    ('P031', 'biscuiți cu unt', 'gustări', 'Deluxe', 0.2, 'kg', 7.10, 'RON', 'Profi'),
                                                                                                                                    ('P034', 'cafea măcinată', 'cafea', 'Davidoff', 0.25, 'kg', 22.40, 'RON', 'Profi'),
                                                                                                                                    ('P037', 'detergent lichid', 'produse de menaj', 'Persil', 2.5, 'l', 49.90, 'RON', 'Profi'),
                                                                                                                                    ('P040', 'șampon păr gras', 'îngrijire personală', 'Head & Shoulders', 400, 'ml', 17.80, 'RON', 'Profi'),
                                                                                                                                    ('P043', 'hârtie igienică 3 straturi', 'produse de menaj', 'Zewa', 10, 'role', 18.90, 'RON', 'Profi'),
                                                                                                                                    ('P046', 'piper negru măcinat', 'condimente', 'Kotanyi', 50, 'g', 6.00, 'RON', 'Profi'),
                                                                                                                                    ('P049', 'vin alb demisec', 'băuturi', 'Jidvei', 0.75, 'l', 23.50, 'RON', 'Profi'),
                                                                                                                                    ('P052', 'ciocolată neagră 70%', 'gustări', 'Fin Carre', 100, 'g', 3.90, 'RON', 'Profi');

INSERT INTO product (product_id, product_name, product_category, brand, package_quantity, package_unit, price, currency, store, data) VALUES
                                                                                                                                          ('P001', 'lapte zuzu', 'lactate', 'Zuzu', 1, 'l', 9.80, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P002', 'iaurt grecesc', 'lactate', 'Lidl', 0.4, 'kg', 11.60, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P005', 'ouă mărimea M', 'ouă', 'Lidl', 10, 'buc', 13.10, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P008', 'brânză telemea', 'lactate', 'Pilos', 0.3, 'kg', 12.90, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P011', 'pâine albă', 'panificație', 'Lidl', 500, 'g', 3.40, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P014', 'roșii cherry', 'legume și fructe', 'Lidl', 250, 'g', 6.90, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P017', 'piept pui', 'carne', 'Lidl', 1, 'kg', 28.90, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P020', 'spaghetti nr.5', 'paste făinoase', 'Barilla', 500, 'g', 5.70, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P021', 'zahăr tos', 'alimente de bază', 'Lidl', 1, 'kg', 4.30, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P024', 'apă plată', 'băuturi', 'Aqua Carpatica', 2, 'l', 5.10, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P026', 'banane', 'legume și fructe', 'Lidl', 1, 'kg', 6.00, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P028', 'ulei floarea-soarelui', 'alimente de bază', 'Bunica', 1, 'l', 9.30, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P031', 'biscuiți cu unt', 'gustări', 'Deluxe', 0.2, 'kg', 7.00, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P034', 'cafea măcinată', 'cafea', 'Davidoff', 0.25, 'kg', 22.60, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P037', 'detergent lichid', 'produse de menaj', 'Persil', 2.5, 'l', 49.50, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P040', 'șampon păr gras', 'îngrijire personală', 'Head & Shoulders', 400, 'ml', 17.90, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P043', 'hârtie igienică 3 straturi', 'produse de menaj', 'Zewa', 10, 'role', 18.80, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P046', 'piper negru măcinat', 'condimente', 'Kotanyi', 50, 'g', 6.05, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P049', 'vin alb demisec', 'băuturi', 'Jidvei', 0.75, 'l', 23.30, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P052', 'ciocolată neagră 70%', 'gustări', 'Fin Carre', 100, 'g', 3.80, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P055', 'cartofi albi', 'legume și fructe', 'Lidl', 1, 'kg', 3.00, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P057', 'ceapă galbenă', 'legume și fructe', 'Lidl', 1, 'kg', 2.80, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P064', 'mălai extra', 'alimente de bază', 'Pambac', 1, 'kg', 5.50, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P065', 'file somon', 'pește', 'Lidl', 0.2, 'kg', 25.00, 'RON', 'Lidl', '2025-05-08'),
                                                                                                                                          ('P066', 'cremă de brânză', 'lactate', 'Almette', 0.15, 'kg', 8.50, 'RON', 'Lidl', '2025-05-08');

INSERT INTO product (product_id, product_name, product_category, brand, package_quantity, package_unit, price, currency, store, data) VALUES
                                                                                                                                          ('P001', 'lapte zuzu', 'lactate', 'Zuzu', 1, 'l', 13.00, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P004', 'iaurt grecesc', 'lactate', 'Proxi', 0.4, 'kg', 11.40, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P007', 'ouă mărimea M', 'ouă', 'Din Ogradă', 10, 'buc', 12.50, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P010', 'brânză telemea', 'lactate', 'Proxi', 0.3, 'kg', 12.70, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P013', 'pâine albă', 'panificație', 'Proxi', 500, 'g', 3.60, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P016', 'roșii cherry', 'legume și fructe', 'Generic', 250, 'g', 8.70, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P019', 'piept pui', 'carne', 'Avicola', 1, 'kg', 26.80, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P020', 'spaghetti nr.5', 'paste făinoase', 'Barilla', 500, 'g', 5.90, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P023', 'zahăr tos', 'alimente de bază', 'Proxi', 1, 'kg', 4.50, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P024', 'apă plată', 'băuturi', 'Aqua Carpatica', 2, 'l', 5.30, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P027', 'banane', 'legume și fructe', 'Generic', 1, 'kg', 6.15, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P030', 'ulei floarea-soarelui', 'alimente de bază', 'Spornic', 1, 'l', 9.10, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P033', 'biscuiți cu unt', 'gustări', 'RoStar', 0.2, 'kg', 7.20, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P036', 'cafea măcinată', 'cafea', 'Tchibo', 0.25, 'kg', 22.00, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P039', 'detergent lichid', 'produse de menaj', 'Dero', 2.5, 'l', 48.90, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P042', 'șampon păr gras', 'îngrijire personală', 'Schauma', 400, 'ml', 17.50, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P045', 'hârtie igienică 3 straturi', 'produse de menaj', 'Motto', 10, 'role', 18.50, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P048', 'piper negru măcinat', 'condimente', 'Kamis', 50, 'g', 6.10, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P051', 'vin alb demisec', 'băuturi', 'Cotnari', 0.75, 'l', 23.00, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P054', 'ciocolată neagră 70%', 'gustări', 'Poiana', 100, 'g', 4.00, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P059', 'morcovi', 'legume și fructe', 'Generic', 0.5, 'kg', 2.60, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P067', 'orez bob lung', 'alimente de bază', 'Deroni', 1, 'kg', 8.00, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P068', 'iaurt de băut', 'lactate', 'Activia', 0.33, 'kg', 5.00, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P069', 'pastă de dinți', 'îngrijire personală', 'Colgate', 100, 'ml', 10.50, 'RON', 'Profi', '2025-05-08'),
                                                                                                                                          ('P070', 'bere blondă', 'băuturi', 'Ursus', 0.5, 'l', 3.80, 'RON', 'Profi', '2025-05-08');

INSERT INTO product (product_id, product_name, product_category, brand, package_quantity, package_unit, price, currency, store, data) VALUES
                                                                                                                                          ('P001', 'lapte zuzu', 'lactate', 'Zuzu', 1, 'l', 10.00, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P003', 'iaurt grecesc', 'lactate', 'Olympus', 0.4, 'kg', 11.70, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P006', 'ouă mărimea M', 'ouă', 'Ferma Veche', 10, 'buc', 13.60, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P009', 'brânză telemea', 'lactate', 'Hochland', 0.3, 'kg', 13.00, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P012', 'pâine albă', 'panificație', 'K-Classic', 500, 'g', 3.55, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P015', 'roșii cherry', 'legume și fructe', 'K-Bio', 250, 'g', 7.10, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P018', 'piept pui', 'carne', 'Agricola', 1, 'kg', 28.00, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P020', 'spaghetti nr.5', 'paste făinoase', 'Barilla', 500, 'g', 5.85, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P022', 'zahăr tos', 'alimente de bază', 'Mărgăritar', 1, 'kg', 4.45, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P025', 'apă plată', 'băuturi', 'Dorna', 2, 'l', 5.25, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P027', 'banane', 'legume și fructe', 'Generic', 1, 'kg', 6.25, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P029', 'ulei floarea-soarelui', 'alimente de bază', 'Floriol', 1, 'l', 9.60, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P032', 'biscuiți cu unt', 'gustări', 'Milka', 0.2, 'kg', 7.40, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P035', 'cafea măcinată', 'cafea', 'Jacobs', 0.25, 'kg', 23.10, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P038', 'detergent lichid', 'produse de menaj', 'Ariel', 2.5, 'l', 50.80, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P041', 'șampon păr gras', 'îngrijire personală', 'Elseve', 400, 'ml', 18.10, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P044', 'hârtie igienică 3 straturi', 'produse de menaj', 'Pufina', 10, 'role', 19.30, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P047', 'piper negru măcinat', 'condimente', 'Fuchs', 50, 'g', 6.15, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P050', 'vin alb demisec', 'băuturi', 'Recas', 0.75, 'l', 24.10, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P053', 'ciocolată neagră 70%', 'gustări', 'Heidi', 100, 'g', 4.15, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P056', 'cartofi albi', 'legume și fructe', 'Generic', 1, 'kg', 3.10, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P058', 'ceapă galbenă', 'legume și fructe', 'Generic', 1, 'kg', 2.95, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P059', 'morcovi', 'legume și fructe', 'Generic', 0.5, 'kg', 2.40, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P061', 'suc portocale', 'băuturi', 'Santorini', 1, 'l', 7.60, 'RON', 'Kaufland', '2025-05-08'),
                                                                                                                                          ('P063', 'cașcaval', 'lactate', 'K-Classic', 0.25, 'kg', 14.80, 'RON', 'Kaufland', '2025-05-08');





CREATE TABLE discount (
                          id BIGINT PRIMARY KEY AUTO_INCREMENT,
                          product_id VARCHAR(50) NOT NULL,
                          product_name VARCHAR(100) NOT NULL,
                          brand VARCHAR(100) NOT NULL,
                          package_quantity DOUBLE NOT NULL,
                          package_unit VARCHAR(10) NOT NULL,
                          product_category VARCHAR(100) NOT NULL,
                          from_date DATE NOT NULL,
                          to_date DATE NOT NULL,
                          percentage_of_discount DOUBLE NOT NULL
);

INSERT INTO discount (product_id, product_name, brand, package_quantity, package_unit, product_category, from_date, to_date, percentage_of_discount) VALUES
                                                                                                                                                         ('P001', 'lapte zuzu', 'Zuzu', 1, 'l', 'lactate', '2025-05-01', '2025-05-07', 8),
                                                                                                                                                         ('P010', 'brânză telemea', 'Proxi', 0.3, 'kg', 'lactate', '2025-05-01', '2025-05-07', 12),
                                                                                                                                                         ('P019', 'piept pui', 'Avicola', 1, 'kg', 'carne', '2025-05-02', '2025-05-08', 10),
                                                                                                                                                         ('P024', 'apă plată', 'Aqua Carpatica', 2, 'l', 'băuturi', '2025-05-03', '2025-05-09', 5),
                                                                                                                                                         ('P036', 'cafea măcinată', 'Tchibo', 0.25, 'kg', 'cafea', '2025-05-04', '2025-05-10', 15),
                                                                                                                                                         ('P039', 'detergent lichid', 'Dero', 2.5, 'l', 'produse de menaj', '2025-05-01', '2025-05-07', 20),
                                                                                                                                                         ('P042', 'șampon păr gras', 'Schauma', 400, 'ml', 'îngrijire personală', '2025-05-02', '2025-05-08', 10),
                                                                                                                                                         ('P054', 'ciocolată neagră 70%', 'Poiana', 100, 'g', 'gustări', '2025-05-03', '2025-05-09', 10),
                                                                                                                                                         ('P007', 'ouă mărimea M', 'Din Ogradă', 10, 'buc', 'ouă', '2025-05-04', '2025-05-10', 6),
                                                                                                                                                         ('P027', 'banane', 'Generic', 1, 'kg', 'legume și fructe', '2025-05-01', '2025-05-07', 7);


INSERT INTO discount (product_id, product_name, brand, package_quantity, package_unit, product_category, from_date, to_date, percentage_of_discount, store) VALUES
                                                                                                                                                                ('P001', 'lapte zuzu', 'Zuzu', 1, 'l', 'lactate', '2025-05-01', '2025-05-07', 10, 'Lidl'),
                                                                                                                                                                ('P008', 'brânză telemea', 'Pilos', 0.3, 'kg', 'lactate', '2025-05-01', '2025-05-07', 15, 'Lidl'),
                                                                                                                                                                ('P020', 'spaghetti nr.5', 'Barilla', 500, 'g', 'paste făinoase', '2025-05-03', '2025-05-09', 20, 'Lidl'),
                                                                                                                                                                ('P034', 'cafea măcinată', 'Davidoff', 0.25, 'kg', 'cafea', '2025-05-04', '2025-05-10', 12, 'Lidl'),
                                                                                                                                                                ('P011', 'pâine albă', 'Lidl', 500, 'g', 'panificație', '2025-05-02', '2025-05-08', 5, 'Lidl'),
                                                                                                                                                                ('P014', 'roșii cherry', 'Lidl', 250, 'g', 'legume și fructe', '2025-05-02', '2025-05-08', 8, 'Lidl'),
                                                                                                                                                                ('P037', 'detergent lichid', 'Persil', 2.5, 'l', 'produse de menaj', '2025-05-06', '2025-05-12', 25, 'Lidl'),
                                                                                                                                                                ('P040', 'șampon păr gras', 'Head & Shoulders', 400, 'ml', 'îngrijire personală', '2025-05-05', '2025-05-11', 15, 'Lidl'),
                                                                                                                                                                ('P049', 'vin alb demisec', 'Jidvei', 0.75, 'l', 'băuturi', '2025-05-01', '2025-05-07', 10, 'Lidl'),
                                                                                                                                                                ('P052', 'ciocolată neagră 70%', 'Fin Carre', 100, 'g', 'gustări', '2025-05-03', '2025-05-09', 18, 'Lidl'),
                                                                                                                                                                ('P024', 'apă plată', 'Aqua Carpatica', 2, 'l', 'băuturi', '2025-05-01', '2025-05-07', 5, 'Lidl'),
                                                                                                                                                                ('P005', 'ouă mărimea M', 'Lidl', 10, 'buc', 'ouă', '2025-05-04', '2025-05-10', 7, 'Lidl'),
                                                                                                                                                                ('P017', 'piept pui', 'Lidl', 1, 'kg', 'carne', '2025-05-02', '2025-05-08', 6, 'Lidl'),
                                                                                                                                                                ('P028', 'ulei floarea-soarelui', 'Bunica', 1, 'l', 'alimente de bază', '2025-05-05', '2025-05-11', 10, 'Lidl'),
                                                                                                                                                                ('P046', 'piper negru măcinat', 'Kotanyi', 50, 'g', 'condimente', '2025-05-06', '2025-05-12', 12, 'Lidl'),
                                                                                                                                                                ('P031', 'biscuiți cu unt', 'Deluxe', 0.2, 'kg', 'gustări', '2025-05-04', '2025-05-10', 9, 'Lidl'),
                                                                                                                                                                ('P043', 'hârtie igienică 3 straturi', 'Zewa', 10, 'role', 'produse de menaj', '2025-05-03', '2025-05-09', 14, 'Lidl'),
                                                                                                                                                                ('P026', 'banane', 'Lidl', 1, 'kg', 'legume și fructe', '2025-05-06', '2025-05-12', 6, 'Lidl'),
                                                                                                                                                                ('P002', 'iaurt grecesc', 'Lidl', 0.4, 'kg', 'lactate', '2025-05-05', '2025-05-11', 11, 'Lidl'),
                                                                                                                                                                ('P014', 'roșii cherry', 'Lidl', 250, 'g', 'legume și fructe', '2025-05-06', '2025-05-12', 5, 'Lidl');

INSERT INTO discount (product_id, product_name, brand, package_quantity, package_unit, product_category, from_date, to_date, percentage_of_discount, store) VALUES
                                                                                                                                                                    ('P003', 'iaurt grecesc', 'Olympus', 0.4, 'kg', 'lactate', '2025-05-01', '2025-05-07', 10, 'Kaufland'),
                                                                                                                                                                    ('P009', 'brânză telemea', 'Hochland', 0.3, 'kg', 'lactate', '2025-05-01', '2025-05-07', 10, 'Kaufland'),
                                                                                                                                                                    ('P018', 'piept pui', 'Agricola', 1, 'kg', 'carne', '2025-05-02', '2025-05-08', 12, 'Kaufland'),
                                                                                                                                                                    ('P020', 'spaghetti nr.5', 'Barilla', 500, 'g', 'paste făinoase', '2025-05-03', '2025-05-09', 18, 'Kaufland'),
                                                                                                                                                                    ('P035', 'cafea măcinată', 'Jacobs', 0.25, 'kg', 'cafea', '2025-05-04', '2025-05-10', 10, 'Kaufland'),
                                                                                                                                                                    ('P038', 'detergent lichid', 'Ariel', 2.5, 'l', 'produse de menaj', '2025-05-01', '2025-05-07', 22, 'Kaufland'),
                                                                                                                                                                    ('P041', 'șampon păr gras', 'Elseve', 400, 'ml', 'îngrijire personală', '2025-05-02', '2025-05-08', 12, 'Kaufland'),
                                                                                                                                                                    ('P050', 'vin alb demisec', 'Recas', 0.75, 'l', 'băuturi', '2025-05-03', '2025-05-09', 8, 'Kaufland'),
                                                                                                                                                                    ('P053', 'ciocolată neagră 70%', 'Heidi', 100, 'g', 'gustări', '2025-05-04', '2025-05-10', 15, 'Kaufland'),
                                                                                                                                                                    ('P056', 'cartofi albi', 'Generic', 1, 'kg', 'legume și fructe', '2025-05-01', '2025-05-07', 5, 'Kaufland'),
                                                                                                                                                                    ('P060', 'suc portocale', 'Cappy', 1, 'l', 'băuturi', '2025-05-02', '2025-05-08', 7, 'Kaufland'),
                                                                                                                                                                    ('P062', 'cașcaval', 'Delaco', 0.25, 'kg', 'lactate', '2025-05-03', '2025-05-09', 10, 'Kaufland');


INSERT INTO discount (
    product_id, product_name, brand, package_quantity, package_unit, product_category,
    from_date, to_date, percentage_of_discount, store,data
) VALUES
      ('P001', 'lapte zuzu', 'Zuzu', 1, 'l', 'lactate', '2025-05-08', '2025-05-14', 12, 'Lidl', '2025-05-08'),
      ('P008', 'brânză telemea', 'Pilos', 0.3, 'kg', 'lactate', '2025-05-08', '2025-05-14', 10, 'Lidl', '2025-05-08'),
      ('P017', 'piept pui', 'Lidl', 1, 'kg', 'carne', '2025-05-09', '2025-05-15', 8, 'Lidl', '2025-05-08'),
      ('P034', 'cafea măcinată', 'Davidoff', 0.25, 'kg', 'cafea', '2025-05-10', '2025-05-16', 15, 'Lidl', '2025-05-08'),
      ('P028', 'ulei floarea-soarelui', 'Bunica', 1, 'l', 'alimente de bază', '2025-05-08', '2025-05-14', 7, 'Lidl', '2025-05-08'),
      ('P037', 'detergent lichid', 'Persil', 2.5, 'l', 'produse de menaj', '2025-05-09', '2025-05-15', 20, 'Lidl', '2025-05-08'),
      ('P040', 'șampon păr gras', 'Head & Shoulders', 400, 'ml', 'îngrijire personală', '2025-05-10', '2025-05-16', 18, 'Lidl', '2025-05-08'),
      ('P043', 'hârtie igienică 3 straturi', 'Zewa', 10, 'role', 'produse de menaj', '2025-05-08', '2025-05-14', 10, 'Lidl', '2025-05-08'),
      ('P052', 'ciocolată neagră 70%', 'Fin Carre', 100, 'g', 'gustări', '2025-05-09', '2025-05-15', 12, 'Lidl', '2025-05-08'),
      ('P055', 'cartofi albi', 'Lidl', 1, 'kg', 'legume și fructe', '2025-05-10', '2025-05-16', 6, 'Lidl', '2025-05-08'),
      ('P064', 'mălai extra', 'Pambac', 1, 'kg', 'alimente de bază', '2025-05-08', '2025-05-14', 5, 'Lidl', '2025-05-08'),
      ('P065', 'file somon', 'Lidl', 0.2, 'kg', 'pește', '2025-05-09', '2025-05-15', 10, 'Lidl', '2025-05-08'),
      ('P066', 'cremă de brânză', 'Almette', 0.15, 'kg', 'lactate', '2025-05-10', '2025-05-16', 8, 'Lidl', '2025-05-08');
INSERT INTO discount (
    product_id, product_name, brand, package_quantity, package_unit, product_category,
    from_date, to_date, percentage_of_discount, store, data
) VALUES
      ('P004', 'iaurt grecesc', 'Proxi', 0.4, 'kg', 'lactate', '2025-05-08', '2025-05-14', 9, 'Profi', '2025-05-08'),
      ('P007', 'ouă mărimea M', 'Din Ogradă', 10, 'buc', 'ouă', '2025-05-08', '2025-05-14', 10, 'Profi', '2025-05-08'),
      ('P020', 'spaghetti nr.5', 'Barilla', 500, 'g', 'paste făinoase', '2025-05-09', '2025-05-15', 15, 'Profi', '2025-05-08'),
      ('P024', 'apă plată', 'Aqua Carpatica', 2, 'l', 'băuturi', '2025-05-10', '2025-05-16', 7, 'Profi', '2025-05-08'),
      ('P030', 'ulei floarea-soarelui', 'Spornic', 1, 'l', 'alimente de bază', '2025-05-08', '2025-05-14', 6, 'Profi', '2025-05-08'),
      ('P039', 'detergent lichid', 'Dero', 2.5, 'l', 'produse de menaj', '2025-05-09', '2025-05-15', 18, 'Profi', '2025-05-08'),
      ('P045', 'hârtie igienică 3 straturi', 'Motto', 10, 'role', 'produse de menaj', '2025-05-10', '2025-05-16', 12, 'Profi', '2025-05-08'),
      ('P051', 'vin alb demisec', 'Cotnari', 0.75, 'l', 'băuturi', '2025-05-08', '2025-05-14', 10, 'Profi', '2025-05-08'),
      ('P059', 'morcovi', 'Generic', 0.5, 'kg', 'legume și fructe', '2025-05-09', '2025-05-15', 5, 'Profi', '2025-05-08'),
      ('P067', 'orez bob lung', 'Deroni', 1, 'kg', 'alimente de bază', '2025-05-10', '2025-05-16', 8, 'Profi', '2025-05-08'),
      ('P068', 'iaurt de băut', 'Activia', 0.33, 'kg', 'lactate', '2025-05-08', '2025-05-14', 10, 'Profi', '2025-05-08'),
      ('P069', 'pastă de dinți', 'Colgate', 100, 'ml', 'îngrijire personală', '2025-05-09', '2025-05-15', 15, 'Profi', '2025-05-08'),
      ('P070', 'bere blondă', 'Ursus', 0.5, 'l', 'băuturi', '2025-05-10', '2025-05-16', 6, 'Profi', '2025-05-08');

INSERT INTO discount (
    product_id, product_name, brand, package_quantity, package_unit, product_category,
    from_date, to_date, percentage_of_discount, store, data
) VALUES
      ('P001', 'lapte zuzu', 'Zuzu', 1, 'l', 'lactate', '2025-05-08', '2025-05-14', 9, 'Kaufland', '2025-05-08'),
      ('P006', 'ouă mărimea M', 'Ferma Veche', 10, 'buc', 'ouă', '2025-05-08', '2025-05-14', 11, 'Kaufland', '2025-05-08'),
      ('P012', 'pâine albă', 'K-Classic', 500, 'g', 'panificație', '2025-05-09', '2025-05-15', 7, 'Kaufland', '2025-05-08'),
      ('P022', 'zahăr tos', 'Mărgăritar', 1, 'kg', 'alimente de bază', '2025-05-10', '2025-05-16', 6, 'Kaufland', '2025-05-08'),
      ('P029', 'ulei floarea-soarelui', 'Floriol', 1, 'l', 'alimente de bază', '2025-05-08', '2025-05-14', 8, 'Kaufland', '2025-05-08'),
      ('P032', 'biscuiți cu unt', 'Milka', 0.2, 'kg', 'gustări', '2025-05-09', '2025-05-15', 12, 'Kaufland', '2025-05-08'),
      ('P035', 'cafea măcinată', 'Jacobs', 0.25, 'kg', 'cafea', '2025-05-10', '2025-05-16', 11, 'Kaufland', '2025-05-08'),
      ('P044', 'hârtie igienică 3 straturi', 'Pufina', 10, 'role', 'produse de menaj', '2025-05-08', '2025-05-14', 13, 'Kaufland', '2025-05-08'),
      ('P047', 'piper negru măcinat', 'Fuchs', 50, 'g', 'condimente', '2025-05-09', '2025-05-15', 10, 'Kaufland', '2025-05-08'),
      ('P058', 'ceapă galbenă', 'Generic', 1, 'kg', 'legume și fructe', '2025-05-10', '2025-05-16', 5, 'Kaufland', '2025-05-08'),
      ('P061', 'suc portocale', 'Santorini', 1, 'l', 'băuturi', '2025-05-08', '2025-05-14', 9, 'Kaufland', '2025-05-08'),
      ('P063', 'cașcaval', 'K-Classic', 0.25, 'kg', 'lactate', '2025-05-09', '2025-05-15', 12, 'Kaufland', '2025-05-08');



