## CONSULTA DE DATOS
USE pepe_y_los_globos_store;
-- clientes
SELECT customer_name, customer_email FROM customers
WHERE customer_name IS NULL; -- cliente sin nombre de usuario

SELECT * FROM customers_data
WHERE customer = 1; -- datos del cliente 1 (c215714n)

SELECT 
	LEFT(first_name, 1) AS initial, -- extrae una cant. de caracteres de izquierda a derecha
    RIGHT(phone, 4) AS last_digits, -- extrae una cant. de caracteres de derecha a izquierda
    SUBSTRING(cuit, 4, 8) AS document -- extrae una cant. de caracteres a partir de la posicion especificada
FROM customers_data;

SELECT 
	CONCAT('sr/a.: ', last_name, " ", first_name) AS client, -- combina cadenas de texto
	CURDATE() AS today, -- retorna la fecha actual
    ROUND((DATEDIFF(CURDATE(), birth) / 365), 2) AS age -- retorna la diferencia en dias entre la primer fecha y la segunda
FROM customers_data;

-- productos
SELECT * FROM products;
SELECT *, 'Reponer' AS situacion FROM products
WHERE stock <= 10; -- productos con menos de 10 unidades

SELECT description, stock FROM products -- tabla de origen
ORDER BY description -- criterio de orden
LIMIT 3 -- cantidad de registros n
OFFSET 3; -- a partir de la posicion x

-- proveedores
SELECT cuit, description FROM providers
ORDER BY cuit, description DESC; -- orden de resultados

SELECT 
	'hp' AS seller, -- campo agregado/calculado (no existe en la tabla)
    product, 
    quantity, 
    price FROM transactions 
WHERE provider = 1; -- compra cuyo proveedor sea HP

SELECT * FROM transactions
WHERE quantity >= 100; -- compra de mas de 100 productos

SELECT * FROM transactions
WHERE price >= 50000 AND quantity > 50; -- condicion excluyente

SELECT * FROM transactions
WHERE provider = 1 OR product = 1; -- condicion integradora (provedor HP o Notebook 8470p)

SELECT * FROM transactions
WHERE provider IN(1,2,5); -- condicion de multiples valores

SELECT * FROM transactions
WHERE provider BETWEEN 3 AND 6; -- resultado entre los valores especificados
/*
	AND | C1f | C1v		OR  | C1v | C1f		XOR | C1f | C1v
    C2f |  F  |  F		C2v |  V  |  V		C2f |  F  | V
    C2v |  F  |  V		C2f |  V  |  F		C2v |  V  | F 
*/

SELECT 
	product, 
    quantity, 
    price,
    quantity * price AS total,
    ROUND(price * 50 / 100, 2) AS charge
FROM transactions;

SELECT 
	MIN(price) AS cheapest, -- devuelve el menor valor entre los registros (columna)
	MAX(price) AS most_expensive, -- devuelve el valor mas alto entre los registros (columna)
    ROUND(AVG(price), 2) AS average -- calcula el promedio entre registros (columna)
FROM transactions;

-- ventas
SELECT
    pay_method,
	COUNT(pay_method) AS total_sales, -- cuenta los registros
    SUM(total) AS total_price -- suma todos los registros
FROM sales
GROUP BY pay_method; -- agrupa los valores segun lo indicado