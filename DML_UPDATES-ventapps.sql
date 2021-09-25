/*DML - Data Manipulation Language - DELETE*/
	-- eliminacion completa de registros
		DELETE FROM posts;
    -- reinicio de tabla
		TRUNCATE posts; -- elimina todos los registros y reinicia el contador
/*DML - Data Manipulation Language - UPDATE*/

	## Tabla Publicaciones
     -- actualizacion masiva
		UPDATE posts SET quantity = 200;
    -- actualizacion condicional
		UPDATE posts SET price =
		CASE
			WHEN product IN(1,2,4,12) THEN 50000	-- valor si a se cumple 
            WHEN product BETWEEN 4 AND 7 THEN 3000 	-- valor si a no se cumple
            WHEN product = 3 OR product = 13 THEN 6000 -- valor si ab no se cumple
            ELSE 500 -- valor si abc no se cumple
        END;
		-- actualizacion por consulta
			UPDATE posts 
            SET post_title = (SELECT user_name FROM users WHERE user = user_id)
            WHERE post_title IS NULL;
		-- actualizacion con funciones
			UPDATE posts SET post_title = CONCAT( 
				(SELECT product FROM products WHERE posts.product = product_id) ,
				' - Producto de ', post_title );
		-- convertir texto a mayusculas
			UPDATE posts SET post_title = UPPER(post_title);
	## Tabla Ventas
		UPDATE sales
        SET price = (SELECT price FROM posts WHERE post = post_id)
        WHERE price IS NULL;