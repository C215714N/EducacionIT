/* DDL - Data Definition Language */ 
/*	Mapa de Relaciones 
	usuarios -> datos
    usuarios -> carritos (favoritos)
    usuarios -> publicaciones
    usuarios -> ventas (transaccion)
    productos -> categorias
    productos -> ventas (transaccions)
    ventas -> detalles_ventas
*/
CREATE TABLE users_data(
	id INT AUTO_INCREMENT,
    user INT, -- vinculado al id de usuario
    lastname VARCHAR(50),
    firstname VARCHAR(50),
    birthdate DATE,
    gender ENUM('M','F','X','PND'), -- opciones unica
    nationality VARCHAR(50),
    id_type ENUM('DNI','DNIE','CUIL','PA','CI','LC','LE','RUC','ROOT'), -- lista de valores
    id_number VARCHAR(25),
    address VARCHAR(100),
    phone VARCHAR(20),
    ## restricciones
    PRIMARY KEY(id),
    UNIQUE KEY(user), -- 1 dato le corresponde a 1 usuario
    UNIQUE KEY(gender, id_type, id_number), -- datos de identificacion (unicos)
    FOREIGN KEY(user) REFERENCES users(id) -- Clave Foranea campo(local) => tabla_relacional(key)
);

/* DML - Data Manipulation Language */
# Carga de Datos
INSERT INTO users_data(user, lastname, firstname, id_type, id_number, gender, birthdate)
VALUES 
	(1,'Racedo', 'Cristian', 1, '35336446', 1, '1991-04-18'), -- C215714n
	(6,'Fernandez','Leandro','CUIL','20-12983294-2', 1, '2008-10-05'), -- Leandro
    (4,'Galan','Lucia',3,'27-08369065-3',2,'1961-05-23'), -- Lucia
    (5,'Galan','Joaquin','CUIL','20-10809452-5',1,'1953-07-21'); -- Joaquin
    
# Consulta condicional
SELECT * FROM users_data;
## Consulta por numero de documentacion
SELECT * FROM users_data
WHERE id_number = '35336446';

## Subconsulta de Numero de Usuario
SELECT * FROM users_data
WHERE user = (SELECT id FROM users WHERE username = 'c215714n');

# consulta por casos y funciones de calculo
SELECT 
	user,
    lastname,
    firstname,
    ROUND(DATEDIFF(CURRENT_DATE(), birthdate) / 365) AS age, -- diferencia entre fechas expresada en dias
    CASE
		WHEN birthdate >= "2005-01-01" THEN 'joven' -- si A
        WHEN birthdate >= "1963-01-01" THEN 'adulto' -- si !A & B
        ELSE 'adulto mayor' -- si !A & !B
    END AS rango_etario
 FROM users_data;

# Actualizacion de usuarios importados
UPDATE users_data -- tabla afectada
SET user = ( SELECT id FROM users WHERE username = firstname) -- id que coincide con el nombre
WHERE user IS NULL; -- si el usuario no esta definido