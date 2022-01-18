/*	DML(Data Manipulation Language)
    Agregar/Modificar/Eliminar/Consultar registros
    SELECT: consultar filas a las tablas
*/
/*Tabla Usuarios*/
	SELECT * FROM users;
    SELECT * FROM users
    WHERE user_email LIKE "%hotmail%" 
    OR user_email LIKE "%gmail%";
/*Tabla Datos de usuario*/
	SELECT * FROM users_data;
    
/*Tabla Categorias*/
	## Consulta de categorias por grupos
	SELECT * FROM categories
    ORDER BY description -- criterio de orden
    LIMIT 4 -- cantidad a mostrar
    OFFSET 0; -- a partir de la posicion X
    ## Categoria mecanica
    SELECT * FROM categories
    WHERE description = 'mecanica';
    ## Categorias que terminan con "ia"
    SELECT * FROM categories
    WHERE description LIKE '%ia'; -- % cualquier cantidad de caracteres
	## Categorias cuya segunda letra sea "e"
    SELECT * FROM categories
    WHERE description LIKE '_e%'; -- _ Un caracter cualquiera

/*Tabla Productos*/
	## Productos cuya categoria es tecnologia
	SELECT * FROM products
    WHERE category = 1;
    ## Productos que contengan "la"
    SELECT * FROM products
    WHERE product LIKE "%la%";
    
/*
	AND	|c1f| c1v 	OR 	|c1f|c1v	XOR |c1f| c1v
	c2f | F	| F 	c2f | F | V		c2f | F | V
    c2v | F	| V		c2v | V | V		c2v | V | F	
*/

/* Tabla Publicaciones */
	SELECT * FROM posts;
    -- Camisas de Tux (subconsulta)
    SELECT * FROM posts
    WHERE user = (SELECT user_id FROM users WHERE user_name = "Tux")
    AND product = (SELECT product_id FROM products WHERE product = "camisa");
    -- Productos cuyos valores sean los especificados
    SELECT * FROM posts
    WHERE product IN(5,7,8,10);
    -- Productos entre determinado rango de valores
    SELECT * FROM posts
    WHERE product BETWEEN 4 AND 10;
/* Tabla Ventas */
	SELECT * FROM sales;