/*DATA MANIPULATION LANGUAGE - JOIN*/
## INNER JOIN: todos los registros que posean coincidencia en ambas tablas
-- ventas
SELECT 
	sale,
    CONCAT(last_name,' ', first_name) AS client, -- tabla customers_data
    description AS article, -- tabla products
    CONCAT(sd.price, ' x ', sd.quantity, 'u') AS detail,
    sd.price * sd.quantity AS total
FROM sales_detail AS sd
JOIN products AS p ON product_id = product -- campo en comun
JOIN sales AS s ON sale = sale_id -- campo en comun
JOIN customers_data AS cd ON cd.customer = s.customer -- campo en comun
ORDER BY sale;

SELECT 
	CONCAT('sr/a: ', last_name,' ',first_name) AS client,
    SUBSTRING(cuit,4,8) AS du, -- extrae caracteres de un texto (texto, inicio, cantidad)
    pay_method,
    total,
    CONCAT('tel: ', phone, ' - correo: ', customer_email) AS contact_data,
    sale_date
FROM customers_data AS cd
JOIN sales AS s ON s.customer = cd.customer
JOIN customers ON customer_id = cd.customer;

## LEFT JOIN: todos los registros de la tabla base y las coincidencia de la anidada
-- proveedores
SELECT 
	CONCAT(cuit, ' - ', description) AS corporation,
    SUM(t.price * t.quantity) AS total -- pago total a proveedores
FROM providers AS p
LEFT JOIN transactions AS t ON provider_id = provider -- tabla anidada
GROUP BY provider
ORDER BY cuit;

SELECT
	description AS article,
    SUM(t.quantity * t.price) AS total
FROM products
LEFT JOIN transactions AS t ON product = product_id
GROUP BY product;

## RIGHT JOIN: las coincidencias de la tabla base y todos los registros de la anidada
-- proveedores
SELECT 
	transaction_id AS ticket,
    prov.description AS enterprise, -- tabla providers
    prod.description AS article, -- tabla products
    CONCAT(t.price, ' x ', t.quantity, 'u') AS detail,
    t.price * t.quantity AS total
FROM transactions AS t
RIGHT JOIN providers AS prov ON provider_id = provider -- anidacion de tabla
RIGHT JOIN products AS prod ON product_id = product -- anidacion de tabla
WHERE transaction_id IS NULL;

-- ventas
SELECT
	CONCAT(last_name, ' ',first_name) AS client, -- customers_data
    s.sale_id AS ticket,
    pay_method,
    total
FROM sales AS s
RIGHT JOIN customers_data AS cd ON cd.customer = s.customer -- anidacion de tabla
ORDER BY sale_id; -- orden de registros

## Recreacion de tablas
-- clientes
SHOW CREATE TABLE customers;
SHOW CREATE TABLE customers_data;
SHOW CREATE TABLE wallets;
-- productos
SHOW CREATE TABLE products;
-- proveedores
SHOW CREATE TABLE providers;
SHOW CREATE TABLE transactions;
-- ventas
SHOW CREATE TABLE sales;
SHOW CREATE TABLE sales_detail;