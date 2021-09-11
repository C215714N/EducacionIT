/*DML - Data Manipulation Language - INSERT */
	USE ventapps;
	## Tabla usuarios
		-- carga completa de datos
        INSERT INTO users 
        VALUES (0,'c215714n','cristiandracedo@hotmail.com','root');
        -- carga selectiva de datos
        INSERT INTO users(user_email,user_name)
        VALUES ('cristiandacedo@gmail.com','d477714n');
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