# Tabla Categorias
CREATE TABLE categories(
	category_id INT AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL, -- debe almacenar algo
    PRIMARY KEY(category_id), -- clave principal (campo relacional)
    UNIQUE KEY(category_name) -- clave unica (campo local)
);
DESCRIBE categories;

# Tabla Marcas
CREATE TABLE brands(
	brand_id INT AUTO_INCREMENT,
    brand_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(brand_id),
    UNIQUE KEY(brand_name)
);
DESCRIBE brands;

# Tabla productos
CREATE TABLE products(
	product_id INT AUTO_INCREMENT,
    product_name VARCHAR(50),
    product_description VARCHAR(200),
    brand INT,
    category INT,
    stock INT,
    price DOUBLE,
    PRIMARY KEY(product_id),
    UNIQUE KEY (product_name, brand, category),
    FOREIGN KEY(brand) REFERENCES brands(brand_id), -- campo local => tabla(campo)
    FOREIGN KEY(category) REFERENCES categories(category_id) -- clave foranea (relacional)
)

