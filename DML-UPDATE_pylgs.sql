	USE pepe_y_los_globos_store;
/*DELETE*/
DELETE FROM sales_detail; -- eliminacion completa
TRUNCATE sales_detail; -- reinicia la tabla

/*UPDATE*/
-- productos
UPDATE products -- tabla
SET stock = 500, price = 2400 -- campo = valor
WHERE product_id = 5; -- condicion

UPDATE products
SET stock = ( -- actualizacion de stock
	SELECT SUM(quantity) -- campo calculado (valor de actualizacion)
    FROM transactions  -- tabla consultada
    WHERE product = product_id -- condicion (requerida)
); -- actualizacion de cantidades (dinamica)

UPDATE products
SET price = ( -- actualizacion de precios
	SELECT ROUND(MAX(price) * 1.21, 2) -- campo calculado (precio + iva)
    FROM transactions -- tabla consultada
    WHERE product = product_id -- condicion consulta
)	WHERE price = 0 OR price IS NULL; -- condicion actualizacion

-- ventas
UPDATE sales_detail
SET price = ( -- actualizacion de precios
	SELECT price -- valor consultado
    FROM products -- tabla consultada
    WHERE product_id = product -- condicion (requerida)
) 	WHERE price IN(0,NULL); -- condicion actualizacion

UPDATE sales
SET total = ( -- actualizacion de compra
	SELECT SUM(price * quantity) -- suma los totales de productos
    FROM sales_detail -- tabla detalle
    WHERE sale = sale_id -- condicion (misma factura)
) WHERE total IS NULL; -- condicion (no debe poseer valor)