CREATE TABLE facturacion(
	id_factura INT AUTO_INCREMENT,
    tipo ENUM('debe','haber'),
    categoria ENUM(
		'efectivo',
        'credito',
        'debito',
        'cheque',
        'transferencia',
        'deposito',
        'nota de credito',
        'nota de debito',
        'electronico',
        'otro'
    ),
    impuesto ENUM (
		'ninguno',
		'IVA',
        'IIBB',
        'ganancia',
        'otro'
    ),
    porcentaje DECIMAL,
    monto DECIMAL,
    bonificacion DECIMAL,
    id_cliente INT,
    fecha DATETIME,
    PRIMARY KEY (id_factura),
    UNIQUE KEY (tipo, categoria, monto, id_cliente, fecha),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
SELECT * FROM facturacion;
INSERT INTO facturacion(tipo, categoria,id_cliente,fecha)
	VALUES 
		(2,1,5,'2020-09-23,14:00'),
		(2,2,1,'2020-09-23,15:00'),
        (1,7,4,'2020-09-30,19:00');

SELECT * FROM facturacion_detalle;
INSERT INTO facturacion_detalle(id_factura, id_producto, cantidad)
	VALUES
		(1,3,1),
        (1,4,2),
        (1,7,10),
        (1,6,2),
        (1,5,5);
## actualizacion de precios (factuacion_detalle)
	UPDATE facturacion_detalle
		SET precio = (
			SELECT precio 
			FROM productos
			-- tabla.campo = tabla.campo (coincidencia segun id_producto)
			WHERE facturacion_detalle.id_producto = productos.id_producto
		);

UPDATE facturacion
	SET 
		monto = 302095,
        impuesto = 'iva',
        porcentaje = 21,
        bonificacion = 0
	WHERE id_factura = 1;

SELECT * from Facturacion;

SELECT 
	id_producto, 
	SUM(cantidad * precio) AS total
FROM facturacion_detalle
GROUP BY id_factura;
SELECT * FROM facturacion_detalle;
SELECT id_producto, marca, modelo FROM productos;
SELECT id_cliente, nombre, apellido 
FROM clientes
WHERE apellido LIKE 'B%';


SELECT * FROM facturacion;
CREATE TABLE facturacion_detalle (
	id_detalle INT AUTO_INCREMENT,
    id_factura INT,
    id_producto INT,
    cantidad INT,
    precio DECIMAL,
    PRIMARY KEY(id_detalle),
    UNIQUE KEY(id_factura, id_producto),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_factura) REFERENCES facturacion(id_factura)
);