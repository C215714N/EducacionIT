SELECT * FROM proveedores;
 -- Insertar Registros completos
INSERT INTO proveedores
	VALUES (
    '',
    'HP',
    '30-26789410-8',
    'Av. Hewllet Packard 53',
    2436,
    '11-4675-1234',
    'info@hp.com',
    'proveedor Notebooks / Impresoras'
    );
    
-- Insertar registros (Campos especificos)
INSERT INTO proveedores(cuil, proveedor, direccion)
	VALUES 
		('27-12398471-4', 'Dell', 'Av. Siempreviva 2020'),
		('14-11238498-2', 'Apple', 'Californica 51'),
        ('25-12934801-1', 'Samsung', 'Korea 1286');

UPDATE proveedores
	SET cp = 3164
    WHERE id_proveedor = 2;
    
UPDATE proveedores
	SET telefono = '3856-1190-9182'
    WHERE proveedor = 'Apple';

-- Carga de Productos
	INSERT INTO productos(marca, modelo, precio, stock, id_proveedor)
		VALUES ('HP', '8470p', 25999, 100, 1);
	SELECT marca, modelo, id_producto from productos;