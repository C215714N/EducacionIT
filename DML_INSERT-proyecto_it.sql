/*	DML(Data Manipulation Language)
    Agregar/Modificar/Eliminar/Consultar registros
    INSERT: cargas filas a las tablas
*/

/* Tabla usuarios */
	# carga completa (ordinal)
	INSERT INTO users 
    VALUES(
		0, -- user_id
        "c215714n", -- user_name
        "cristiandracedo@hotmail.com", -- user_email
        "root" -- user_pass
    );
    # carga selectiva 
    INSERT INTO users(user_email, user_name) -- indico los campos
    VALUES("cristiandracedo@gmail.com","racedo_cristian"); -- completo en el orden indicado
    # carga multiple (registros)
    INSERT INTO users(user_name, user_email, user_pass)
    VALUES
		("Tux","l.torvalds@linux.com","gnu_kernel"),
        ("Windows","b.gates@microsoft.com","system_32"),
        ("macOS","s.jobs@apple.com","macinstosh");
/*Tabla Datos de Usuario*/
	# carga por asignacion (programacion)
    INSERT INTO users_data SET
		user = 1,
        first_name = 'Cristian Damian',
        last_name = 'Racedo',
        cuit = '20-35336446-5',
        birth_date = '1991-04-18',
        gender = 1;
        
/*Tabla Categorias*/
	INSERT INTO categories(description)
    VALUES 
		("tecnologia"),
        ("hogar"),
        ("maquillaje"),
        ("indumentaria"),
        ("mecanica"),
        ("ferreteria"),
        ("nft"),
        ("entretenimiento");

/* Tabla Productos */
	INSERT INTO products(product, category)
	VALUES
		("remera",4),("camisa",4),("pantalon",4), -- indumentaria
		("aire acondicionado",2),("televisor",2),("parlante",2), -- hogar
		("teclado",1),("laptop",1),("celular",1),("monitor",1); -- tecnologia
	INSERT INTO products(product, category)
    VALUES ("neumaticos",5);
    select * From products;
/* Tabla Publicaciones */
	INSERT INTO posts(user, product, stock, price)
    VALUES
		(1,3,20,500), -- c215714n
        (4,1,100,1200),(4,2,200,1800),(4,3,300,1500), -- Tux
        (6,10,500,25999.99),(6,9,2000,179999.99), -- macOS
        (5,8,200,65500),(5,8,200,89799.99),(5,7,750,5800),(5,10,1000,20000), -- Windows
        (4,12,100,20000),(4,12,300,36000), -- Tux
        (6,4,10000,85999.99),(6,5,5000,35000),(6,6,500,15000); -- macOS
	-- Insercion con subconsulta
		INSERT INTO posts(user, product, post_title, post_description, stock, price)
        VALUES (
			(SELECT user_id FROM users WHERE user_name = "racedo_cristian"), -- usuario
            (SELECT product_id FROM products WHERE product LIKE "aire%"), -- producto
            "Split 5000 frigorias Samsung", -- titulo
            "Ultimas unidades de aire acondicionado split inverter, 5000 frigorias, dimensiones 100cmx50cmx30cm", -- descripcion
            10, 45000); -- cantidad y precio
/* Tabla Ventas */
	INSERT INTO sales(post, quantity) 
    VALUES 	(1,10),(2,6),(5,3),(10,2),(2,1),(12,3),
			(7,4),(3,5),(5,10),(4,1),(1,2),(2,8);
        