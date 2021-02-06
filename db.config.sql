CREATE DATABASE IF NOT EXISTS Delilah;
USE Delilah;

CREATE TABLE Usuarios (
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
CREATE TABLE Productos (
	id_producto int auto_increment,
    nombre varchar(50) not null,
    descripcion varchar(200),
    precio decimal(4,2) not null,
    stock int,
    imagen varchar(200),
    fecha datetime default current_timestamp,
    primary key(id_producto),
    unique key(nombre)
);

CREATE TABLE Estados (
	id_estado int auto_increment,
    detalle varchar(50),
    primary key(id_estado),
    unique key(detalle)
);

CREATE TABLE Tipos_pago (
	id_tipo int auto_increment,
    detalle varchar(50),
    primary key(id_tipo),
    unique key(detalle)
);

CREATE TABLE Pedidos (
	id_pedido int auto_increment,
    id_usuario int not null,
    id_estado int not null, 
    id_tipo int,
    fecha datetime default current_timestamp,
    precio decimal(4,2) not null,
    pago boolean default false,
    primary key(id_pedido),
    foreign key(id_usuario) references Usuarios(id_usuarios),
    foreign key(id_estado) references Estados(id_estado),
    foreign key(id_tipo) references Tipos_pago(id_tipo)
);
CREATE TABLE Pedidos_detalle (
	id_detalle int auto_increment,
    id_pedido int,
    id_producto int,
    cantidad int,
    precio decimal(4,2) not null,
    primary key(id_detalle),
    unique key(id_pedido, id_producto),
    foreign key(id_pedido) references Pedidos(id_pedido),
    foreign key(id_producto) references Productos(id_producto)
);