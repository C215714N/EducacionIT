/*DATA MANIPULATION LANGUAGE - DELETE*/
	TRUNCATE posts;
	DELETE FROM posts;

/* DATA MANIPULATION LANGUAGE - UPDATE*/
	UPDATE posts 
		SET post_title = ' (Gino Long)'
        WHERE user = 5;
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
        
        UPDATE posts
		SET post_title =
        CASE
			WHEN user = 3 THEN concat(post_title, " (Martinez Marcelo)")
            WHEN user = 4 THEN concat(post_title, " (Molina Pablo)")
            WHEN user = 5 THEN concat(post_title, " (Long Gino)")
            WHEN user = 6 THEN concat(post_title, " (Macaya Sebastian)")
            ELSE concat(post_title, "Racedo Cristian")
        END;