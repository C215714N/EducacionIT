/* INNER: Todos los elementos en comun */
## Publicaciones por usuarios
SELECT
    u.username, -- tabla Usuarios
    p.id, p.title, p.price, p.stock -- tabla publicaciones
FROM posts AS p
INNER JOIN users AS u ON u.id = p.user; -- factor comun

## Nombre de Producto por Categoria
SELECT
	pc.id, -- tabla categorias por productos
    p.name AS product, -- tabla productos
    c.name AS category -- tabla categorias
FROM product_categories AS pc -- tabla Base para la union
JOIN products AS p ON p.id = pc.product -- unimos la tabla productos
JOIN categories AS c ON c.id = pc.category; -- unimos la tabla categorias

## Usuarios que compraron en alguna publicacion
SELECT 
    CONCAT('sr/a: ', lastname, ' ', firstname) AS customer, -- concatena textualmente los contenidos
    CONCAT_WS(" - ", id_type, gender, id_number) AS identity, -- agrega un separador por cada concatenacion
	p.title, -- tabla publicaciones
    s.price, s.quantity, s.price * s.quantity AS total, sale_date -- tabla ventas y calculo de total
FROM sales AS s
JOIN posts AS p ON p.id = s.post
JOIN users_data AS ud ON ud.user = s.user;

/* OUTER: Todos los elementos de un grupo y las coincidencias del otro */
## Usuario que no realizaron publicaciones
SELECT username, email -- tabla usuarios
FROM posts AS p -- tabla Base
RIGHT JOIN users AS u ON u.id = p.user -- todos los registros de users
WHERE p.id IS NULL; -- no existe id de publicacion

## Productos que no fueron publicados
SELECT p.name, po.title -- tabla productos
FROM products AS p -- tabla Base
LEFT JOIN posts AS po ON po.product = p.id -- todos los registros de productos
WHERE po.id IS NULL;

## Usuarios que no realizaron compras
SELECT username, email -- tabla usuarios
FROM users AS u -- tabla Base
LEFT JOIN sales AS s ON s.user = u.id -- todos los registros de usuarios
WHERE s.id IS NULL; -- no debe existir id de venta

/* CROSS: Todos los registros de un grupo unidos a cada registro del otro */
## Posibles publicaciones de Productos por usuario
SELECT 	username, email, -- tabla usuarios
		name AS product -- tabla productos
FROM users -- tabla Base
CROSS JOIN products; -- tabla de union sin relacion

## Potenciales compras ordenadas por  clientes
SELECT 	username, email, -- tabla usuarios
		title, price, stock -- tabla Publicaciones
FROM posts 
JOIN users;