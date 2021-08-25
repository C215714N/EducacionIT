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
    # Consulta de Registros
    ## TABLA USERS
    SELECT * FROM users; -- consulta general
    ## TABLA USERS_DATA
    SELECT * FROM users_data; 
    SELECT * FROM users_data WHERE gender IS NULL;
    
    