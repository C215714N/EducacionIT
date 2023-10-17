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
FROM product_categories AS pc -- tabla base para la union
JOIN products AS p ON p.id = pc.product -- unimos la tabla productos
JOIN categories AS c ON c.id = pc.category; -- unimos la tabla categorias

# Usuarios que compraron en alguna publicacion
SELECT 
    CONCAT('sr/a: ', lastname, ' ', firstname) AS customer, -- concatena textualmente los contenidos
    CONCAT_WS(" - ", id_type, gender, id_number) AS identity, -- agrega un separador por cada concatenacion
	p.title, -- tabla publicaciones
    s.price, s.quantity, s.price * s.quantity AS total, sale_date -- tabla ventas y calculo de total
FROM sales AS s
JOIN posts AS p ON p.id = s.post
JOIN users_data AS ud ON ud.user = s.user;

/* OUTTER */


/* CROSS: */