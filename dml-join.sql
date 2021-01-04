USE comercio;
SELECT * FROM facturacion;
## consulta JOIN
	SELECT  
		id_factura,
		apellido,
		nombre,
        c.id_cliente,
		monto,
		medio,
        tipo
	FROM clientes AS c -- LEFT: todos los valores Tabla Principal
	JOIN facturacion AS f -- INNER: solamente los Valores Coincidentes
	ON f.id_cliente = c.id_cliente -- RIGHT: todos los valores Tabla Anidada
    ORDER BY id_factura, id_cliente;
    
-- detalle de factura
	SELECT 
		## tabla facturacion
        f.id_factura AS n°,
        ## tabla clientes
        CONCAT("sr/sra: ", apellido," ", nombre) AS cliente,
        CONCAT(tipo_doc,": ", num_doc) AS documento,
        ## tabla productos
        categoria,
        modelo,
		## tabla facturacion_detalle
        fd.cantidad,
        fd.precio,
        (fd.cantidad * fd.precio) AS total,
        ## tabla proveedor
        razon_social AS proveedor
    FROM facturacion_detalle AS fd -- tabla principal
    JOIN facturacion as f 
		ON f.id_factura = fd.id_factura
	JOIN clientes as c 
		ON c.id_cliente = f.id_cliente
    JOIN productos as prod 
		ON prod.id_producto = fd.id_producto
	JOIN proveedores AS prov 
		ON prov.id_proveedor = prod.id_proveedor
	ORDER BY n°;
    
    SELECT 
		CONCAT(apellido," ", nombre) AS cliente,
        razon_social AS proveedor,
        COUNT(fd.id_detalle) AS compras
	FROM clientes AS c
    JOIN facturacion AS f
		ON f.id_cliente = c.id_cliente
    JOIN facturacion_detalle AS fd
		ON fd.id_factura = f.id_factura
    JOIN productos as prod
		ON prod.id_producto = fd.id_producto
    JOIN proveedores as prov
		ON prov.id_proveedor = prod.id_proveedor
	GROUP BY cliente, proveedor;