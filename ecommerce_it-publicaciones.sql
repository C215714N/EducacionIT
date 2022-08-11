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