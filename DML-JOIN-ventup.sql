/*Data Manipulation Language
	JOIN consulta registros de multiples tablas
*/
/* Tabla Usuarios */
    ## Publicaciones por usuario
	SELECT
		user_id, user_name, user_email, -- tabla usuarios
		post_title, price, stock -- tabla publicaciones
    FROM users
    LEFT JOIN posts -- tabla anidada (coincidencias)
		ON user = user_id; -- Campo relacional
    
    ## Cantidad de Publicaciones de cada Usuario
	SELECT
		user_id, user_name, -- Tabla usuarios
		count(post_id) AS publicaciones -- campo calculado de publicaciones
    FROM users
    LEFT JOIN posts -- tabla anidada (coincidencias)
		ON user = user_id
    GROUP BY user_id; -- agrupacion por grupos

/* Tabla Productos */
	## Productos de Todas las categorias (existan o no)
    SELECT 
		product_id, p.description AS product, -- tabla productos
        c.description AS category -- tabla categorias
	FROM products AS p
    RIGHT JOIN categories AS c -- tabla anidada (completa)
		ON cat_id = category
    ORDER BY c.description; -- ordernado por categoria
	
    ## Total de productos por categoria
    SELECT 
		c.description AS category, -- campos de categorias
		count(product_id) AS products -- campo calculado de productos
	FROM products AS p
	RIGHT JOIN categories AS c -- tabla anidada (completa)
		ON cat_id = category
    GROUP BY cat_id -- agrupacion por grupos
    ORDER BY c.description; -- orden de resultados
    
/* Tabla Publicaciones */
	SELECT 
		post_id, -- publicaciones
        user_name AS salesman, -- vendedor
        description AS product, -- producto
        price, stock -- contabilidad
    FROM posts 
    JOIN users ON user = user_id 
    JOIN products ON product = product_id
    ORDER BY post_id;

/* Tabla Ventas */
	SELECT 
		sale_id,
        u.user_name AS comprador,
        us.user_name AS vendedor,
        post_title,
        bill_title,
        quantity,
        s.price
    FROM sales AS s
    JOIN users AS u ON s.user = u.user_id
    JOIN posts AS p ON s.post = p.post_id
    JOIN billing AS b ON s.bill = b.bill_id
    JOIN users AS us ON p.user = us.user_id
    ORDER BY sale_id;