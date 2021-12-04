/*Data Manipulation Language
	SELECT consulta registros de las tablas
*/
/*Tabla usuarios*/
	SELECT * FROM users;
	-- consulta de campos
	SELECT user_name, user_email FROM users
	ORDER BY user_name -- orden de registros
    LIMIT 3 -- cantidad de registros
    OFFSET 3;  -- despues de la posicion

/*Tabla Datos de usuario*/
	SELECT * FROM users_data
    WHERE user = 2;
/*Tabla Categorias*/
	SELECT * FROM categories
	WHERE description LIKE "bot_ni_a";
/*Tabla Productos*/
	-- empieza con "t"
	SELECT * FROM products
	WHERE description LIKE "t%" AND category = 1;
    -- termina en "te"
	SELECT * FROM products
	WHERE description LIKE "%te";
	SELECT * FROM products
    -- empieza con "lava" y termina en "a"
	WHERE description LIKE "lava%a";
    -- el valor se encuentra entre 3 y 2
	SELECT * FROM products
	WHERE category IN(3,2);

/*
	AND	| C1F | C1V		OR 	| C1V | C1F 	XOR | C1F | C2V
    C2F |  F  |  F 		C2V |  V  |  V		C2F	|  F  |  V
    C2V |  F  |  V		C2F |  V  |  F		C2V |  V  |  F
*/