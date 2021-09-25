/*DML - Data Manipulation Language - JOIN*/
/*	LEFT JOIN: Todos los datos de la TABLA BASE 
	(Todos los usuarios hayan o no comprado productos) */
	SELECT 
    -- users
		user_name,
        user_email,
	-- products
		prod.product,
	-- sales
        s.price,
        s.quantity,
        wallet
	FROM users AS u
    LEFT JOIN sales AS s ON user_id = user -- Prioridad: Usuarios
    LEFT JOIN posts AS p ON p.post_id = s.post -- Prioridad: Ventas
    LEFT JOIN products AS prod ON prod.product_id = p.product; -- Prioridad: Publicaciones
    
/* 	RIGHT JOIN: Todos los datos de la TABLA ANIDADA 
	(Pubicaciones existan o no de Todos los productos y categorias ) */
	SELECT 
	-- posts
		post_title,
        price,
        quantity,
	-- products
        prod.product,
	-- categories
        description
	FROM posts AS p
    RIGHT JOIN products AS prod ON p.product = prod.product_id -- Prioridad: Productos
    RIGHT JOIN categories AS c ON c.cat_id = prod.category; -- Prioridad Categorias
    
/* 	INNER JOIN: Todos los datos coincidentes 
	(Usuarios que realizaron compras en alguna publicacion y sus metodos de pago) */
	SELECT 
	-- users 
		user_name, 
		user_email,
	-- posts 
		post_title, 
		post_detail,
	-- wallets 
		title, 
		detail,
	-- sales
		s.quantity, 
		p.price, 
		p.price * s.quantity AS total, 
		sale_date, 
		state
	FROM sales AS s
	JOIN users AS u ON s.user = u.user_id -- Relacion: Ventas
	JOIN posts AS p ON s.post = p.post_id -- Relacion: Pulicaciones
	JOIN wallets AS w ON s.wallet = w.wallet_id; -- Relacion: Billeteras