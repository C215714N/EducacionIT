DESCRIBE books_rent_detail;

ALTER TABLE books_rent_detail
ADD COLUMN quantity INT UNSIGNED DEFAULT 1 AFTER price;
SELECT * FROM books_rent_detail;

DESCRIBE authors;

ALTER TABLE authors
CHANGE description author_name VARCHAR(50),
ADD COLUMN nationality VARCHAR(50),
ADD COLUMN birth_date DATE DEFAULT "01-01-01",
ADD COLUMN description VARCHAR(10000),
ADD COLUMN death_date DATE AFTER birth_date;

ALTER TABLE authors
MODIFY birth_date DATE DEFAULT "0001-01-01";

SELECT * FROM authors;
INSERT INTO authors(author_name)
VALUES 
	("Philip K. Dick"), 
    ("Michael Crichton"), 
	("Ray Bradbury");
    
# Actualizacion del Año
UPDATE authors
SET birth_date = "1942-10-23",
    death_date = "2008-11-04"
WHERE author_name = "Michael Crichton";