/*DATA MANIPULATION LANGUAGE - JOIN*/

## inner Join (factor común)
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
## left Join (tabla base <= tabla anidada)
	

## right Join (tabla base => tabla anidada)