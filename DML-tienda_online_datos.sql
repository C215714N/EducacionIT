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
	SELECT *, monto * porcentaje/100 + monto AS "precio +iva" FROM facturacion;
    UPDATE facturacion, facturacion_detalle
    SET monto = (
		SELECT SUM(precio*cantidad) 
		FROM facturacion_detalle
		WHERE id_factura = facturacion.id_factura
		)  -- condicion suma facturacion_detalle
	WHERE facturacion.id_factura = facturacion_detalle.id_factura; -- condicion update facturacion
    
SELECT *, precio*cantidad AS total 
FROM facturacion_detalle;
## carga de productos vendidos facturacion_detalle
	INSERT INTO facturacion_detalle (id_factura,id_producto,cantidad)
		VALUES 
			(3,7,10),
			(3,5,3),
			(4,10,5),
			(4,9,6),
			(4,8,8),
			(5,12,2),
			(5,1,1),
			(6,6,5),
			(6,4,2);
## actualizacion de precios
	UPDATE facturacion_detalle
		SET precio = 
		(
			SELECT precio FROM productos -- tabla de busqueda
			WHERE id_producto = facturacion_detalle.id_producto -- validacion id_producto
		);
        
SELECT
	id_factura,
    categoria,
	CONCAT(apellido," ", nombre) AS cliente,
    CONCAT(tipo_doc,": ",num_doc) AS identificacion,
    monto,
    monto * porcentaje/100 + monto AS "precio +iva",
    fecha
FROM facturacion AS f
RIGHT JOIN clientes AS c
ON c.id_cliente = f.id_cliente
WHERE monto >= 50000;

SELECT 
	-- facturacion
    	f.id_factura AS remito,
		f.monto,
    -- clientes
		CONCAT(apellido, " ", nombre) AS cliente,
        CONCAT("correo: ", c.correo,"; Tel: ", c.telefono) AS datos,
	-- productos
		p.marca,
		p.modelo,
	-- detalle
		fd.precio,
        fd.cantidad,
        fd.precio * fd.cantidad AS total,
	-- proveedor
		pr.proveedor,
        pr.correo
FROM facturacion_detalle AS fd
RIGHT JOIN productos AS p
ON p.id_producto = fd.id_producto
RIGHT JOIN facturacion AS f
ON f.id_factura = fd.id_factura
RIGHT JOIN clientes AS c
ON c.id_cliente = f.id_cliente
RIGHT JOIN proveedores AS pr
ON pr.id_proveedor = p.id_producto