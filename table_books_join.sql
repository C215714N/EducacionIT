## INNER JOIN (Muestra los elementos en comun)
## eliminacion Columna ediction
ALTER TABLE books
DROP column edition;
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
INSERT INTO users(username, userpass)
VALUES ('p3p3','jañsdlk'),('ju4n','2134c'),('l4ur4','dsfa2'),('c4m1l4','asld');

### Usuarios que no hayan cargado sus datos
SELECT username, u.id FROM users AS u -- todos los registros de usuarios
LEFT JOIN users_data AS ud ON ud.userId = u.id -- datos que coincidan solamente
WHERE ud.id IS NULL; -- muestra los registros que no existan en datos de usuarios

SELECT  
	-- tabla usuarios
	u.id, username,
    -- tabla datos de usuario
    uid, -- cuil / documento / ruc / cedula 
	CONCAT(last_name, " ", first_name) AS fullname,
    CONCAT("tel: ", phone, " - correo: ", email) AS user_data
FROM users AS u
RIGHT JOIN users_data AS ud ON ud.userId = u.id;

## CROSS JOIN (Muestra la combinacion de registros)
SELECT 
	u.username,
    b.description
FROM users AS u
JOIN books AS b
WHERE description LIKE "%\%%" 
AND username LIKE "%c%"
ORDER BY username;
