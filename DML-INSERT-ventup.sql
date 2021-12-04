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





