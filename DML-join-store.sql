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




