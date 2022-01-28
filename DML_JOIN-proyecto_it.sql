/* Tabla Categorias */
	## LEFT JOIN: Todas las Categorias tengan o no productos asignados
	SELECT 
		description,
		product
	FROM categories AS c -- tabla prioritaria
	LEFT JOIN products AS p ON c.cat_id = p.category; -- tabla anidada: productos
    
/* Tabla Publicaciones */    
	## RIGHT JOIN: Todos los productos y categorias que no posean publicacion
	SELECT 
		post_id, -- posts
		pr.product, -- products
		c.description, -- categories
		post_title,	stock, price -- posts
	FROM posts AS p -- tabla base (publicaciones)
	RIGHT JOIN products AS pr ON pr.product_id = p.product -- prioridad (productos)
	RIGHT JOIN categories AS c ON c.cat_id = pr.category -- prioridad (categorias)
    ORDER BY post_id;

	## INNER JOIN: Solamente los Productos y Usuarios que posean Publicacion
    SELECT 
		post_id, -- posts
		user_name AS user, -- users
        pr.product, -- products 
        description AS category, -- categories
        post_title, stock, price -- posts
	FROM posts AS p -- tabla base (publicaciones)
    JOIN users AS u ON u.user_id = p.user -- coincidencias (usuarios)
    JOIN products AS pr ON pr.product_id = p.product -- coincidencias (productos)
    JOIN categories AS c ON c.cat_id = pr.category; -- coincidencias (categorias)
    
/* Tabla Ventas */
	## INNER JOIN: Datos Usuarios y Billeteras por Ventas (Publicaciones)
	SELECT 
		sale_id,
		u.user_name AS customer, -- users
        s.price, quantity, (s.price * quantity) AS total, -- sales
        w.wallet_title AS wallet, -- wallets
        post_title, us.user_name AS vendor, -- posts
        sale_date -- sales
    FROM sales AS s -- tabla base (ventas)
    JOIN users AS u ON u.user_id = s.user -- coincidencias (usuarios: Ventas)
    JOIN posts AS p ON p.post_id = s.post -- coincidencias (publicaciones)
    JOIN users AS us ON us.user_id = p.user -- coincidencias (usuarios: Publicacion)
    JOIN wallets AS w ON w.wallet_id = s.wallet -- coincidencias (Billeteras)
    ORDER BY sale_id;