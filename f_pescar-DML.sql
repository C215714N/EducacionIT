/*DATA MANIPULATION LANGUAGE*/
	USE compumundo_hyper_mega_red;
	# Insercion de Registros
    
    ## TABLA USERS
    -- carga completa de datos
    INSERT INTO users VALUES (0, 'c215714n', 'cristiandracedo@hotmail.com', 'root');
    -- carga parcial de datos
    INSERT INTO users(user_name, user_email) VALUES ('Cristian Racedo', 'cristiandracedo@gmail.com');
    -- carga multiple de datos
	INSERT INTO users(user_name, user_email)
    VALUES 	('Marcelo Martinez','mjmserviciostecnicos@gmail.com'),
			('Pablo Molina','palitomolina22@gmail.com'),
            ('Gino Long','ginolong@hotmail.com'),
            ('Sebastian Macaya','contacto@sebastianmacaya.com');
    ## TABLA USERS_DATA
		-- carga parcial
        INSERT INTO users_data(last_name, first_name, gender, birth_date, cuit, user)
        VALUES ('Racedo', 'Cristian', 3, '1991-04-18', '20-64463353-5', 2);
        -- carga multiple
        INSERT INTO users_data(first_name, last_name, cuit)
        VALUES 	('Sebastian', 'Macaya','20-03034567-3'),
				('Gino', 'Long','20-29386382-2'),
				('Pablo', 'Molina','20-10234882-6'),
                ('Marcelo', 'Martinez', '25-08291283-2');
	## TABLA CATEGORIES
		INSERT INTO categories(description)
		VALUES 	('autopartes'),
				('articulos de limpieza'),
				('deportes'),
                ('electrodomesticos'),
                ('herramientas'),
                ('hogar'),
                ('indumentaria'),
                ('jardineria'),
                ('tecnologia');
	## TABLA PRODUCTS
		INSERT INTO products(category, product)
        VALUES 	(1,'neumatico'),
				(1,'optica'),
                (1,'radio'),
                (2,'alcohol en gel'),
                (2,'suavizante'),
                (2,'detergente'),
				(3,'calzado'),
                (3,'camiseta'),
                (3,'guantes de box'),
                (4,'lavarropas'),
                (4,'microondas'),
				(4,'secarropas'),
                (5,'serrucho'),
                (5,'martillo'),
                (5,'destornillador'),
                (5,'pala'),
				(6,'sommier'),
                (6,'modular'),
                (6,'pintura'),
                (7,'camisa'),
                (7,'saco'),
				(7,'corbata'),
                (8,'abono'),
                (8,'manguera'),
                (8,'rastrillo'),
                (9,'notebook'),
                (9,'pc escritorio'),
                (9,'teclado'),
                (9, 'monitor');
        
# Consulta de Registros
    ## TABLA USERS
		SELECT * FROM users; -- consulta general
        SELECT * FROM users
        ORDER BY user_name, user_email;
    ## TABLA USERS_DATA
		SELECT * FROM users_data; 
        SELECT * FROM users_data
			ORDER BY last_name, first_name, cuit DESC
			LIMIT 5
            OFFSET 5;
		SELECT * FROM users_data WHERE gender IS NULL;
    ## TABLA CATEGORIES
		SELECT * FROM categories;
        -- categorias que sea tecnologia
        SELECT description AS categoria FROM categories
			WHERE description LIKE "Tecnolog_a"; -- _ un caracter cualquiera
		-- categorias que empiezan con a
		SELECT description AS catogoria FROM categories
			WHERE description LIKE "a%"; -- % cualquier cantidad de caracteres
		-- categorias que terminan con a
		SELECT description FROM categories 
            WHERE description LIKE "%ria";
		
	## TABLA PRODUCTOS
		SELECT * FROM products;
        -- consulta con resultados limitados
        SELECT * FROM products
			ORDER BY product DESC -- orden de resultados ASC/DESC
			LIMIT 10 -- X cantidad de resultados
			OFFSET 20; -- a partir de la posicion X
		-- productos de categoria 9
        SELECT * FROM products WHERE category = 9; /*tecnologia*/
    