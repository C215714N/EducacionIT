USE store;
/*CARGA DE DATOS*/
	## carga completa
	INSERT INTO clientes
    values (
		0, 			-- id_cliente
        "Racedo",	-- apellido
        "Abel", 	-- nombre
        1, 			-- tipo_doc (1: dni, 2: dni ext., 3: ci, 4: lc, 5: le, 6:pass)
		1, 			-- sexo (1:m, 2:f)
        38383838, 	-- num_doc
        "1993-10-12",		-- fecha_nac (yyyy-mm-dd)
        "(11)-0303-4560",	-- tel (texto)
        "abel.racedo@gmail.com",	-- email
        "su casa 93, Temperley"		-- direccion
        );
        
	## carga selectiva
	INSERT INTO clientes(apellido, nombre, fecha_nac, tipo_doc, num_doc) -- elegimos los campos
		VALUES('Racedo', 'Cristian', '1991-04-18', 1, 35335335); -- valores
	SELECT * FROM clientes;
    
    ## carga multiple
	INSERT INTO clientes(apellido, nombre, sexo, tipo_doc, num_doc)
		VALUES 
			("Gomez","Gonzalo", 1, 3, 27272727),
			("Lopez","Lorena", 2, 4, 32323232),
            ("Perez","Perla", 2, 1, 19191919),
            ("Diaz","Diana", 1, 2, 38383838),
            ("Gimenez","Gerardo", 1, 5, 35353535);
            
	SELECT * FROM clientes;