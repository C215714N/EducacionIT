/*	DML(Data Manipulation Language)
    Agregar/Modificar/Eliminar/Consultar registros
    DELETE: eliminar filas de las tablas
*/
	DELETE FROM users; -- no posible (FOREIGN KEY de users_data y posts)
	DELETE FROM posts; -- eliminacion completa
    TRUNCATE posts; -- reinicio de tabla
    TRUNCATE sales;
    
/*	DML(Data Manipulation Language)
    Agregar/Modificar/Eliminar/Consultar registros
    UPDATE: actualizar las filas de tablas
*/
/* Tabla Datos de Usuario */
	UPDATE users_data
    SET profession = "instructor"
    WHERE user = 1;
    
/* Tabla Categorias */
    UPDATE categories SET description = "belleza"
    WHERE description = "maquillaje";
    
/* Tabla Publicaciones */
	-- generamos el titulo utilizando los valores de los campos
	UPDATE posts
    SET post_title = CONCAT(
		(SELECT product FROM products WHERE product_id = posts.product), -- obtengo el producto
        " vendido por ", -- uno el texto escrito con espacios
        (SELECT user_name FROM users WHERE user_id = posts.user) -- obtengo el usuario
    ) WHERE post_title IS NULL; -- condicion: no deben poseer titulo
/* Tabla Ventas */
	-- actualizacion de precios por subconsulta
	UPDATE sales
    SET price = (SELECT price FROM posts WHERE post_id = post) -- verificamos el precio de la publicacion
    WHERE price = 0.00; -- condicion: no debe tener precio definido
    -- asignacion aleatoria de usuarios
    UPDATE sales
	SET user = CEIL(RAND() * 4 + 2 ) -- numero aleatorio entre 3 y 6
    WHERE user IS NULL; -- condicion: no debe existir el usuario
	-- reasignacion por valores incorrectos (mismo usuario POSTS y SALE)
    UPDATE sales
    SET user = CASE
		WHEN post IN(2,3,4,11,12) AND user = 4 THEN ROUND(RAND() + 5) -- si a > 1
        WHEN post BETWEEN 7 AND 10 AND user = 5 THEN CEIL(RAND() * 4) -- si !a & b > 2
        WHEN post BETWEEN 5 AND 15 AND user = 6 THEN FLOOR(RAND() * 4 + 1) -- si !ab & c > 3
        ELSE user -- si !abc > 4
    END;