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
		