/*DATA MANIPULATION LANGUAGE - DELETE*/
	TRUNCATE posts;
	DELETE FROM posts;

/* DATA MANIPULATION LANGUAGE - UPDATE*/
	-- actualizacion especifica
    UPDATE posts 
		SET post_title = ' (Gino Long)'
        WHERE user = 5;
	-- actualizacion multiple
	UPDATE posts
	SET 
        post_date = current_date(),
        post_update = current_date(),
		post_title = 
		CASE
			WHEN product <= 3 THEN 'Autoparte - '
            WHEN product <= 6 THEN 'Art. Limpieza - '
            WHEN product <= 9 THEN 'Art. Deportivo - '
            WHEN product <= 12 THEN 'Electrodomestico - '
            WHEN product <= 16 THEN 'Herramienta - '
            WHEN product <= 19 THEN 'Art. del Hogar - '
            WHEN product <= 22 THEN 'Indumentaria para '
            WHEN product <= 25 THEN 'Producto para Jardineria -'
            ELSE 'Producto de tecnologia - '
        END;
    -- actualizacion selectiva con funciones    
	UPDATE posts
		SET post_title =
        CASE
			WHEN user = 3 THEN concat(post_title, " (Martinez Marcelo)") 
            WHEN user = 4 THEN concat(post_title, " (Molina Pablo)")
            WHEN user = 5 THEN concat(post_title, " (Long Gino)")
            WHEN user = 6 THEN concat(post_title, " (Macaya Sebastian)")
            ELSE concat(post_title, "Racedo Cristian")
        END;
	-- Actualizacion de Precios
    SELECT * FROM products;
    UPDATE posts
		SET price =
        CASE
			WHEN product IN(4,14,15,22,24,28) THEN 400 /*lista de valores*/
			WHEN product BETWEEN 5 AND 9 THEN 1200 /*rango de valores*/
            WHEN product < 4 XOR product > 24 THEN 50000 /*rango opcional*/
            WHEN product > 16 OR product < 14 THEN 700 /*rango excluyente*/
            ELSE 2500 /*valor por defecto*/
        END; 
        /* 
			AND | C1f | C1v		OR  | C1f | C1v		XOR | C1f | C1v
			C2f |  F  | F		C2f | F   | V		C2f | F   | V
            C2v |  F  | V		C2v | V	  | V		C2v | V	  | F
        */
	UPDATE sales 
    SET price = (
    
    ) WHERE price IS NULL