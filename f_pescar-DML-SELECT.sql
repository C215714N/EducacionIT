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
        SELECT 
            COUNT(*) AS "publicaciones", -- conteo de registros
			MIN(price) AS "producto economico", -- valor mas bajo
			MAX(price) AS "producto costoso", -- valor mas alto
            ROUND( AVG(price), 2) AS "precio promedio",  -- valor promedio
            SUM(price) AS "total productos", -- suma de valores
            SUM(price * quantity) AS "total recaudacion"
		FROM posts;
	## TABLA SALES
		SELECT * FROM sales;
        SELECT 
			user, 
            post, 
            quantity, 
            price,  
            (price * quantity) AS total -- campo calculado
		FROM sales;
        