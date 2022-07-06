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


/* CROSS JOIN: Producto cartesiano de 2 tablas*/
## Todas las combinaciones de clientes y productos que pueden comprar
SELECT 
	CONCAT_WS(' ', last_name, first_name) AS customer,
    product_name
FROM products
CROSS JOIN customers
ORDER BY customer;