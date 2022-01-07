/*Data Manipulation Language
	DELETE elimina registros de las tablas
*/
/*Tabla Usuarios*/
	TRUNCATE users; -- reestablece la tabla
/*Tabla Datos de Usuario*/
	DELETE FROM users_data
	WHERE data_id = 9; -- eliminacion segura
/*Tabla Ventas*/
	DELETE FROM sales; -- eliminacion insegura
    TRUNCATE sales; -- reinicia la tabla (excepto que comprometa las relaciones)

/*Data Manipulation Language
	UPDATE actualiza registros de las tablas
*/
/*Tabla Billeteras de Usuarios*/
	UPDATE billing SET method = 3
    WHERE user = (SELECT user_id FROM users WHERE user_name = "macOS");
/*Tabla Publicaciones*/
	-- titulos de las publicaciones consultando productos y usuarios
    UPDATE posts SET post_title = CONCAT( 
		( SELECT description FROM products WHERE product_id = product ), 
        ' publicado por ', (SELECT user_name FROM users WHERE user_id = user) )
    WHERE post_title IS NULL;	
    -- actualizacion de precios por casos
    UPDATE posts SET price = CASE
		WHEN user IN(1,3,4) THEN price + price * 0.10 -- c215714n / cristian / user aumentan 10%
        WHEN user BETWEEN 2 AND 8 THEN price + price * 0.15 -- windows / juan_perez / tux aumentan 15%
        ELSE price * 0.85 -- los demas (macOS) disminuyen un 15%
	END;
    SELECT * FROM posts;
	-- actualizacion contemplando ausencia de ventas y precio indefinido
    UPDATE posts SET stock = CASE
		WHEN ( SELECT SUM(quantity) FROM sales WHERE post = post_id AND price IS NULL ) IS NULL THEN stock
        ELSE stock - ( SELECT SUM(quantity) FROM sales WHERE post = post_id AND price IS NULL )
    END;
/*Tablas Ventas*/
    -- actualizacion por subconsulta de datos (unicos)
    UPDATE sales SET price = ( SELECT price FROM posts WHERE post_id = post ) 
	WHERE price IS NULL;
	-- billetera del usuario que corresponda con el metodo seleccionado
	UPDATE sales SET
	bill = (
		SELECT MIN(bill_id) FROM billing 
		WHERE sales.user = billing.user AND method = 4
	)	WHERE bill IS NULL;
    -- billetera aleatoria entre 16 y 18
	UPDATE sales SET
	bill = CEIL(RAND() * 3) + 15
	WHERE user = 4;