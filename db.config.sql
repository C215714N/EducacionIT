CREATE DATABASE IF NOT EXISTS Delilah;
USE Delilah;

CREATE TABLE IF NOT EXISTS Usuarios (
    id_usuario int auto_increment,
    nombre varchar(50) not null,
    usuario varchar(20) not null,
    correo varchar(100) not null,
    pass varchar(20) not null,
    telefono int(10) not null,
    address varchar(200) not null,
    fecha datetime default current_timestamp,
    administrator boolean default false,
    primary key(id_usuario),
    unique key(usuario),
    unique key(correo)
);

CREATE TABLE IF NOT EXISTS Productos (
	id_producto int auto_increment,
    nombre varchar(50) not null,
    descripcion varchar(200),
    precio decimal(8,2) not null,
    stock int,
    imagen varchar(200),
    fecha datetime default current_timestamp,
    primary key(id_producto),
    unique key(nombre)
);

CREATE TABLE IF NOT EXISTS Estados (
	id_estado int auto_increment,
    detalle varchar(50),
    primary key(id_estado),
    unique key(detalle)
);

CREATE TABLE IF NOT EXISTS Tipos_pago (
	id_tipo int auto_increment,
    detalle varchar(50),
    primary key(id_tipo),
    unique key(detalle)
);

CREATE TABLE IF NOT EXISTS Pedidos (
	id_pedido int auto_increment,
    id_usuario int not null,
    id_estado int not null, 
    id_tipo int,
    fecha datetime default current_timestamp,
    precio decimal(8,2) not null,
    pago boolean default false,
    primary key(id_pedido),
    foreign key(id_usuario) references Usuarios(id_usuario),
    foreign key(id_estado) references Estados(id_estado),
    foreign key(id_tipo) references Tipos_pago(id_tipo)
);
CREATE TABLE IF NOT EXISTS Pedidos_detalle (
	id_detalle int auto_increment,
    id_pedido int,
    id_producto int,
    cantidad int,
    precio decimal(8,2) not null,
    primary key(id_detalle),
    unique key(id_pedido, id_producto),
    foreign key(id_pedido) references Pedidos(id_pedido),
    foreign key(id_producto) references Productos(id_producto)
);

/*
DDL (definición de datos: columnas): create, drop y alter (table) [add, drop y modify].
DML (manipulación de datos: filas): insert (into), delete, update [set] y select.
DCL (control de datos: usuarios de la base de datos): grant, revoke, flush privileges.
TCL (transacción de datos): describe, show, use, entre otros...
*/

DESCRIBE Usuarios;
INSERT INTO Usuarios(usuario, correo, pass, administrator)
VALUES
	("freddi_mercury", "freddimercury@gmail.com", "queen", false),
	("jonathan_kim", "jonathankim@gmail.com", "jonathan", true);

SELECT * FROM Usuarios;
UPDATE Usuarios SET nombre = "Farrokh Bulsara" WHERE id_usuario = 1;
UPDATE Usuarios SET nombre = "Jonathan Kim" WHERE correo = "jonathankim@gmail.com";
DELETE FROM Usuarios WHERE id_usuario = 2;
INSERT INTO Usuarios(usuario, correo, pass, administrator)
VALUES
	("cristian_racedo2", "cristianracedo2@gmail.com", "vtodyosm", false),
    ("jonathan_kim2", "jonathankim2@gmail.com", "jonathan2", false);
    
TRUNCATE Usuarios;

DESCRIBE Productos;
INSERT INTO Productos(nombre, precio, stock)
VALUES
	("Hamburguesa clásica","350","563"),
    ("Sandwich veggie","310","321");

SELECT * FROM Productos;

ALTER TABLE Pedidos_detalle
MODIFY precio DECIMAL (8,2);

/* CASE siempre termina con END */
UPDATE Productos
	SET precio =
    CASE
		WHEN nombre LIKE "Hamb%" THEN 350
        WHEN nombre LIKE "Sand%" THEN 310
	END
