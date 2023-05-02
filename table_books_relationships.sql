/* 	DDL Data Manipulation Languages
	Tablas Relacionales
*/
CREATE TABLE books_by_authors(
	id INT AUTO_INCREMENT,
    book INT,
    author INT,
    PRIMARY KEY(id),
    UNIQUE KEY(book, author),
    FOREIGN KEY(book) REFERENCES books(id),
    FOREIGN KEY(author) REFERENCES authors(id)
);

CREATE TABLE books_by_genres(
	id INT AUTO_INCREMENT,
    book INT,
    genre INT,
    PRIMARY KEY(id),
    UNIQUE KEY(book, genre),
    FOREIGN KEY(book) REFERENCES books(id),
    FOREIGN KEY(genre) REFERENCES literary_genres(id)
);

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

CREATE TABLE books_by_years(
	id INT AUTO_INCREMENT,
    book INT,
    year INT,
    PRIMARY KEY(id),
    UNIQUE KEY(book, year),
    FOREIGN KEY(book) REFERENCES books(id)
);

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

INSERT INTO books_by_years(book,year)
VALUES ((SELECT id FROM books WHERE description = "el fantasma de canterville"), 1887);

SELECT edition, count(*), group_concat(description) FROM books
GROUP BY edition;

SELECT 
	ticket, 
    Count(*) AS cantidad, 
	group_concat(book) AS libros_alquilados,
    SUM(price) AS total
FROM books_rent_detail
GROUP BY ticket
HAVING total >= 12000;