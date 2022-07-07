USE negocio_it;
/* Inner Join: Todos los registros con valores en comun */
## Productos con su marca correspondiente
SELECT 
	product_id,
    product_name,
    brand_name
FROM products
INNER JOIN brands
ON brand_id = brand
ORDER BY brand_name, product_name;

/*OUTER JOIN: Registros de una tabla y coincidencias de otra*/
## Detalle de las Marcas sin Productos asociados
SELECT 
	brand_id,
    brand_name,
    product_name,
    stock,
    price
FROM brands
LEFT JOIN products ON brand_id = brand;

## Cantidad Total de Marcas sin producto asociado
SELECT COUNT(*) AS brands FROM brands
LEFT JOIN products ON brand_id = brand
WHERE product_id IS NULL;

## Clientes que no hayan realizado compras
SELECT 
    CONCAT_WS(' ', last_name, first_name) AS client,
    cuit
FROM customers AS c
JOIN sales AS s ON c.customer_id = s.customer
WHERE sale_id IS NULL;
SELECT * FROM sales_detail;
SELECT 
	sale_id,
    sale_date,
	pay_method,
	-- cliente
    concat_ws(' ', last_name, first_name,'- cuit:', cuit) AS client_data,
    -- producto
    CONCAT_WS(' ', product_name,"restan:",stock) AS product_data,
    -- detalle de venta
    CONCAT_WS('x', sd.price, quantity) AS sale_detail,
    sd.price * quantity AS total
FROM sales_detail AS sd
JOIN sales AS s ON s.sale_id = sd.sale
JOIN products AS p ON p.product_id = sd.product
JOIN customers AS c ON c.customer_id = s.customer;

## Todas las categorias, productos asociados y detalles correspondientes (si existen)
SELECT DISTINCT
	category_id,
    category_name,
    product_name,
    p.price,
    stock,
    sale,
    sale_date
FROM products AS p
RIGHT JOIN categories AS c ON c.category_id = p.category
LEFT JOIN sales_detail AS sd ON sd.product = p.product_id
LEFT JOIN sales AS s ON s.sale_id = sd.sale
ORDER BY sale, product_name;

## Cantidad de categorias sin productos y/o Productos que no se vendieron
SELECT DISTINCT
	count(category_id) AS total,
    category_name,
    GROUP_CONCAT(product_name) AS product_list,
    sale
FROM sales_detail AS sd
RIGHT JOIN products AS p ON p.product_id = sd.product
RIGHT JOIN categories AS c ON c.category_id = p.category
GROUP BY category, sale
HAVING sale IS NULL
ORDER BY sale, category;

/* CROSS JOIN: Producto cartesiano de 2 tablas*/
## Todas las combinaciones de clientes y productos que pueden comprar
SELECT 
	CONCAT_WS(' ', last_name, first_name) AS customer,
    product_name
FROM products
CROSS JOIN customers
ORDER BY customer;