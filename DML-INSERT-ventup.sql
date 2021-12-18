/*Data Manipulation Language
	INSERT agrega registros a las tablas
*/
USE ventup;
/* Tabla usuarios */
	-- carga completa
	INSERT INTO users 
	VALUES(
		0, 	-- user_id
		"c215714n", -- user_name
		"cristiandracedo@hotmail.com", -- user_email
		"root" -- user_pass
	);
	-- carga selectiva
	INSERT INTO users(user_email, user_name)
	VALUES("cristiandracedo@gmail.com", "cristian");
	-- carga multiple
	INSERT INTO users(user_name, user_email, user_pass)
	VALUES
		("user","user@domain","pass"),
		("windows","bill_gates@microsoft","ms-dos!7.0"),
		("juan_perez","juanp@gmail.com","juanit0!"),
		("Tux","linus_torvalds@linux.com","kernel!5.3");
	-- carga por asignacion
	INSERT INTO users SET
		user_name = "macOS",
		user_email = "steve_jobs@apple.com",
		user_pass = "isaac_newton";
/* Tabla Datos de Usuario */
	SELECT * FROM users_data;
    INSERT INTO users_data(user, last_name, first_name, cuit, birth_date)
    VALUES
		(1, "Racedo","Cristian Damian","20-35336446-5", "1991-04-18"),
        (6, "Perez", "Juan", "30-03034560-7", "1965-07-09"),
        (4, "Doe", "John", "25-12342732-8", "1980-07-04");
        
/* Tabla Categorias */
	INSERT INTO categories(description)
    VALUES ("tecnologia"),("limpieza"),("alimentos"),("botanica"),("electrodomesticos"),("muebles");
/* Tablas Productos*/
	INSERT INTO products(description, category)
    VALUES 
		("polenta", 3),("tapa de asado", 3),("tomate", 3),("arroz", 3), -- alimentos
        ("pc escritorio", 1),("notebook", 1),("teclado", 1),("tablet", 1),("celular", 1), -- tecnologia
        ("abono para plantas", 4),("potus", 4), -- botanica
        ("lavarropas", 5),("microondas", 5),("aire acondicionado", 5), -- electrodomesticos
        ("ropero", 6),("modular", 6), -- muebles
        ("suavizante", 2),("lavandina", 2),("quitamanchas", 2),("jabon", 2); -- limpieza
	INSERT INTO products(description, category) VALUES ("detergente",2),("lavavajilla",2);
/*Tabla Publicaciones*/
	INSERT INTO posts(user,product,post_title,post_description, price, stock)
	VALUES ( 
		(SELECT user_id FROM USERS WHERE user_name = "juan_perez"),
        (SELECT product_id FROM products WHERE description = "teclado"),
        "Teclado Redragon K552-BB",
        "Producto nuevo en caja con garantia de 12 meses",
        5800,
        100
	);
    INSERT INTO posts(user, product, price, stock)
    VALUES
    (1,1,200,5000), (1,3,300,1000), (1,2,1100,3000), (1,10,200,4500), -- c215714n
    (5,13,15000,3000), (5,14,65000,2000), (5,12,35999.99,2500), -- windows
    (7,5,23999.99,4000), (7,8,15999.99,2000), (7,6,120000,5000), (7,7,1200,30000), -- tux
    (12,9,350000,2000), (12,17,500,10000), (12,18,400,15000); -- macOS
/*Tabla Ventas*/
	INSERT INTO sales(user, post, quantity)
    VALUES (4,13,2), (4,8,5), (4,10,1), (4,8,10);
    -- carga de valores aleatorios
    INSERT INTO sales(user, post, quantity)
    VALUES 
		( 1, (CEIL(RAND() * 15)), RAND() * 10 ), 	( 3, (CEIL(RAND() * 15)), RAND() * 10 ),
		( 12, (CEIL(RAND() * 15)), RAND() * 10 ), 	( 5, (CEIL(RAND() * 15)), RAND() * 10 ),
		( 7, (CEIL(RAND() * 15)), RAND() * 10 ), 	( 3, (CEIL(RAND() * 15)), RAND() * 10 ),
		( 5, (CEIL(RAND() * 15)), RAND() * 10 ), 	( 1, (CEIL(RAND() * 15)), RAND() * 10 ),
		( 7, (CEIL(RAND() * 15)), RAND() * 10 ), 	( 6, (CEIL(RAND() * 15)), RAND() * 10 ),
		( 12, (CEIL(RAND() * 15)), RAND() * 10 ), 	( 12, (CEIL(RAND() * 15)), RAND() * 10 );