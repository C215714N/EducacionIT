CREATE DATABASE IF NOT EXISTS Delilah;
USE Delilah;

/* DDL */
    CREATE TABLE IF NOT EXISTS Users (
        id_user int auto_increment,
        name varchar(50) not null,
        user varchar(20) not null,
        email varchar(100) not null,
        pass varchar(20) not null,
        phone int(10) not null,
        address varchar(200) not null,
        date datetime default current_timestamp,
        admin boolean default false,
        primary key(id_user),
        unique key(user),
        unique key(email)
    );
    CREATE TABLE IF NOT EXISTS products (
        id_product int auto_increment,
        name varchar(50) not null,
        detail varchar(200),
        price decimal(8,2) not null,
        stock int,
        img varchar(200),
        date datetime default current_timestamp,
        primary key(id_product),
        unique key(name)
    );
    CREATE TABLE IF NOT EXISTS states (
        id_state int auto_increment,
        detail varchar(50),
        primary key(id_state),
        unique key(detail)
    );
    CREATE TABLE IF NOT EXISTS pay_method (
        id_method int auto_increment,
        detail varchar(50),
        primary key(id_method),
        unique key(detail)
    );
    CREATE TABLE IF NOT EXISTS cart (
        id_cart int auto_increment,
        id_user int not null,
        id_product int not null,
        quantity int,
        primary key(id_cart),
        unique key(id_user, id_product),
        foreign key(id_user) references Users(id_user),
        foreign key(id_product) references products(id_product)
    );
    CREATE TABLE IF NOT EXISTS orders (
        id_order int auto_increment,
        id_user int not null,
        id_state int not null, 
        id_method int,
        date datetime default current_timestamp,
        price decimal(8,2) not null,
        pago boolean default false,
        primary key(id_order),
        foreign key(id_user) references Users(id_user),
        foreign key(id_state) references states(id_state),
        foreign key(id_method) references pay_method(id_method)
    );
    CREATE TABLE IF NOT EXISTS orders_detail (
        id_detail int auto_increment,
        id_order int,
        id_product int,
        cantidad int,
        price decimal(8,2) not null,
        primary key(id_detail),
        unique key(id_order, id_product),
        foreign key(id_order) references orders(id_order),
        foreign key(id_product) references products(id_product)
    );

/*
DML (manipulación de datos: filas): insert (into), delete, update [set] y select.
DCL (control de datos: users de la base de datos): grant, revoke, flush privileges.
TCL (transacción de datos): describe, show, use, entre otros...
*/
INSERT INTO states (detail)
    VALUES
      ('NUEVO'),
      ('CONFIRMADO'),
      ('PREPARANDO'),
      ('ENVIADO'),
      ('CANCELADO'),
      ('ENTREGADO');
  -- metodos de pago
  INSERT INTO pay_method(detail)
    VALUES 
      ('EFECTIVO'),
      ('CREDITO'),
      ('DEBITO'),
      ('TRANSF.B'),
      ('VIRTUAL');
INSERT INTO Users(user, email, pass, admin)
VALUES
	("freddi_mercury", "freddimercury@gmail.com", "queen", false),
	("jonathan_kim", "jonathankim@gmail.com", "jonathan", true);

UPDATE Users SET name = "Farrokh Bulsara" WHERE id_user = 1;
UPDATE Users SET name = "Jonathan Kim" WHERE email = "jonathankim@gmail.com";
DELETE FROM Users WHERE id_user = 2;
INSERT INTO Users(user, email, pass, admin)
VALUES
	("cristian_racedo2", "cristianracedo2@gmail.com", "vtodyosm", false),
    ("jonathan_kim2", "jonathankim2@gmail.com", "jonathan2", true);

DESCRIBE products;
INSERT INTO products(name, price, stock)
VALUES
	("Hamburguesa clásica","350","563"),
    ("Sandwich veggie","310","321");