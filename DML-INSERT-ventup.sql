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
/* Tabla Metodos de Pago*/
	INSERT INTO pay_methods(description)
    VALUES ("efectivo"),("debito"),("credito"),("cbu"),("cvu"),("cheque");
/* Tabla Billeteras de Usuario*/
	INSERT INTO billing(user, method, bill_title, bill_data)
    VALUES
		(1,2,"BBVA Debito","4293-2879-5483-1298"),(1,3,"Galicia Credito","3298-1235-2983-2348"),(1,4,"BBVA CBU","tango.foxtrot.delta"), -- c215714n
        (7,1,"Pesos","20-73249328-9"),(7,5,"MP","kernel.open.source"),(7,6,"Chequera","4324-12394293-233"),(7,4,"Santander Rio","10293478012298200012"), -- Tux
        (12,4,"Black America","1927-8410-2934-8273"),(12,4,"Platinum America","1092-2039-1927-1239"), -- macOS
        (5,2,"Gold Amex","2398-4293-8472-9289"),(5,3,"Silver Amex","2345-2349-3894-2928"), -- Windows
        (6,5,"UALA","juan.perez.uala"),(6,5,"BIMO","283710923847019238470"),(6,3,"ICBC","1092-1238-2348-2309"); -- Juan Perez
	INSERT INTO billing SET
		user = 3,
		method = 3,
		bill_title = "Nacion",
		bill_data = "cuenta.para.pagar";
	INSERT INTO billing(user, method, bill_title, bill_data)
    VALUES (4,2,"BRUBANK","1209-3948-1029-3847"),(4,3,"Provincia", "1230-7948-1720-3941"),(4,5,"MP","user.payment");
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