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