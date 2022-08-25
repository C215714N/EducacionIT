## INNER JOIN: Solamente los registros coincidentes
### Todos los productos con los nombres de marca y categoria
SELECT 
	p.product_id, p.product_name, -- tabla productos
    b.brand_name, -- tabla marcas
    c.category_name -- tabla categorias
FROM products AS p
JOIN brands AS b ON b.brand_id = p.brand 
JOIN categories AS c ON c.category_id = p.category;

## OUTTER JOIN: Todos los registros de una tabla y solo las coincidencias de otra
### Todas las categorias que no tengan asociado un producto
SELECT 
	c.category_id,
    c.category_name,
    COUNT(p.product_name) AS total -- cantidad de productos
FROM categories AS c
LEFT JOIN products AS p ON p.category = c.category_id -- todos los registros de categoria
GROUP BY category_id -- agrupacion por numero de ID
HAVING total = 0; -- clausula para campos que no existen en las tablas

## Todas las Marcas que no tienen producto asociado
SELECT 
	b.brand_id,
    b.brand_name,
    COUNT(p.product_id) AS total
FROM products AS p
RIGHT JOIN brands AS b ON b.brand_id = p.brand
GROUP BY brand_id
HAVING total = 0;

## CROSS JOIN: A cada registro de una tabla le corresponden todos los de la otra
### Todas las combinaciones de usuarios y productos
SELECT 
	u.username,
    p.product_name
FROM users AS u
JOIN products AS p
ORDER BY username, product_name;