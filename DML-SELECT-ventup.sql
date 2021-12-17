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
    WHERE user = 1; -- condicion
    -- concatenacion de cadenas de texto
	SELECT
		CONCAT("sr/a: ", last_name, " ", first_name) AS customer,
        CONCAT("direccion: ", address, " - telefono: ", phone)  AS user_data
    FROM users_data;
    -- identificacion de registros duplicados
    SELECT 
		GROUP_CONCAT(data_id) AS id, -- id de datos
        user,
        last_name,
        first_name
    FROM users_data
    GROUP BY last_name, first_name;
    -- documentacion
    SELECT
		CONCAT(last_name, ", ", first_name) AS user, -- agrupacion de textos
        ROUND(DATEDIFF(CURRENT_DATE(), birth_date) / 365, 1) AS age, -- diferencia de fechas
        LEFT(cuit, 2) AS cuit_id, -- cant. de caracteres de izq a der
        RIGHT(cuit, 1) AS cuit_verifier, -- cant. de caracteres  de der a izq
        POSITION("-" in cuit) AS cuit_separator, -- ubica a partir de que posicion empieza el texto buscado
        SUBSTRING(cuit, 4, 8) AS document -- cant de caracteres  de izq a der  a partir de la position indicada
	FROM users_data;
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
/*Tabla Publicaciones*/
	-- campos calculados (obtenidos mediante funciones de SQL)
	SELECT 
		COUNT(user) AS publicaciones, -- cuenta los registros
        SUM(stock) AS articulos, -- suma los registros
        MIN(price) AS menor_precio, -- retorna el valor mas bajo
        MAX(price) AS mayor_precio, -- retorna el valor mas alto
        ROUND(AVG(price), 2) AS promedio
	FROM posts;
    -- cant. de publiciones por usuario con total unitario
    SELECT
		user,
		COUNT(user) AS posts, -- cuenta segun el valor de agrupacion
        SUM(price) AS total_unit
	FROM posts
    GROUP BY user; -- agrupado por usuario
    -- comisiones potenciales por publicacion
    SELECT 
		post_id, 
        user, 
        product, 
        price * stock AS total, -- calculo ganancias
        ROUND(price * stock * 0.105, 2) AS percentage -- comision por ventas
	FROM posts
    ORDER BY post_id;
    -- comision total por vendedor (potencial)
    SELECT 
		user,
        ROUND(SUM(price * stock) * 0.105, 2) AS commission
	FROM posts
    GROUP BY user;
/*Tabla Ventas*/
	-- facturacion final por venta
	SELECT 
		sale_id,
        user,
        post,
        price * quantity AS total
    FROM sales;
    -- articulos vendidos por publicacion
    SELECT 
        post,
		GROUP_CONCAT(user),
		SUM(quantity) AS stock_count
	FROM sales
    GROUP BY post;
        
        
    