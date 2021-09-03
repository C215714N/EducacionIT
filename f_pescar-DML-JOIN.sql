/*DATA MANIPULATION LANGUAGE - JOIN*/

## inner Join (factor común) || Todas las ventas realizadas con detalle
	SELECT
		sale_id AS id,
    -- posts
		post_title,
	-- user_data (salesman)
		CONCAT(u.user_name, ": ", u.user_email) AS salesman,
        us.cuit AS salesman_data,
	-- product
		pr.product,
	-- users_data (client)
		CONCAT(ud.last_name, " ", ud.first_name) AS client,
        ud.cuit AS client_data,
    -- sales
        s.quantity AS unit,
        s.price,
        state,
        (s.quantity * s.price) AS total,
        date(sell_date) AS date
    FROM sales AS s
    JOIN posts AS p ON post_id = post
    JOIN products AS pr ON product_id = p.product
    JOIN users_data AS ud ON ud.user = s.user
    JOIN users_data AS us ON us.user = p.user
    JOIN users AS u ON u.user_id = us.user
    ORDER BY sale_id DESC;
## left Join (tabla base <= tabla anidada) || Todos los productos (hayan sido o no publicados)
	SELECT 
    -- products
		p.product,
	-- categories
        c.description,
	-- user_data (salesman)
		CONCAT(last_name, " ", first_name) AS publisher,
		cuit,
        birth_date,
        phone
    FROM products AS p
    LEFT JOIN categories AS c ON cat_id = category
    LEFT JOIN posts AS po ON product_id = po.product
    LEFT JOIN users_data AS us ON po.user = us.user
    HAVING Publisher IS NULL;

## right Join (tabla base => tabla anidada) || Todos los Usuarios (hayan comprado o no)
	SELECT 
    -- products
		p.product,
	-- categories
        c.description,
	-- user_data (salesman)
		CONCAT(last_name, " ", first_name) AS client,
		cuit,
        birth_date,
        phone
    FROM products AS p
    RIGHT JOIN categories AS c ON cat_id = category
    RIGHT JOIN posts AS po ON product_id = po.product
    RIGHT JOIN sales AS s ON post_id = s.post
    RIGHT JOIN users_data AS us ON s.user = us.user;
    
/*BILLETERAS*/
	SELECT 
		u.user,
		first_name,
        last_name,
        cuit,
        pm.description,
        pay_data
	FROM users_data AS u
    JOIN billing AS b ON b.user = u.user
    JOIN pay_methods AS pm ON pm.pay_id = b.pay_m;

/*FACTURACION*/
	SELECT
		account_id,
		pm.description,
        p.post_title,
        s.price,
        s.quantity,
        sum(s.price * s.quantity) AS total,
        type
    FROM accounting AS a
	JOIN sales AS s ON sale_id = sale
    JOIN posts AS p ON post_id = post
    JOIN pay_methods AS pm ON pay_id = pay_m;