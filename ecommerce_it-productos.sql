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

# Insercion de Registros
## Tabla Categorias
INSERT INTO categories(category_name)
VALUES 	('Tecnologia'), ('Hogar'), ('Botanica'), ('Electronica'), ('Indumentaria'), ('Calzado'), 
		('Bazar'), ('Biblioteca'), ('Jugueteria'), ('Automotor'), ('NFT'), ('alimentos');
## Tabla Marcas
INSERT INTO brands(brand_name)
VALUES 	('H3.14'), ('zamzung'), ('Fürd'), ('Adadis'), ('Naik'),
        ('Pumba'), ('Sorny'), ('Panoramico'), ('Tapper'), ('LJ'),
        ('Chebrolet'), ('puerto de patos'), ('jigabit'), ('de Luna'), ('tong');
        
## Tabla Productos
INSERT INTO products (product_name, brand, category)
VALUES
-- categoria tecnologia
('Notebook', 1, 1), -- H3.14
('Tablet',2, 1), -- zamzung
('Tablet', 10, 1), -- LJ
-- categoria electronica
('Procesador Intel', 2,4), -- zamzung
('Procesador Intel', 1,4), -- H3.14
('Memoria RAM', 13, 4), -- Jigabit
-- categoria calzado
('air max', 6, 5),	-- naik
('predeitor',6, 4), -- adadis
('adadis max', 6, 4); -- adadis
