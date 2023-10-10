/* Relaciones
	Uno a Uno
    Uno a Muchos
    Muchos a Muchos
*/
/* DDL - Data Definition Language*/
# Tabla Categoria de Productos
CREATE TABLE categories(
	id INT AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(name)
);
# Tabla Productos a Publicar
CREATE TABLE products(
	id INT AUTO_INCREMENT,
    name VARCHAR(60),
    PRIMARY KEY(id),
    UNIQUE KEY(name)
);
# Productos por Categoria (Normalizacion)
CREATE TABLE product_categories(
	id INT AUTO_INCREMENT,
    product INT,
    category INT,
    PRIMARY KEY(id),
    UNIQUE KEY(product, category),
    FOREIGN KEY(product) REFERENCES products(id),
    FOREIGN KEY(category) REFERENCES categories(id)
);

/* DML - Data Manipulation Language */
# Carga de Categorias
INSERT INTO categories(name)
VALUES 	('indumentaria'),	('tecnologia'),		('inmuebles'),
        ('moda'), 			('informatica'), 	('botanica'),
		('alimentos'), 		('muebles'),		('hogar'),
        ('bebidas'),		('herramientas'),	('limpieza'),
        ('higiene'),		('jardineria'),		('construccion'),
        ('plomeria'),		('autopartes'), 	('mecanica');

# Carga de Productos
INSERT INTO products(name)
VALUES	('notebook'),		('netbook'),	('ultrabook'),
		('zapatillas'),		('remera'),		('pantalon'),
        ('corbata'),		('flores'),		('abono'),
        ('destornillador'),	('martillo'),	('llave inglesa'),
        ('llave francesa'),	('serrucho'),	('comoda'),
        ('placard'),		('esquinero'),	('aparador'),
        ('mesa de luz'),	('mesa'),		('tablet'),
        ('mesa ratona'),	('sillas'),		('sommier'),
        ('colchon'),		('televisor'),	('aire acondicionado'),
        ('auriculares'),	('parlantes'),	('cesped artificial'),
        ('lavarropas'), 	('secarropas'), ('plancha'),
        ('neumaticos'),		('lampara'),	('motor'),
		('pintura'),		('estereo'), 	('limpiaparabrisas');