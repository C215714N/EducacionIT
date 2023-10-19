/* DDL - Data Definition Language */
# Tabla publicaciones de usuario
CREATE TABLE posts(
	id INT AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    description LONGTEXT NOT NULL,
    user INT,
    product INT,
    post_date datetime DEFAULT CURRENT_TIMESTAMP, -- por defecto fecha y hora actual
	price DECIMAL(16,4), -- (digitos totales, decimales)
    stock INT,
    PRIMARY KEY(id),
    FOREIGN KEY(user) REFERENCES users(id),
    FOREIGN KEY(product) REFERENCES products(id)
);
# Tabla ventas por pulicacion
CREATE TABLE sales(
	id INT AUTO_INCREMENT,
    post INT,
    price DECIMAL(16,4),
    quantity INT,
    user INT,
    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(post) REFERENCES posts(id),
    FOREIGN KEY(user) REFERENCES users(id)
);

/* DML - Data Manipulation Language */
## Eliminacion de datos (DESACTIVAR safe updates)
DELETE FROM posts; -- tabla a eliminar registros
ALTER TABLE posts AUTO_INCREMENT = 1; -- reinicio de numeracion

## Reinicio de tabla (No deben existir relaciones con esta tabla)
TRUNCATE sales; -- elimina los registros y reestablece la numeracion

# Tabla Publicaciones de usuarios
## Carga Multiple de Publicaciones
INSERT INTO posts(title, user, product, price, stock)
VALUES
	("Mesa Ratona de Coleccion", 4, 22, 50000, 6), -- Galan Lucia
    ("Sommier Queen Size", 4, 24, 125999.99, 2), -- Galan Lucia
    ("Tablet Galaxy Tab10", 5, 21, 155320, 10), -- Galan Joaquin
    ("Zapatillas Pimpi Edicion Limitada", 4, 4, 35780, 2000), -- Galan Lucia
    ("Aire Split Inverter 3000 Frigorias", 6, 27, 359999.99, 10), -- Fernandez Leandro
    ("Smart Tv 59 Pulgadas",6, 26, 236800, 50), -- Fernandez Leandro
    ("Acondicionador Pega la Vuelta", 5, 45,3900,5400); -- Galan Joaquin

## Creacion de Publicaciones Aleatorias
INSERT INTO posts(user, product)
VALUES ( -- RAND genera un numero flotante entre 0 y 1
	ROUND(RAND() * 3 + 3), -- indicamos a partir de que usuario empezamos
    CEIL(RAND() * 28) -- multiplicamos por la cantidad de productos
);
### Actualizacion de Valores
UPDATE posts
SET	title = CONCAT((SELECT name FROM products WHERE id = product), -- nombre del producto
	" publicado por ", (SELECT username FROM users WHERE id = user)), -- nombre de usuario
	price = RAND() * 65000 + 10000, -- entre 10000 y 750000
    stock = ROUND(RAND() * 100 + 100) -- entre 100 y 200 unidades
WHERE title = "";

# Tabla Ventas por publicacion
INSERT INTO sales(post, user, quantity)
VALUES 
	(4,1,2),(6,1,3),(7,1,2),(1,1,1), -- Racedo Cristian
    (3,6,5),(2,6,1),(4,6,10); -- Fernandez Leandro

## Ventas Aleatorias
INSERT INTO sales(post, user)
VALUES (
	CEIL(RAND() * 17), -- publicacion elegida de las 17
    CEIL(RAND() * 9 + 8) -- usuarios con id entre 8 y 17
);
### Actualizacion de precios
UPDATE sales
SET price = (SELECT price FROM posts WHERE id = post)
WHERE price IS NULL;

### Acualizacion de Cantidades
UPDATE sales
SET quantity = 
CASE -- actualizacion por casos (condiciones para establecer el valor)
	WHEN price > 100000 THEN ROUND(RAND() * 2 + 1) -- si supera los 100mil entre 1 y 3
	WHEN price > 50000 THEN ROUND(RAND() * 5 + 1) -- si supera los 50mil entre 1 y 6
	WHEN price > 10000 THEN ROUND(RAND() * 8 + 1) -- si supera los 10mill entre 1 y 9
	ELSE ROUND(RAND() * 10 + 5) -- para todo lo demas entre 5 y 15
END -- fin del analisis de casos
WHERE quantity IS NULL; -- condicion para actualizar

# Consultas
## Publicaciones del mes de Septiembre
SELECT * FROM posts
WHERE post_date BETWEEN '2023-09-01' AND '2023-09-30'; -- rango de numeros
## TOTALES por Venta Realizada
SELECT user, post, price, quantity,
	price * quantity AS total -- campo calculado (no existe)
FROM sales;

## Cantidad de Ventas por Publicacion
SELECT 
	post,
	COUNT(post) sales, -- cantidad de ventas
    SUM(quantity) AS products, -- total de productos vendidos
    ROUND(AVG(quantity)) AS average, -- promedio de productos vendidos
    SUM(price * quantity) AS total -- total por venta
FROM sales
GROUP BY post; -- agrupado por publicacion

## Gastos por usuario
SELECT
	user,
    COUNT(user) AS bought, -- cuenta los registros
    SUM(price * quantity) AS total -- suma de totales 
FROM sales
GROUP BY user; -- agrupado por usuario

## Detalle de Compra
SELECT * FROM sales;
SELECT 
	c.username AS customer,
	p.id,
    p.title,
    cat.name AS category,
    s.price * s.quantity AS total,
    s.sale_date,
    u.username AS publisher
FROM sales AS s 
JOIN posts AS p ON p.id = s.post
JOIN users AS c ON c.id = s.user
JOIN users AS u ON u.id = p.user
JOIN product_categories AS pc ON pc.product = p.product
JOIN categories AS cat ON cat.id = pc.category;

# Actualizacion de Precios en ventas
UPDATE sales
SET price = (SELECT price FROM posts WHERE id = post)
WHERE price IS NULL;

### AUMENTO DE PRECIOS EN UN 20%
UPDATE posts
SET price = price * 1.2; -- nuevo precio es el 120% del total

### Recuento de Ventas realizadas
SELECT
	post,
    SUM(quantity) AS bought,
    SUM(s.price * quantity) AS money,
    s.price
FROM sales AS s
JOIN posts AS p ON p.id = s.post
GROUP BY post
ORDER BY bought DESC;

### Actualizacion de STOCK
UPDATE posts AS p
SET stock = (SELECT SUM(quantity) FROM sales WHERE post = p.id) -- suma de cantidades vendidas
WHERE p.id IN(SELECT DISTINCT post FROM sales); -- id de publicacion en ventas (sin repetir)