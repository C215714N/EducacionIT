## actualizacion de campo especifico
	UPDATE proveedores
		SET cp = 3164 -- valor actualizacion
		WHERE id_proveedor = 2; -- condicion
        
	UPDATE proveedores
		SET telefono = '3856-1190-9182' -- valor actualizacion
		WHERE proveedor = 'Apple'; -- condicion

## actualizacion tipo_doc
	UPDATE clientes 
    SET tipo_doc = 
		CASE
			WHEN num_doc <= 15000000 THEN 'lc' -- condicion A
            WHEN num_doc <= 54000000 THEN 'dni' -- condicion B / valor si A no se cumple
            WHEN num_doc <= 80000000 THEN 'pass' -- condicion C / valor si AB no se cumple
            ELSE 'ci' -- valor si ABC no se cumple
        END;

## actualizar correo (concatenacion)
    UPDATE clientes
    SET correo = CONCAT( apellido ,'_', nombre , '@gmail.com');

## consulta de marcas
	SELECT marca
    FROM productos 
    GROUP BY marca;
    
## actualizacion por de categoria por marca
	UPDATE productos
		SET categoria =
			CASE
				WHEN marca IN('hp','dell','apple') THEN 'tecnologia' -- condicion A
				WHEN marca IN('samsung','atma','liliana','nestle') THEN 'hogar' -- condicion B / valor si A no se cumple
				WHEN marca IN('ayudin','suavecito','vim','trenet') THEN 'limpieza' -- condicion C / valor si AB no se cumple
				WHEN marca IN('adidas','nike','kappa') THEN 'indumentaria' -- condicion D / valor si ABC no se cumple
				ELSE 'otros' -- valor si ABCD no se cumple
			END;
        
SELECT * FROM facturacion;
	INSERT INTO facturacion_detalle(id_factura,id_producto, cantidad)
	VALUES 
		(2,9,2),
        (2,8,3),
        (3,10,4),
        (4,11,3),
        (4,12,3),
        (4,13,3),
        (5,14,2),
        (5,10,1),
        (6,6,1),
        (6,8,2);
        
SELECT * FROM productos WHERE precio <= 20000;
SELECT * FROM facturacion_detalle;
-- actualizacion dinamica
	UPDATE facturacion_detalle
		SET precio = (
			SELECT precio
			FROM productos
			WHERE facturacion_detalle.id_producto = productos.id_producto
		)
		WHERE id_factura > 5;

## gastos ordenados por cliente        
	SELECT 
		CONCAT(c.apellido," ",c.nombre) AS cliente, 
		CONCAT(c.tipo_doc,": ",c.num_doc) AS identificacion,
		SUM(fd.precio*fd.cantidad) AS Total 
		FROM facturacion_detalle as fd
		JOIN facturacion as f
			ON f.id_factura = fd.id_factura
		JOIN productos as p
			ON p.id_producto = fd.id_producto
		JOIN clientes AS c
			ON c.id_cliente = f.id_cliente
		GROUP BY fd.id_factura;

## actualizacion de monto Facturacion	
    UPDATE  facturacion_detalle AS fd, facturacion AS f
		SET monto = (
			SELECT SUM(cantidad * precio) 
			FROM facturacion_detalle
			WHERE id_factura = 1
			) -- id_factura facturacion_detalle (consulta precio)
		WHERE f.id_factura = 1; -- id_factura facturacion (consulta factura)

## actualizacion del iva	
	UPDATE facturacion
		SET iva =
			CASE
				WHEN categoria IN(3,4,6) THEN false
                ELSE true
            END,
		porcentaje_iva =
			CASE
               WHEN categoria IN(3,4,6) THEN 0 
               WHEN categoria IN(1,2,7,8) THEN 21
               ELSE 10.5
			END;

## totales facturacion_detalle            
	SELECT *, 
		sum(precio * cantidad) AS total 
		FROM facturacion_detalle 
		GROUP BY id_factura;

## unificacion de Tablas        
    -- considera productos como Base para la organizacion
	SELECT * FROM productos AS prod
	LEFT JOIN proveedores AS prov
	ON prov.id_proveedor = prod.id_proveedor;
	
    -- considera proveedores como Base para la organizacion
	SELECT * FROM productos AS prod
	RIGHT JOIN proveedores AS prov
	ON prov.id_proveedor = prod.id_proveedor;
    
	-- considera ambas tablas para la organizacion
	SELECT * FROM productos AS prod
	INNER JOIN proveedores AS prov
	ON prov.id_proveedor = prod.id_proveedor;
    
## actualizacion del stock
UPDATE facturacion_detalle AS fd, productos AS p
	SET stock = stock - cantidad
    WHERE p.id_producto = fd.id_producto;
    
## consulta de productos y clientes
	SELECT 
		-- tabla Facturacion
			f.id_factura,
            f.categoria,
            CONCAT(f.porcentaje_iva,"%") AS IVA,
        -- tabla clientes
			CONCAT(c.apellido, " ", c.nombre) AS cliente,
			CONCAT(c.tipo_doc,": ",c.num_doc) AS identificacion,
			CONCAT("Tel: ",c.telefono," , Correo:",c.correo) AS Contacto,
		-- tabla productos
			p.marca,
			p.modelo,
    -- tabla Facturacion_detalle
			fd.cantidad,
			fd.precio,
			(fd.precio * fd.cantidad) AS total
    FROM facturacion_detalle AS fd -- tabla Base
    JOIN facturacion AS f
		ON f.id_factura = fd.id_factura -- tabla facturacion
	JOIN clientes AS c
		ON c.id_cliente = f.id_cliente -- tabla clientes
    JOIN productos AS p
		ON fd.id_producto = p.id_producto -- tabla productos
	HAVING cliente LIKE '%L%';

## Obtener clientes, proveedores y montos
	SELECT 
		f.id_factura,
		GROUP_CONCAT(proveedor) AS proveedores, -- lista de proveedores
		CONCAT(apellido, " ", nombre) AS cliente, -- concatenacion
		monto
	FROM facturacion AS f
	LEFT JOIN clientes AS c
		ON f.id_cliente = c.id_cliente
	JOIN facturacion_detalle AS fd
		ON fd.id_factura = f.id_factura -- tabla faturacion_detalle
	RIGHT JOIN productos AS prod
		ON prod.id_producto = fd.id_producto -- tabla productos
	LEFT JOIN proveedores prov
		ON prov.id_proveedor = prod.id_proveedor -- tabla proveedores
	GROUP BY f.id_factura;