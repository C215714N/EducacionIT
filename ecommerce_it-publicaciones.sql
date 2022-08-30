# Eliminaciones Inseguras
DELETE FROM products; -- eliminacion sin restricciones
TRUNCATE users; -- reinicio de tabla
# Eliminacion condicional
DELETE FROM products -- tabla cuyos registros seran afectados
WHERE brand = 1; -- todo registro cuya marca sea H3.14 (brand_id = 1)

# Tabla Publicaciones
DROP TABLE IF EXISTS posts;
CREATE TABLE posts(
	post_id INT AUTO_INCREMENT,
    user INT, -- vendedor
    product INT,
    post_title VARCHAR(50),
    description VARCHAR(200),
    stock INT,
    price DECIMAL(18,4),
    post_date DATETIME DEFAULT current_timestamp(),
    post_update DATETIME DEFAULT current_timestamp(),
    PRIMARY KEY(post_id),
    FOREIGN KEY(user) REFERENCES users(user_id),
    FOREIGN KEY(product) REFERENCES products(product_id)
);
# Tabla Ventas
CREATE TABLE sales(
	sale_id INT AUTO_INCREMENT,
    post INT, 
    user INT, -- comprador
    quantity INT,
    price DECIMAL(18,4),
    sale_date DATETIME DEFAULT current_timestamp(),
    PRIMARY KEY(sale_id),
    FOREIGN KEY(post) REFERENCES posts(post_id)
);
ALTER TABLE sales
MODIFY sale_id INT AUTO_INCREMENT, -- cambia tipo de dato y parametro extra
ADD CONSTRAINT FOREIGN KEY(user) REFERENCES users(user_id); -- agregamos clave foranea

## Carga de Publicaciones
SELECT * FROM products;
INSERT INTO posts(user, product, post_title, stock, price)
VALUES 	(1,6,'Memoria HyperX 16gb ddr4',20,24500), -- Memoria RAM | c215714n
		(4,9,'Zapatillas Talles del 21 al 50', 5000, 31999), -- Adadis MAX | Batman
        (1,10,'Tarjeta RX3070 Gddr6 10Gb',50,285000), -- Placa de Video | c215714n
        (1,2,'Tab A13"', 200, 65300), -- Tablet | c215714n
		(3,7,'Calzado Air MAX Talles del 39 al 70',2500,45800); -- Air Max  | cristian

## Carga de Ventas
### Carga por consulta SELECT campo unico
INSERT INTO sales(user) -- tabla a insertar registros
SELECT user_id FROM users WHERE user_id > 4; -- lista de valores a cargar
## Carga por consulta SELECT multiples campos
INSERT INTO sales(post, quantity, price) -- tabla objetivo
SELECT post_id, CEIL(stock / 100), price FROM posts; -- consulta de origen
## Venta de Ultimo Momento
INSERT INTO sales
SET	post = 1,
	user = (SELECT user_id FROM users WHERE username = 'Batman'),
    quantity = 4,
    price = (SELECT price FROM posts WHERE post_id = 1);
### Venta de ULTIMO MOMENTO
INSERT INTO sales
SET	post = 3,
	user = (SELECT user_id FROM users WHERE username = 'Wonder'),
    quantity = 2,
    price = (SELECT price FROM posts WHERE post_id = 3);
## Cambio de comprador
UPDATE sales 
SET user = 4 
WHERE sale_id = 10;
## Cancelacion de la venta
DELETE FROM sales
WHERE sale_id = 10;

## Actualizacion por subconsulta dentro de subconsulta
UPDATE posts -- tabla a actualizar
SET stock = stock - (SELECT quantity FROM sales WHERE sale_id = ( -- cantidad 4
	SELECT MAX(sale_id) FROM sales WHERE user = 4 )	) -- ultimo sale_id 9 para Batman
WHERE post_id = 1; -- solamente para la publicacion 1

## Actualizacion aleatoria
### Numero de publicacion
UPDATE sales 
SET post = CEIL(RAND() * 5) -- numero aleatorio entre 1 y 5 (redondeado hacia arriba)
WHERE post IS NULL; -- siempre que post no este especificado en la venta (NULO)

### Numero de Usuario
UPDATE sales
SET user = FLOOR(RAND() * 5 + 3) -- usuario entre 3 y 7 (redondeado hacia abajo)
WHERE user IS NULL; -- siempre que el usuario no este definido (NULL)

### Actualizacion de Precios por SubConsulta
UPDATE posts
SET price = (SELECT price FROM sales WHERE post = post_id);

## Actualizacion por casos cantidad segun el precio
UPDATE sales
SET price = (SELECT price FROM posts WHERE post_id = post), -- precio del registro que coincida con el numero de publicacion
quantity = CASE -- evaluacion de casos
	WHEN price >= 50000 THEN 1 -- si 1 entonces a
	WHEN price >= 20000 THEN 2 -- si no 1 pero 2 entonces b
	ELSE 5 -- si no 1 y 2 entonces c
END -- fin de la evaluacion
WHERE price IS NULL; -- condicion para realizar las actualizacion

## Consulta por casos Cuotas segun el precio
SELECT *,
	CASE
		WHEN PRICE >= 50000 THEN 'Hasta 18 cuotas'
        WHEN price >= 20000 THEN 'Hasta 12 cuotas' 
        ELSE 'Hasta 6 cuotas'
    END AS credito
FROM sales;
## aumento del 15% en todas las publicaciones
UPDATE posts
SET price = price * 1.15; 
## Aumento del 30% para las publicaciones del Usuario c215714n
UPDATE posts
SET price = price * 1.3
WHERE user = 1;
## Actualizacion de Stock en publicaciones que tuvieron ventas
UPDATE posts, sales
SET stock = stock - (SELECT SUM(quantity) FROM sales WHERE post = post_id) -- Calcula el total de articulos vendidos y lo resta del stock
WHERE post = post_id; -- prevencion de actualizacion de caso de valor NULL
## Estadisticas de ventas organizada por publicacion
SELECT 
	post,
    SUM(quantity) AS sold, -- suma la cantidad de articulos vendidos
    COUNT(quantity) AS sales, -- conteo de ventas realizadas
    MIN(quantity) AS min, -- cantidad minima vendida
    MAX(quantity) AS max, -- cantidad maxima vendida
    ROUND(AVG(quantity), 2) AS average -- promedio de articulos por venta
FROM sales
GROUP BY post; -- separado por numero de publicacion

## Total de cada venta
SELECT 
	sale_id,
    p.post_title,
    CONCAT_WS(", ",last_name, first_name) AS customer,
    s.quantity,
    s.price,
    (s.price * s.quantity) AS total,
    s.sale_date
FROM sales AS s
JOIN users_data AS ud ON ud.user = s.user
JOIN posts AS p ON p.post_id = s.post;

## Total gastado por usuario
SELECT
	CONCAT_WS(", ",last_name, first_name) AS customer,
    COUNT(quantity) AS sales,
    SUM(price * quantity) AS total
FROM sales AS s 
JOIN users_data AS u ON u.user = s.user
GROUP BY s.user;