/* 	DDL Data Manipulation Languages
	Tablas Relacionales
*/

## Libros por autores
CREATE TABLE books_by_authors(
	id INT AUTO_INCREMENT,
    book INT,
    author INT,
    PRIMARY KEY(id),
    UNIQUE KEY(book, author),
    FOREIGN KEY(book) REFERENCES books(id),
    FOREIGN KEY(author) REFERENCES authors(id)
);

## Libros por genero literario
CREATE TABLE books_by_genres(
	id INT AUTO_INCREMENT,
    book INT,
    genre INT,
    PRIMARY KEY(id),
    UNIQUE KEY(book, genre),
    FOREIGN KEY(book) REFERENCES books(id),
    FOREIGN KEY(genre) REFERENCES literary_genres(id)
);

## libros por editoriales
CREATE TABLE books_by_publishers(
	id INT AUTO_INCREMENT,
    book INT,
    publisher INT,
    stock INT,
    PRIMARY KEY(id),
    UNIQUE KEY(book, publisher),
    FOREIGN KEY(book) REFERENCES books(id),
    FOREIGN KEY(publisher) REFERENCES publishers(id)
);

## libros por año de lanzamiento
CREATE TABLE books_by_years(
	id INT AUTO_INCREMENT,
    book INT,
    year INT,
    PRIMARY KEY(id),
    UNIQUE KEY(book, year),
    FOREIGN KEY(book) REFERENCES books(id)
);

## libros por numero de edicion
CREATE TABLE books_by_editions(
	id INT AUTO_INCREMENT,
    book INT,
    edition DECIMAL(6,2),
    stock INT,
    PRIMARY KEY(id),
    UNIQUE KEY(book, edition),
    FOREIGN KEY(book) REFERENCES books(id)
);

# Migracion de datos a tabla AÑOS (insert => select)
INSERT INTO books_by_years(book, year) -- carga de datos
## Consulta de obtencion de datos
SELECT id, edition FROM books -- carga todos los datos consultados
WHERE length(edition) = 4; -- cantidad de digitos/caracteres

# Insercion de datos con subconsulta
INSERT INTO books_by_years(book,year)
VALUES ((SELECT id FROM books WHERE description = "el fantasma de canterville"), 1887);

# Funciones de seleccion por grupos
SELECT edition, count(*), group_concat(description) FROM books
GROUP BY edition;

# campos calculados y condicion sobre los mismos
SELECT 
	ticket, 
    Count(*) AS cantidad, 
	group_concat(book) AS libros_alquilados,
    SUM(price) AS total
FROM books_rent_detail
GROUP BY ticket
HAVING total >= 12000;

/* 
	CONSULTAS
*/

INSERT INTO authors(description)
VALUES  ('Pedro Sifontes'), ('Carlos Sabino'), ('Thomas L. Friedman'),
        ('Robert Lawrence Stine'), ('Mary Shelley'), ('Oscar Wilde'),
        ('Karl Marx'), ('Bram Stoker'), ('Friedrich Engels'),
        ('Jose Hernandez'), ('Gabriel Garcia Marquez'), ('Miguel de Cervantes'),
        ('Joanne K. Rowling​'), ('Julio Cortazar'), ('John Ronald Reuel Tolkien');

### Insercion de datos con consulta y subconsulta
INSERT INTO books_by_authors(book, author) -- agregamos a la tabla
SELECT id, ( -- lista de resultados
	SELECT id FROM authors -- busco el la tabla autores
    WHERE description LIKE "%Sifontes%" -- id del autor cuyo apellido sea Sifontes
) FROM books WHERE description LIKE "%la felicidad"; -- todos libros del autor

## Carga simple por asignacion (asociacion)
INSERT INTO books_by_authors
SET book = (SELECT id FROM books WHERE description LIKE "DR_CULA"),
	author = (SELECT id FROM authors WHERE description LIKE "%Bram%" AND description LIKE "%Stoker%");

