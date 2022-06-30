/*	DDL Data Definition Language*/
USE negocio_it;
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
('Aire split 3300w bgh-400',11,11, 5000, 85999.99), -- bgh
('Aire split 2500w shc-2350',7,11,3500,120500), -- samsung
('Cafetera Dolce gusto f50',14,11,25386, 32499.99), -- nescafe
-- muebles
('Modular TV th-5400',6,10,8500,35600), -- tophouse
('Modular Microondas d-300',3,10,1300,15300), -- dunlop
('Combo Mesa y sillas 6u',4,10,1200,35300), -- wilson
-- alimentos
('Sobre Provenzal 500g',1,15,28900,250), -- alicante
('Aceite 1l',2,15,36803, 560), -- marolio
-- indumentaria
('Campera talle L',17,2,23000, 5600), -- nike
('Camiseta talle XL',15,2,12500,2000), -- adadis
('Camiseta talle XXL',16,2,1000,1300), -- pumba
('Camiseta talle M',17,2,44000,9000), -- nike
 -- botanica
('Abono 500g',14,4, 8400,600), -- nescafe
('Ramo Jazmin 12u',8,4,24000,500); -- tcl
        
## Carga por asignacion y subconsulta
INSERT INTO products 
SET 	product_name = 'Notebook x360',
		brand = (SELECT brand_id FROM brands WHERE brand_name = 'HP'),
        category = (SELECT category_id FROM categories WHERE category_name = 'tecnologia'),
        stock = 11459,
        price =  120599.99;
## Producto de Ultimo momento
INSERT INTO products(product_name)
VALUES ('Pista Hotwheels AT580');
## Actualizacion de Producto Hotwheels
UPDATE products
SET stock = 3000,
	price = 9999,
    category = (SELECT category_id FROM categories WHERE category_name = 'Jugueteria')
WHERE product_name LIKE '%PISTA%HOTWHEELS%';

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

# Tabla Marcas
## Informacion cuyas marcas se encuentren en los valores especificados
SELECT * FROM brands
WHERE brand_name IN('bgh', 'samsung', 'nescafe', 'tophouse', 'dunlop', 'wilson');
## informacion cuyas marcas se encuentre entre los id especificados
SELECT * FROM brands
WHERE brand_id BETWEEN 8 AND 10 OR brand_id > 14;

#Tabla Productos
SELECT * FROM products;
SELECT
	product_id,
    product_name,
    stock,
    CASE
		WHEN stock <= 2000 THEN "reponer"
        WHEN stock <= 5000 THEN "cuidado"
        WHEN stock <= 10000 THEN "estable"
        ELSE "vender urgente"
    END AS situation,
    CASE
		WHEN stock >= 10000 THEN 0
        ELSE 10000 - stock
    END AS needed,
    price,
    CASE 
		WHEN price >= 50000 THEN "Costoso"
        WHEN price >= 10000 THEN "Moderado"
        WHEN price >= 5000 THEN "Accesible"
        ELSE "economico"
    END AS user_feedback
FROM products
WHERE stock < 10000
HAVING needed > 5000 -- condicion para columnas que no existen en la tabla
ORDER BY stock, price;

SELECT * FROM products;


