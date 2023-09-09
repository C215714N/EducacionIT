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
    
