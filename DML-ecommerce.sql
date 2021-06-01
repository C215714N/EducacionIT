/* DML (Data Manipulation Language) */
## Insercion de datos
-- completa
	INSERT INTO users 
    VALUES (0,"cristian_racedo","cristiandracedo@hotmail.com","root");
-- selectiva
    INSERT INTO users(user_email, user_name, user_pass)
    VALUES ("cristiandracedo@gmail.com", "c215714n", "root");
-- multiple
    INSERT INTO users(user_name, user_email)
    VALUES 
		("a_santagada","a_santagada@gmail.com"),
        ("f_cichon","f_cichon"),
        ("f_varela","f_varela"),
        ("c_fernandez","c_fernandez");
	## datos de usuario
	INSERT INTO users_data(doctype, docnum, user)
    VALUES ("DNI", 35237890, (
		SELECT user_id FROM users 
        WHERE user_name = "c_fernandez"
	));
    INSERT INTO users_data(doctype, docnum, user)
    VALUES 
		(2, 12893740, 1),
        (5, 87531923, 9),
        (6, 42983182, 7),
        (3, 22938470, 8);
	## Categorias
    INSERT INTO categories(description)
    VALUES ("Alimentos"), ("Higiene") , ("Hogar"), ("Tecnologia") ;
    
    INSERT INTO products(description, category)
    VALUES	
		('Notebook HP Elitebook 8470p', 4),
        ('Aire acondicionado Samsung 3000f split', 3),
        ('Polenta Presto Pronta 500g',1),
        ("Coca 2l retornable", 1 ),
		("Pantene 200ml", 2),
		("Iphone 10", 4 );
	## publicaciones
	INSERT INTO posts(user, product, price, quantity, post_date)
	VALUES (1, 7, 58999.99, 5, current_date());
    INSERT INTO posts(user, product, price, quantity, post_date)
	VALUES 
		(7,	7,	0, 10,	current_date()),
		(10,9,	0, 5, 	'2021-05-22'),
		(8,	10,	0, 15, 	'2021-05-18'),
		(8,	7,	0, 8, 	current_date()),
		(9,	10,	0, 13, 	'2021-05-25'),
		(7, 9,	0, 7, 	current_date());
    ##ventas
    INSERT INTO sales(client, post, price, quantity, sale_date)
    VALUES (10, 2, (SELECT price FROM posts WHERE post_id = 2), 1, current_date());
    
## Consulta de Datos
	SELECT * FROM users;
    SELECT * FROM users_data;
    SELECT * FROM categories;
    SELECT * FROM products;
    SELECT * FROM posts;
    SELECT 
		client, 
        post, 
        ROUND(price * quantity, 2) AS total 
	FROM sales;
    
    SELECT 
		product,
        COUNT(product) AS posts,
        SUM(price * quantity) AS total,
        ROUND(AVG(price * quantity), 2) AS promedio,
        SUM(quantity) AS productos
	FROM posts
    WHERE post_id BETWEEN 3 AND 10 -- campo filtrado (existe en la tabla)
	GROUP BY product -- valor de agrupacion para las funciones
    HAVING total >= 50000 -- campo calculado (no existe en la tabla)
    ORDER BY total DESC -- orden de resultados
    LIMIT 100 -- cantidad a mostrar
    OFFSET 0; -- a partir del registro
    /* pasos de la consulta
		1 SELECT campos
        2 FROM tabla
        3 WHERE condicion 		(opcional)
        4 GROUP BY campos 		(opcional)
        5 HAVING campos ALIAS 	(opcional)
        6 ORDER campos ASC/DESC	(opcional)
        7 LIMIT cantidad 		(opcional)
        8 OFFSET desfase 		(opcional)
    */
    -- POSTS cuyos USUARIOS hayan publicado PRODUCTOS
    -- INNER JOIN: trae los registros donde exista coincidencia
    SELECT 
		user,
        user_name,
		product,
		description,
        price,
        quantity
	FROM posts
    JOIN products ON products.product_id = posts.product
    JOIN users ON users.user_id = posts.user;
    -- PRODUCTOS y USUARIOS con los POSTS si fueron publicados
    -- LEFT JOIN: trae los registros de la primer tabla y adjunta la segunda (aunque no exista coincidencia - "NULL")
    SELECT
		product_id,
        description,
        category,
        user_name,
        post_id
	FROM products
    LEFT JOIN posts ON posts.product = products.product_id
    LEFT JOIN users ON users.user_id = posts.user;
    -- USUARIOS con sus DATOS y PRODUCTOS aunque no existan en POSTS
    -- RIGHT JOIN: trae los registros de la primer tabla y muestra todos los de la segunda (aunque no existe coincidencia - "NULL")
    SELECT 
		user_name,
        firstname,
        lastname,
        description,
        post_id
    FROM users
    RIGHT JOIN users_data ON users_data.user = users.user_id
    RIGHT JOIN posts ON posts.user = users.user_id
    RIGHT JOIN products ON products.product_id = posts.product;
## Actualizacion 
	UPDATE users SET user_pass = "root" 	-- valor asignado
    WHERE user_name = "cristian_racedo"; 	-- clausula restrictiva
    
    UPDATE users SET user_pass = 'pass'
    WHERE user_id = 8;
    
    UPDATE products SET category = 3
    WHERE description LIKE '%Aire%Samsung%'; -- % cualquier cant. caracteres || _ 1 caracter "_a%"
	
    UPDATE sales SET quantity = 2 WHERE sale_id = 1;
    UPDATE posts SET quantity = quantity - 2 WHERE post_id = 2;

	-- actualizacion por casos (multiple)
	UPDATE posts SET price =
		CASE
			WHEN product = 7 THEN 58999.99 -- valor si "a" se cumple
            WHEN product = 9 THEN 100.50 -- valor si "b" se cumple pero "a" no.
            WHEN product = 10 THEN 318.99 -- valor si "c" se cumple pero "ab" no
            ELSE 35599.99 -- valor si "abc" no se cumple
        END
	WHERE price IN(NULL,0);
## Eliminacion de registros
    DELETE FROM users; -- elimina todos los registros
    TRUNCATE users; -- elimina registros y reinicia los contadores