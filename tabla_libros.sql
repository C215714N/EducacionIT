/* DDL - DATA DEFINITION LANGUAGE */
CREATE TABLE authors(
	id INT AUTO_INCREMENT,
    name VARCHAR(50),
    birthdate DATE,
    PRIMARY KEY(id),
    UNIQUE KEY (name)
);
CREATE TABLE literary_genres(
	id INT AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY (id),
    UNIQUE KEY(name)
);
CREATE TABLE books(
	id INT AUTO_INCREMENT,
    name VARCHAR(50),
    description LONGTEXT,
    author INT,
    stock INT,
    price FLOAT(11,2),
	PRIMARY KEY(id),
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

/* DML - DATA MANIPULATION LANGUAGE */
## Carga multiple de autores de Libros
INSERT INTO authors(name, birthdate)
VALUES 	("MIGUEL DE CERVANTES", "1547-01-01"),
		("MARQUÉS DE SADE", "1740-01-01"),
		("GOETHE", "1749-01-01"),
		("JANE AUSTEN", "1775-01-01"),
		("MARY SHELLEY", "1797-01-01"),
		("VICTOR HUGO", "1802-01-01"),
		("CHARLES DICKENS", "1812-01-01"),
		("HERMAN MELVILLE", "1819-01-01");
        
## Carga de Libro por asignacion de valores
INSERT INTO books
SET name = "Frankenstein",
	description = "La novela narra la historia de Víctor Frankenstein, un joven suizo, estudiante de medicina en Ingolstadt, obsesionado por conocer \"los secretos del cielo y la tierra\". En su afán por desentrañar \"la misteriosa alma del hombre\", Víctor crea un cuerpo a partir de la unión de distintas partes de cadáveres diseccionados.",
    author = (SELECT id FROM authors WHERE name = "MARY SHELLEY"),
    stock = 275,
    price = 3500.00;
    
INSERT INTO books
SET name = "Moby Dick",
	description = "La historia de la obsesiva persecución de una ballena por el Capitán Ahab se ha convertido en ítem imprescindible de la cultura universal. El lector no encontrará obra más filosófica, tratado sobre el mar más erudito y, algo no menos importante, novela de aventuras más épica que la presente.",
    author = (SELECT id FROM authors WHERE name = "HERMAN MELVILLE"),
    stock = 428,
    price = 2999.99;
    
INSERT INTO literary_genres(name)
VALUES 
	("Accion"),
	("Aventura"),
	("Biografico"),
	("Catastrofe"),
	("Ciencia Ficcion"),
	("Cosmos"),
	("Comedia"),
	("Documental"),
	("Drama"),
	("Fantasia"),
	("Suspenso"),
	("Psicologia"),
	("Terror");
    
## Insercion dinamica de datos
INSERT INTO books_by_genres(book,genre)
VALUES	( (SELECT id FROM books WHERE name = "Frankenstein"),
          (SELECT id FROM literary_genres WHERE name = "Terror") ),
		( (SELECT id FROM books WHERE name = "Frankenstein"),
            (SELECT id FROM literary_genres WHERE name = "Ciencia Ficcion")	);
## Insercion parcialmente dinamica
INSERT INTO books_by_genres(book, genre)
VALUES 	( 2, (SELECT id FROM literary_genres WHERE name = "drama") ),
		( 2, (SELECT id FROM literary_genres WHERE name = "fantasia") );
        
## Libros y generos asociados
SELECT * FROM books_by_genres;        
## Libros con todos sus generos literarios
SELECT  
	b.name AS book, -- nombre del libro
    stock, -- cantidad total de libros
    price, -- precio unitario
    GROUP_CONCAT(lg.name) AS genres -- agrupacion de generos del libro
FROM books_by_genres AS bg -- tabla base
JOIN books AS b ON b.id = bg.book -- tabla de union
JOIN literary_genres AS lg ON lg.id = bg.genre -- tabla de union
GROUP BY book; -- agrupado por nombre de libro

