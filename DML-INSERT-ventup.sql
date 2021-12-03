/*Data Manipulation Language
	insertar/eliminar/modificar/consultar
    registros de tablas
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





