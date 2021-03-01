USE comercio_lj_11;
/* Insercion de registros */
	-- carga completa (clientes)
    INSERT INTO clientes -- tabla seleccionada
    VALUES (
		0, 			-- id_cliente
        'Racedo', 	-- apellido
        'Cristian', -- nombre
        1,			-- tipo doc (dni: 1, dni_ex: 2)
        1,			-- sexo (m:1, f:2, o:3)
        35353535	-- num_doc
    );
	-- carga selectiva (proveedores)
    INSERT INTO proveedores(cuil, proveedor) -- tabla elegida(campos)
    VALUES ('20-35353535-1','c215714n');
	-- carga multiple (productos)
    INSERT INTO productos(producto, cantidad, precio)
    VALUES 
		("impresora smartank 510", 5000, 25599.99), -- 1
        ("notebook elitebook 8470p", 15000, 65730.00), -- 2
        ("pendrive 32gb", 9000, 600), -- 3
        ("carry disk 2.5 usb3.0", 1200, 1059.99); -- 4
        
/* Consulta de registros */
	-- general
    SELECT * FROM clientes;
    SELECT * FROM proveedores;
    SELECT * FROM productos;
    -- campos especificos
    SELECT producto, precio -- campos seleccionados
		FROM productos -- tabla consultada
		ORDER BY precio DESC -- orden elegido
		LIMIT 2 -- cantidad de resultados X
		OFFSET 2; -- a partir de la posicion X