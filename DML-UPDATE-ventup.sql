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
/*Tabla Publicaciones*/
	-- titulos de las publicaciones consultando productos y usuarios
    UPDATE posts SET post_title = CONCAT( 
		( SELECT description FROM products WHERE product_id = product ), 
        ' publicado por ', (SELECT user_name FROM users WHERE user_id = user) )
    WHERE post_title IS NULL;
	-- actualizacion masiva contemplando la ausencia de ventas
	UPDATE posts SET stock = CASE
		WHEN (SELECT SUM(quantity) FROM sales WHERE post = post_id ) IS NULL THEN stock -- precio sin modificaciones
		ELSE stock - (SELECT SUM(quantity) FROM sales WHERE post = post_id) -- diferencia de productos vendidos
	END;
/*Tablas Ventas*/
    -- actualizacion por subconsulta de datos (unicos)
    UPDATE sales SET price = ( SELECT price FROM posts WHERE post_id = post ) 
	WHERE price IS NULL;
    