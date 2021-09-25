/*DML - Data Manipulation Language - JOIN*/
## LEFT JOIN: Todos los campos de la TABLA BASE
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
    LEFT JOIN sales AS s ON user_id = user
    LEFT JOIN posts AS p ON p.post_id = s.post
    LEFT JOIN products AS prod ON prod.product_id = p.product
    WHERE post IS NULL;
## RIGHT JOIN: Todos los campos de la TABLA ANIDADA
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
    RIGHT JOIN products AS prod ON p.product = prod.product_id
    RIGHT JOIN categories AS c ON c.cat_id = prod.category
    WHERE post_title IS NULL;
## INNER JOIN: Todos los campos coincidentes
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
	JOIN users AS u ON s.user = u.user_id
	JOIN posts AS p ON s.post = p.post_id
	JOIN wallets AS w ON s.wallet = w.wallet_id;