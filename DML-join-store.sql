USE store;
/*
	LEFT JOIN	- UNION: utiliza la tabla principal como base
    INNER JOIN	- INTERSECCION: registros en ambas tablas;
    RIGHT JOIN	- UNION: utiliza la tabla anidada como base
*/
-- nombre y apellido de clientes con facturacion emitida
	SELECT 
		id_factura, -- facturacion
		apellido, -- clientes
		nombre, -- clientes
		monto -- facturacion
	FROM facturacion AS f
	RIGHT JOIN clientes AS c
	ON c.id_cliente = f.id_cliente;
    
SELECT 
	id_factura, -- fd
    articulo, -- prod
    categoria, -- prod
    proveedor, -- prov
    cantidad, -- prod
    fd.precio, -- prod
    cantidad * fd.precio AS total
	FROM facturacion_detalle AS fd
	RIGHT JOIN productos AS prod 
	ON prod.id_producto = fd.id_producto
	JOIN proveedores AS prov 
	ON prov.id_proveedor = prod.id_proveedor
    ORDER BY id_factura;

SELECT
	fd.id_producto,
	articulo,
    categoria,
    proveedor,
    cantidad,
    fd.precio,
    cantidad * fd.precio AS total
FROM productos AS prod
LEFT JOIN facturacion_detalle AS fd
ON fd.id_producto = prod.id_producto
LEFT JOIN proveedores AS prov
ON prov.id_proveedor = prod.id_proveedor;

	SELECT
		## cliente
		CONCAT(apellido," ",  nombre) AS cliente, -- apellido y nombre
		CONCAT(tipo_doc,": ", sexo, num_doc) AS Identificacion, -- tipo sexo numero documento
		CONCAT("tel: ", c.tel, " - email: ", c.email) AS contacto, -- telefono y correo
		## productos
        articulo,
        categoria,
        valoracion,
        ## proveedores
        CONCAT(proveedor, " cuil: ", cuil) AS proveedor, -- nombre y cuil
        CONCAT("tel: ", prov.tel, " - email: ", prov.email) AS datos_prov, -- telefono y correo
        ## facturacion_detalle
		cantidad,
		## facturacion
		f.id_factura AS n°,
		tipo_pago AS m_pago,
		CONCAT(ROUND(impuesto * 100, 1), "%") AS iva, -- porcentaje de IVA
		ROUND(monto + monto * impuesto, 2) AS total -- calculo del total 
	FROM facturacion AS f
    ## clientes => facturacion
	JOIN clientes AS c
		ON c.id_cliente = f.id_cliente
	## facturacion_detalle => facturacion
	JOIN facturacion_detalle AS fd 
		ON fd.id_factura = f.id_factura
	## productos => facturacion_detalle => facturacion
	JOIN productos AS prod
		ON prod.id_producto = fd.id_producto
	## proveedores => productos => facturacion_detalle => facturacion
	JOIN proveedores AS prov
		ON prov.id_proveedor = prod.id_proveedor
;