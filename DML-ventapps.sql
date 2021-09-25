/*DML - Data Manipulation Language - INSERT */
	USE ventapps;
	## Tabla usuarios
		-- carga completa de datos
        INSERT INTO users 
        VALUES (0,'c215714n','cristiandracedo@hotmail.com','root');
        -- carga selectiva de datos
        INSERT INTO users(user_email,user_name)
        VALUES ('cristiandacedo@gmail.com','d477714n');
        INSERT INTO users(user_email, user_name)
        VALUES
			('raul2021@gmail.com','raul'),
			('alicia25@gmail.com','alicia'),
			('arbolito@hotmail.com','arbolito'),
			('carlos55@gmail.com','carlos');
	## Tabla Categorias
		-- carga multiple de datos
		INSERT INTO categories(description)
        VALUES 
			('Electronica'),
            ('Tecnologia'),
            ('Indumentaria'),
            ('Hogar'),
            ('Botanica'),
            ('Alimentos'),
            ('Libreria'),
            ('Transporte');
		INSERT INTO categories(description, active)
		VALUES
            ('Autopartes', false),
            ('Herramientas', true);
    ## Tabla Productos
		INSERT INTO products(product, category)
		VALUES
			('Notebook', 2),
			('Aire Acondicionado', 4),
			('Televisor',4),
			('Abono Mensual', 8),
			('Abono para Plantas',5),
			('Fideos',6),
			('Lapices de color', 7),
			('Libro', 7),
			('Destornillador', 13),
			('Martillo', 13),
			('Serrucho', 13),
			('Pantalones', 3);
     ## Tabla Publicaciones
     INSERT INTO posts(user, product)
     VALUES 
		(3,7),(3,8),(3,9), /*Vendedor Raul*/
		(4,2),(4,3), /*Vendedor Alicia*/
		(5,12),(5,1),(5,10),(5,5), /*Vendedor Arbolito*/
		(6,4); /*Vendedor Carlos*/
	## Tabla Metodos de Pago
	INSERT INTO pay_methods(description)
    VALUES  
        ('credito'), 
        ('debito'), 
		('efectivo'),
        ('electronico'), 
        ('transferencia');
    ## Tabla Billeteras
	INSERT INTO wallets (user,method, title,detail)
    VALUES
		(1, 4,'MercadoPago','alpha.tango.foxtrot'),
        (1, 1,'BBVA','1234-1234-4321-1234'),
        (1, 2,'BBVA','4231-1234-9012-3213'),
		(3, 1,'SANTANDER','rock.salsa.merengue'),
        (3, 1,'PROVINCIA','1234-8765-4761-1234'),
        (4, 2,'BBVA','4231-1234-9012-3213'),
		(6, 4,'MODO','bravo.stars.racoon'),
        (6, 4,'UALA','108347102893470123894'),
        (6, 2,'NACION','7651-8734-9012-3213');
	## Tabla Ventas
		INSERT INTO sales (user, post, quantity, wallet)
        VALUES
			(1,3,5,1),
            (1,7,1,2),
            (4,9,50,6),
            (4,2,1,6),
            (3,5,1,4),
            (3,4,2,5);
            
/*DML - Data Manipulation Language - SELECT*/
	## Tabla Usuarios
	SELECT * FROM users;
	## Tabla Categorias
		SELECT * FROM categories;
        SELECT * FROM categories
        WHERE cat_id BETWEEN 1 AND  5;
    ## Tabla Productos
    SELECT * FROM products;
    -- consulta selectiva
    SELECT product, category FROM products
    WHERE category = 13; -- condicion
    -- consulta anidada
    SELECT product, category FROM products
    WHERE category = (SELECT cat_id FROM categories WHERE description = 'hogar');
    -- consulta con multiples condiciones
    SELECT product, category FROM products
    WHERE category = (SELECT cat_id FROM categories WHERE description = 'hogar')
		OR category = (SELECT cat_id FROM categories WHERE description = 'herramientas')
		OR category = (SELECT cat_id FROM categories WHERE description = 'tecnologia');
	-- consulta con rango de valores
    SELECT product, category FROM products
    WHERE category IN(2,4,13) OR product LIKE 'Abono%';
    -- _ 1 caracter || % cualquier cantidad de caracteres
    /*
		AND|c1v |c1f		OR |c1v	|c1f		XOR	|c1v|c1f
        c1v| V	| F			c1v| V	| V			c1v	| F	| V
        c2f| F	| F			c2f| V	| F			c2f	| V	| F
    */
    ## Tabla Publicaciones
    SELECT * FROM posts;
    -- campo calculados
    SELECT 
		post_title, 
        quantity, 
        price,
        price * quantity AS total
	FROM posts;
    -- campos agrupados
    SELECT 
		user,
		ROUND(AVG(price), 2) AS promedio,
		MIN(price) AS producto_economico,
        MAX(price) AS producto_costoso,
        COUNT(price) AS publicaciones,
        SUM(price * quantity) AS recaudacion_maxima,
        SUM(price * quantity) * 0.15 AS comision
    FROM posts
    WHERE user IN (3,5) -- condicion para campos de tabla
	GROUP BY user -- condicion de agrupacion
    HAVING comision >= 1800000 -- condicion para campos calculados
	;
    ## Tabla Metodos de Pago
    SELECT * FROM pay_methods;