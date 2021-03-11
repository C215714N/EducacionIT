## clientes a los que no se facturo
    SELECT
	--  clientes
        apellido, 
        nombre,
        tipo_doc,
        num_doc,
    -- facturacion
		id_factura,
        monto,
        CONCAT(ROUND(impuesto * 100, 1), '%') AS iva,
        ROUND(monto + impuesto * monto, 2) AS total
	FROM facturacion AS f
    RIGHT JOIN clientes AS c
    ON c.id_cliente = f.id_cliente
    WHERE id_factura IS NULL;
/*
	INNER JOIN: Trae los valores que coinciden en ambas tablas.
    LEFT JOIN: Trae todos los valores de la tabla base y los combina con la otra tabla.
    RIGHT JOIN: combina los valores de la tabla base con todos los de la tabla anidada.
*/
DESCRIBE productos;
## productos comprados
	SELECT
		id_factura,
		producto,
        fd.cantidad,
        fd.precio,
        fd.precio * fd.cantidad AS total
	FROM facturacion_detalle AS fd
    RIGHT JOIN productos AS p
    ON p.id_producto = fd.id_producto;
    
/*
	facturacion => clientes (id_cliente)
    facturacion => facturacion_detalle (id_factura)
    facturacion_detalle => ingreso_productos (id_producto)
    ingreso_productos => productos (id_producto)
    ingreso_productos => proveedores (id_proveedor)
*/
-- facturacion detallada
SELECT 
	-- clientes
    CONCAT('sr/a: ', apellido, " ",nombre) AS cliente,
    CONCAT(tipo_doc,': ',num_doc) AS identificacion,
    -- facturacion
    f.id_factura AS 'n°',
    tipo_pago,
    CONCAT( ROUND( impuesto * 100, 1), '%' ) AS iva,
    -- productos
	producto,
    -- detalle
    fd.cantidad,
    fd.precio,
    ROUND( fd.cantidad * fd.precio, 2) AS total,
    -- proveedor
    proveedor,
    CONCAT('cuil: ', cuil, ' - dir: ', direccion)  AS info,
    CONCAT('tel: ', telefono, ' - email: ', correo) AS contacto
FROM facturacion AS f
JOIN clientes AS c
	ON c.id_cliente = f.id_cliente
JOIN facturacion_detalle AS fd
	ON fd.id_factura = f.id_factura
JOIN ingreso_productos AS ip
	ON ip.id_producto = fd.id_producto
JOIN productos AS prod
	ON prod.id_producto = fd.id_producto
JOIN proveedores AS prov
	ON prov.id_proveedor = ip.id_proveedor;
		
SELECT * FROM proveedores;
UPDATE proveedores 
	SET direccion = CONCAT('AV. ', proveedor, ROUND(RAND() * 1000), 0);