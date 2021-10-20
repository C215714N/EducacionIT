/*DATA MANIPULATION LANGUAGE 
	lenguaje de manipulacion de datos
    se utiliza para la carga de registros en las tablas
    para consulta, actualizacion y eliminacion de los mismos
*/
USE pepe_y_los_globos_store;
## Carga de Datos
-- clientes
INSERT INTO customers -- carga completa (ORDINAL)
VALUES (0, 'c215714n', 'cristiandracedo@hotmail.com', 'root');

INSERT INTO customers(customer_email, customer_pass) -- carga selectiva
VALUES ('cristiandracedo@gmail.com', 'root');

## Consulta de Datos
-- clientes
SELECT * FROM customers; -- consulta total