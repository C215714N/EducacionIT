/* DDL - Data Definition Language */ 

/*
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