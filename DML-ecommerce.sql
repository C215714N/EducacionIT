/* DML (Data Manipulation Language) */
## Insercion de datos
-- completa
	INSERT INTO users 
    VALUES (0,"cristian_racedo","cristiandracedo@hotmail.com","root");
-- selectiva
    INSERT INTO users(user_email, user_name, user_pass)
    VALUES ("cristiandracedo@gmail.com", "c215714n", "root");
-- multiple
    INSERT INTO users(user_name, user_email)
    VALUES 
		("a_santagada","a_santagada@gmail.com"),
        ("f_cichon","f_cichon"),
        ("f_varela","f_varela"),
        ("c_fernandez","c_fernandez");
	## Categorias
    INSERT INTO categories(description)
    VALUES ("Alimentos"), ("Higiene") , ("Hogar"), ("Tecnologia") ;
    
    INSERT INTO products(description, category)
    VALUES	
		('Notebook HP Elitebook 8470p', 4),
        ('Aire acondicionado Samsung 3000f split', 3),
        ('Polenta Presto Pronta 500g',1),
        ("Coca 2l retornable", 1 ),
		("Pantene 200ml", 2),
		("Iphone 10", 4 );
	
## Consulta de Datos
	SELECT * FROM users;
    SELECT * FROM categories;
    SELECT * FROM products;
    
## Actualizacion 
	UPDATE users SET user_pass = "root" 	-- valor asignado
    WHERE user_name = "cristian_racedo"; 	-- clausula restrictiva
    UPDATE users SET user_pass = 'pass'
    WHERE user_id = 8;
    UPDATE products SET category = 3
    WHERE description LIKE '%Aire%Samsung%'; -- % cualquier cant. caracteres || _ 1 caracter
    /*
		=		 exactamente igual
        >  || >= mayor || mayor o igual
        <  || <= menor || menor o igual
        != || <> no es igual || distinto
        LIKE como similar
    */
    
## Eliminacion de registros
    DELETE FROM users; -- elimina todos los registros
    TRUNCATE users; -- elimina registros y reinicia los contadores