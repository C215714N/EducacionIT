/* DDL (Data Definition Language)*/
# Tabla Editoriales
CREATE TABLE publishers(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);
# Tabla Autores
CREATE TABLE authors(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);
# Tabla Generos literarios
CREATE TABLE literary_genres(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);
# Tabla Libros
CREATE TABLE books(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    stock INT UNSIGNED NOT NULL, -- solamente valores positivos
    price DECIMAL(11,2) UNSIGNED NOT NULL, -- almacena un valor
    edition INT(4) DEFAULT 1,
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);
# Tabla Comprobantes de Alquiler de Libros
CREATE TABLE books_rent(
	id INT AUTO_INCREMENT,
    user INT,
    rent_date DATETIME DEFAULT CURRENT_TIMESTAMP, -- fecha y hora
    return_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(11,2),
    PRIMARY KEY(id),
    FOREIGN KEY(user) REFERENCES users(id)
);
# Tabla Detalle de Alquiler de Libros
CREATE TABLE books_rent_detail(
	id INT AUTO_INCREMENT,
    ticket INT,
    book INT,
    price DECIMAL(11,2),
    returned BOOLEAN DEFAULT FALSE,
    PRIMARY KEY(id),
    UNIQUE KEY(ticket, book),
    FOREIGN KEY(ticket) REFERENCES books_rent(id),
    FOREIGN KEY(book) REFERENCES books(id)
);

/* DML (Data Manipulation Language) */
# Tabla Libros
## Carga Selectiva Multiple de Libros
INSERT INTO books(description, stock, price)
VALUES 	("El Fantasma de Canterville",150, 3999.99),
		("100 años de soledad", 200, 5400),
		("El ultimo de los mohicanos",320,1999.99),
		("El principito", 230, 6300),
		("Dracula", 3000, 1288);
        
INSERT INTO books(description, stock, price)
VALUES 	("El 100% de la felicidad",320,4899.99), -- Pedro Sifontes
		("El 50% de la felicidad",2400, 2499.99),
		("El 10% de la felicidad",4290, 489.99),
		("El 1% para la libertad",1030, 5999.99), -- Carlos Sabino
		("El 1% de la solución", 200, 3200); -- Thomas L Friedman
## Libros ordenados por costo  y cantidad
SELECT * FROM books -- consulta de datos estandar
ORDER BY price, stock -- orden ascendente de valores
LIMIT 20 -- cantidad de resultados a mostrar
OFFSET 0; -- a partir de que resultado

## Libros que empiezan con "El";
SELECT * FROM books WHERE description LIKE "El%"; -- % cualquier cantidad de caracteres
## Libros que Contengan "DR_CULA" con o sin tilde
SELECT * FROM books WHERE description LIKE "%Dr_cula%"; -- _ un caracter cualquiera
## Libros con un caracter intermedio cualquiera
SELECT * FROM books WHERE description LIKE "%\%%"; -- \ escape de caracter (permite utilizar caracteres reservados)

## Libros cuyo precio se encuentre entre 1000 y 5000
SELECT * FROM books WHERE price BETWEEN 1000 AND 5000;

# Tabla Comprobantes de Alquiler
## Carga de Comprobantes de Alquiler
INSERT INTO books_rent(user, return_date)
VALUES 	(4,""), -- alejandra
		(1,"0"), -- c215714n
        (6,"hoy"); -- carlos
       
# Tabla Detalle de Alquiler
INSERT INTO books_rent_detail(ticket, book)
VALUES  -- Libros de Alejandra
        (1,4), -- El principito
        (1,2), -- 100 Años de Soledad
        (1,8), -- El 10% de la felicidad
        (1,5), -- Dracula
        -- Libros de C215714n
        (2, 4), -- El principito
        (2, 10), -- El 1% de la solucion
		(2, 1); -- El fantasma de Canterville
	
## Actualizacion de precios General
UPDATE books_rent_detail -- accedo a todos los campos
SET price = (SELECT price FROM books WHERE books.id = books_rent_detail.book) -- busco el libro por id
WHERE price IS NULL OR price = 0; -- siempre que no haya precio cargado
    
/* Actualizacion Stock y Precio*/
UPDATE books
SET stock = ROUND(RAND() * 1000) -- un numero entero entre 0 y 1000 (asignacion)
WHERE stock = 0; -- condicion que el stock sea 0 (comparacion)

UPDATE books
SET price = RAND() * 4000 + 2000 -- un numero entre 2000 y 6000
WHERE price = 0; -- codicion donde el precio sea 0 (comparacion)

## calcular el precio de alquiler por dia
SELECT 
	ticket,
    COUNT(book) AS libros_alquilados,
    ROUND(SUM(price) * 0.05, 2) AS total
FROM books_rent_detail
GROUP BY ticket;

## Actualizacion fecha de retorno
UPDATE books_rent
SET return_date = "2023-04-28 15:30"
WHERE id = 1;

UPDATE books_rent
SET total = ROUND(
	DATEDIFF(return_date, rent_date) * (
		SELECT SUM(price) * 0.05 
		FROM books_rent_detail 
		WHERE books_rent_detail.ticket = books_rent.id 
	), 2)
WHERE total IS NULL OR total = 0;

UPDATE books_rent_detail
SET returned = 1
WHERE ticket IN(1,2);

SELECT * FROM books_rent_detail;
