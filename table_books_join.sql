/* DDL - Data Definition Language */
## eliminacion Columna ediction
ALTER TABLE books -- tabla a modificar
DROP column edition; -- columna a eliminar

/* DML - Data Manipulation Language */
## Insercion de nuevos usuarios
INSERT INTO users(username, userpass)
VALUES ('p3p3','jañsdlk'),('ju4n','2134c'),('l4ur4','dsfa2'),('c4m1l4','asld');

## Actualizacion de telefonos
UPDATE users_data
SET phone = CONCAT(11, ROUND(RAND() * 89999999 + 10000000)); -- numeros aleatorios entre 1100000000 1199999999


## CROSS JOIN (Muestra la combinacion de registros)
SELECT u.username, b.description -- campos de ambas tablas
FROM users AS u -- todos los registros de usuarios
JOIN books AS b -- todos los registros de libros
WHERE description LIKE "%\%%" AND username LIKE "%c%"
ORDER BY username;

## INNER JOIN (Muestra los elementos en comun)
#### Todos los libros que posean año de publicacion
SELECT 
	b.id, description, stock, price, -- campos de tabla libros
	year -- campos de tabla libros por año
FROM books AS b
JOIN books_by_years AS bby ON b.id = bby.book -- relacion entre tablas
ORDER BY b.id;

## facturacion
SELECT
-- Datos de usuario
	CONCAT(ud.last_name, ", ", ud.first_name) AS cliente,
    ud.uid AS identificacion,
-- Alquiler General (Total)
    br.rent_date AS retiro, br.return_date AS devuelto,
    DATEDIFF(br.return_date, br.rent_date) AS dias,
-- Libros
    b.description AS libro,
-- Detalle de Alquiler
    bd.price * 0.05 AS valor_alquiler,
    DATEDIFF(br.return_date, br.rent_date) * bd.price * 0.05 AS total_libro
FROM users_data AS ud
JOIN books_rent AS br ON br.user = ud.userId
JOIN books_rent_detail AS bd ON bd.ticket = br.id
JOIN books AS b ON bd.book = b.id;

## OUTTER JOIN (Muestra todos los elementos de una tabla y solamente los que se relacionan de la otra)
### Usuarios que no hayan cargado sus datos
SELECT username, u.id FROM users AS u -- todos los registros de usuarios
LEFT JOIN users_data AS ud ON ud.userId = u.id -- datos que coincidan solamente
WHERE ud.id IS NULL; -- muestra los registros que no existan en datos de usuarios

SELECT  
	-- tabla usuarios
	u.id, username,
    -- tabla datos de usuario
    uid, -- cuil / documento / ruc / cedula 
	CONCAT(last_name, " ", first_name) AS fullname, -- apellido y nombre
    CONCAT("tel: ", phone, " - correo: ", email) AS user_data -- datos de contacto (si existen)
FROM users AS u
RIGHT JOIN users_data AS ud ON ud.userId = u.id;

SELECT 
	b.id,
	b.description AS libro,
    a.description AS autor
FROM books AS b
LEFT JOIN books_by_authors AS bba ON bba.book = b.id
LEFT JOIN authors AS a ON a.id = bba.author
HAVING autor IS NULL;

SELECT 
	ticket,
    price * 0.05,
    rent_date,
    total AS valor_general,
    a.description
FROM books_rent_detail AS brd
LEFT JOIN books_rent AS br ON br.id = brd.ticket
LEFT JOIN books_by_authors AS bba ON bba.book = brd.book
LEFT JOIN authors AS a ON a.id = bba.author;

