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
INSERT INTO products(name) 
VALUES ('aspiradora'),		('escoba'),		('acondicionador');
# Carga de Relaciones (producto => Categoria)

# Consultas
## Categorias que terminan en "ica"
SELECT * FROM categories
WHERE name LIKE "%ca"; -- % (ninguno, uno o mas caracteres)

## Categoria que empieza con in, luego sigue otra letra, una u y el resto
SELECT * FROM categories
WHERE name LIKE "in_u%"; -- _ (un caracter cualquiera)

## Productos que empiecen con "mesa "
SELECT * FROM products 
WHERE name LIKE "mesa%"; -- % (ninguno, uno o mas caracteres)

## Productos que terminan en "ropas"
SELECT * FROM products 
WHERE name LIKE "%ropas"; -- % (ninguno, uno o mas caracteres)

## Consultas con limitantes
SELECT * FROM products -- consulta de datos
ORDER BY id DESC -- orden de los resultados (ASC / DESC)
LIMIT 10 -- cantidad de resultados a mostrar (limite)
OFFSET 0; -- a partir del registro especificado (desplazamiento )

# Funciones SQL
## Cantidad de Registros en Productos
SELECT 
	COUNT(id) AS total, -- campo calculado (no existe en tabla)
    MAX(id) AS highest, -- funcion(parametro)
    MIN(id) AS lowest -- alias (apodo) => identificador
FROM products;