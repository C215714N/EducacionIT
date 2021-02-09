USE store;
/*CARGA DE DATOS - CLIENTES*/
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
/* CARGA DE DATOS - PROVEEDORES */
	INSERT INTO proveedores (proveedor, cuil)
		VALUES
			("HP","30-54203455-2"),
			("ASUS","20-07605519-0"),
			("COMFORT","30-71129323-6"),
			("SAMSUNG","3068412579-2"),
			("MOTOROLA","30-71124798-6"),
			("CANON","30-52030624-9"),
			("COCA COLA","30-51757696-0"),
			("CRIOLLITA","30-50927711-3");
	SELECT * FROM proveedores;
    
/*CARGA DE DATOS - PRODUCTOS*/
	INSERT INTO productos(articulo, codigo, categoria, valoracion, id_proveedor)
		VALUES 
			("aire acond.","0011", 2, 2, 4),
			("gaseosa", "0012",4, 3, 7),
			("colchon","0013", 2, 3, 6),
			("televisor", "0014",1, 4, 4),
			("impresora","0015", 1, 5, 4),
			("impresora", "0016",1, 2, 5),
			("heladera","0017", 2, 3, 2),
			("microondas", "0018",2, 3, 5);
	SELECT * FROM productos;
    TRUNCATE productos;
/*CARGA DE DATOS - FACTURACION*/
	INSERT INTO facturacion (id_cliente, tipo, tipo_pago)
    VALUES 
		(1,2,3),
        (4,2,4),
        (2,2,2),
        (5,2,1),
        (6,2,3),
        (5,2,3);
/*CARGA DE DATOS - FACTURACION DETALLE*/
    INSERT INTO facturacion_detalle(id_factura, id_producto, cantidad)
	VALUES
		(1, 1, 3), (1, 2, 2), (1, 5, 1), (1, 6, 4),	(1, 10, 2),	-- factura 1
        (2, 20, 12), (2, 19, 2), (2, 9, 1), 					-- factura 2
        (3, 8, 2), (3, 6, 2), (3, 3, 1), (3, 2, 1),				-- factura 3
		(4, 4, 6),												-- factura 4
		(5, 5, 2), (5, 3, 1); 									-- factura 5
	SELECT * FROM facturacion_detalle;

/* CONSULTAS DE DATOS */
	## productos con valoracion 3 ordenados por nombre, solo 5 a partir del producto 5 (6-10)
	SELECT * FROM productos
		WHERE valoracion = 3
        ORDER BY articulo DESC -- orden de la consulta default(ASC)
        LIMIT 5 -- limite de resultados X para mostrar
        OFFSET 5; -- a partir de la posicion X en adelante

	## producto con mas de 3 estrellas
    SELECT id_producto, articulo, codigo, categoria, valoracion -- campos seleccionados
    FROM productos -- tabla consultada
    WHERE valoracion > 3 -- condicion
    ORDER BY valoracion DESC; -- organizacion

	## proveedores que empiecen con la letra C
	SELECT proveedor, cuil
    FROM proveedores
    WHERE proveedor LIKE "C%"; -- "%": cualquier cantidad de caracteres

	## Clientes cuyo apellido termina con Z y cuya segunda letra sea o
    SELECT apellido, nombre, tipo_doc, num_doc
    FROM clientes
    WHERE apellido LIKE "%z" AND nombre LIKE "_o%"; -- "_": un caracter





