/*	DDL Data Definition Language*/
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
);
DESCRIBE products;

/*DML Data Manipulation Language*/
# Tabla Categorias
INSERT INTO categories(category_name)
VALUES 	('tecnologia'), 
		('indumentaria'),
        ('deportes'), 
        ('botanica'),
        ('libreria'),
        ('hogar'),
        ('jugueteria'),
        ('automotor'),
        ('inmuebles'),
        ('muebles'),
        ('electrodomesticos'),
        ('ferreteria'),
        ('pintureria'),
        ('bazar');
# carga por asignacion (unica)
INSERT INTO categories
SET category_name = 'Alimentos';

# Tabla Marcas
INSERT INTO brands(brand_name)
VALUES 	('alicante'),
		('marolio'),
		('dunlop'),
		('wilson'),
		('liliana'),
		('tophouse'),
		('samsung'),
		('tcl'),
		('hp'),
		('bangho'),
		('bgh'),
        ('fiat'),
        ('volkswagen'),
        ('nescafe'),
        ('adadis'),
        ('pumba'),
        ('nike');

# Tabla Productos
INSERT INTO products(product_name, brand, category, stock, price)
VALUES 	
-- tecnologia
('Notebook 8470p', 9, 1, 1500, 69999.99), -- hp
('Tablet Tab-10', 7, 1, 5000, 45500), -- samsung
-- electrodomesticos
('',,11,,), -- bgh
('',,11,,), -- samsung
('',,11,,), -- nescafe
-- muebles
('',,10,,), -- tophouse
('',,10,,), -- dunlop
('',,10,,), -- wilson
-- alimentos
('',,15,,), -- alicante
('',,15,,), -- marolio
-- indumentaria
('',,2,,), -- nike
('',,2,,), -- adadis
('',,2,,), -- pumba
('',,2,,), -- nike
 -- botanica
('',,4,,), -- nescafe
('',,4,,); -- tcl
        
# Tabla Marcas
## Consulta General
SELECT * FROM brands -- consulta de marcas
ORDER BY brand_id DESC -- ordenado por ID
LIMIT 5 -- limitado a 5 resultados
OFFSET 10; --  a partir de la posicion 10

#Tabla Categorias
## Nombre que sea igual a Tecnologia
SELECT * FROM categories 
WHERE category_name = 'Tecnologia';
## Nombres que terminan en "ia"
SELECT * FROM categories
WHERE category_name LIKE '%ia'; -- % cualquier cantidad de caracteres
## Nombres que empiezan con "b"
SELECT * FROM categories
WHERE category_name LIKE 'b%'; -- %cualquier cantidad de caracteres
## Categoria Electrodomesticos Alimentos y Muebles
SELECT * FROM categories
WHERE category_name IN ('electrodomesticos','alimentos','muebles');