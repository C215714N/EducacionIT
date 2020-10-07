SELECT * FROM clientes;

/*Actualizacion de correos*/
 -- letra nombre . apellido @ gmail.com
	 UPDATE clientes
		SET correo = 
			CONCAT(
				LEFT(nombre, 1),".",
				apellido,"@gmail.com"
			);

SELECT * FROM productos;	
## carga de productos	
    INSERT INTO productos(marca, modelo, stock, precio)
		VALUES
			("nike", "pantalones", 3000, 6000),
            ("adidas", "zapatillas deportivas", 2500, 9600),
            ("kappa","campera",4300,5999),
            ("ayudin","lavandina",10000,200),
            ("comfort","concentrado",12000,300);
-- modificamos el campo categoria
	ALTER TABLE productos
		MODIFY categoria enum(
			"indumentaria", 
            "limpieza", 
            "tecnologia",  
            "biblioteca" 
		);
-- actualizacion de categorias
	UPDATE productos
	SET categoria = 
		CASE
			WHEN marca IN('hp','dell','samsung','apple','toshiba') THEN 3 -- valor A
			WHEN marca IN('adidas','nike','kappa') THEN 1 -- valor B / si A no se cumple
			WHEN marca IN('ayudin','vim','comfort') THEN 2 -- valor C / si  AB no se cumple
			ELSE 4 -- valor D / si ABC no se cumple
		END;

SELECT * FROM proveedores;
	UPDATE proveedores
		SET correo = 
			CONCAT("info@", LOWER(proveedor),".com");

## facturacion
	SELECT * FROM facturacion;
    UPDATE facturacion 
    SET monto = 
		(
			SELECT sum(precio*cantidad) 
			FROM facturacion_detalle
			WHERE id_factura = 1 
        ) -- condicion suma facturacion_detalle
	WHERE id_factura=1; -- condicion update facturacion
    
SELECT * FROM facturacion_detalle;
INSERT INTO facturacion_detalle (id_factura,id_producto,cantidad)
	VALUES 
		(,,),
        (,,),
        (,,),
        (,,),
        (,,),
        (,,),
        (,,),
        (,,),
        (,,);
