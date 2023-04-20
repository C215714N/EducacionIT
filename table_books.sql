CREATE TABLE publishers(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);

CREATE TABLE authors(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);

CREATE TABLE literary_genres(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);

CREATE TABLE books(
	id INT AUTO_INCREMENT,
    description VARCHAR(50),
    stock INT UNSIGNED NOT NULL, -- solamente valores positivos
    price DECIMAL(11,2) UNSIGNED NOT NULL, -- almacena un valor
    edition INT(4) DEFAULT 1,
    PRIMARY KEY(id),
    UNIQUE KEY(description)
);

CREATE TABLE books_rent(
	id INT AUTO_INCREMENT,
    user INT,
    rent_date DATETIME DEFAULT CURRENT_TIMESTAMP, -- fecha y hora
    return_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(11,2),
    PRIMARY KEY(id),
    FOREIGN KEY(user) REFERENCES users(id)
);

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