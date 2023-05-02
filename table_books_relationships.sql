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
    FOREIGN KEY(genre) REFERENCES genre(id)
);

CREATE TABLE books_by_publishers(
	id INT AUTO_INCREMENT,
    book INT,
    publisher INT,
    stock INT,
    PRIMARY KEY(id),
    UNIQUE KEY(book, publisher),
    FOREIGN KEY(book) REFERENCES books(id),
    FOREIGN KEY(publisher) REFERENCES publisher(id)
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

