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

## Actualizacion aleatoria
### Numero de publicacion
UPDATE sales 
SET post = CEIL(RAND() * 5) -- numero aleatorio entre 1 y 5 (redondeado hacia arriba)
WHERE post IS NULL; -- siempre que post no este especificado en la venta (NULO)

### Numero de Usuario
UPDATE sales
SET user = FLOOR(RAND() * 5 + 3) -- usuario entre 3 y 7 (redondeado hacia abajo)
WHERE user IS NULL; -- siempre que el usuario no este definido (NULL)

SELECT * FROM sales;