/*	DML(Data Manipulation Language)
    Agregar/Modificar/Eliminar/Consultar registros
    DELETE: eliminar filas de las tablas
*/
	DELETE FROM users; -- no posible (FOREIGN KEY de users_data y posts)
	DELETE FROM posts; -- eliminacion completa
    TRUNCATE posts; -- reinicio de tabla
    
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