/*DATA MANIPULATION LANGUAGE - SELECT */
	# Consulta de Registros
    
    ## TABLA USERS
		SELECT * FROM users; -- consulta general
        SELECT * FROM users
        ORDER BY user_name, user_email;
    
    ## TABLA USERS_DATA
		SELECT * FROM users_data; 
        SELECT * FROM users_data
			ORDER BY last_name, first_name, cuit DESC
			LIMIT 5
            OFFSET 5;
		SELECT * FROM users_data WHERE gender IS NULL;
    
    ## TABLA CATEGORIES
		SELECT * FROM categories;
        -- categorias que sea tecnologia
        SELECT description AS categoria FROM categories
			WHERE description LIKE "Tecnolog_a"; -- _ un caracter cualquiera
		-- categorias que empiezan con a
		SELECT description AS catogoria FROM categories
			WHERE description LIKE "a%"; -- % cualquier cantidad de caracteres
		-- categorias que terminan con a
		SELECT description FROM categories 
            WHERE description LIKE "%ria";
		
	## TABLA PRODUCTS
		SELECT * FROM products;
        -- consulta con resultados limitados
        SELECT * FROM products
			ORDER BY product DESC -- orden de resultados ASC/DESC
			LIMIT 10 -- X cantidad de resultados
			OFFSET 20; -- a partir de la posicion X
		-- productos de categoria 9
        SELECT * FROM products WHERE category = 9; /*tecnologia*/
	
    ## TABLA POSTS
		SELECT * FROM posts;
        SELECT * FROM posts
        WHERE post_id IN(13,14);
        -- consulta con funciones de campos
        SELECT 
            COUNT(*) AS publicaciones, -- conteo de registros
			MIN(price) AS producto_economico, -- valor mas bajo
			MAX(price) AS producto_costoso, -- valor mas alto
            ROUND( AVG(price), 2) AS precio_promedio,  -- valor promedio
            SUM(price) AS total_productos, -- suma de valores
            SUM(price * quantity) AS total_recaudacion
		FROM posts;
		-- cantidad de publicaciones por usuario
        SELECT 
			user,
            GROUP_CONCAT(product) AS products,
			COUNT(price) AS posts,
            ROUND(AVG(price), 2) AS average,
            SUM(price) AS total_unit,
            SUM(price * quantity) AS total_final,
            ROUND( SUM(price * quantity) * 0.21, 2) AS comission
		FROM posts
        GROUP BY user
        ORDER BY user, product;
        -- cantidad de publicaciones por producto
        SELECT
			GROUP_CONCAT(user) AS users,
            product,
            COUNT(*) AS posts,
            price,
            SUM(price * quantity) AS total
		FROM posts
        GROUP BY product
        ORDER BY user, product;
	-- busqueda de duplicados
    SELECT 
		GROUP_CONCAT(post_id) AS id,
        user,
        product
	FROM posts
	GROUP BY user, product;
   
   ## TABLA SALES
		SELECT * FROM sales;
        -- consulta campo calculado por registro
        SELECT 
			user, 
            post, 
            quantity, 
            price,  
            (price * quantity) AS total -- campo calculado
		FROM sales
        HAVING total >= 5000; -- clausula para campos calculados
        -- agrupacion de compras por estado
        SELECT
			user,
            GROUP_CONCAT(post) AS posts,
            CASE
				WHEN state IN(1,2) THEN SUM(price * quantity) * -1
                ELSE SUM(price * quantity)
			END AS accounting,
			state
		FROM sales
        GROUP BY state, user
        ORDER BY state DESC, post, user;
        
	SELECT 
		post_id,
        products.product,
        post_title,
        post_description,
        quantity,
        price
	FROM posts, products
    WHERE product_id = posts.product
    ORDER BY post_id;

## TABLA ACCOUNTING
	SELECT * FROM accounting;