/* DDL (Data Definition Language) 
	CREAR / MODIFICAR / ELIMINAR => DB / TABLAS
*/

# Tabla Categorias
CREATE TABLE categories(
	category_id INT AUTO_INCREMENT,
    category_name VARCHAR(50),
    PRIMARY KEY(category_id),
    UNIQUE KEY(category_name)
);

# Tabla Marcas
CREATE TABLE brands(
	brand_id INT AUTO_INCREMENT,
    brand_name VARCHAR(50),
    PRIMARY KEY(brand_id),
    UNIQUE KEY(brand_name)
);

# Tabla Productos
CREATE TABLE products(
	product_id INT AUTO_INCREMENT,
    product_name VARCHAR(50),
    model VARCHAR(20),
    brand INT,
    category INT,
    PRIMARY KEY(product_id),
    UNIQUE KEY(product_name, model, brand),
    FOREIGN KEY(brand) REFERENCES brands(brand_id),
    FOREIGN KEY(category) REFERENCES categories(category_id)
);