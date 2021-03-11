DROP DATABASE delilah;
CREATE DATABASE IF NOT EXISTS Delilah;
USE Delilah;
/* Data Definition Language */
    CREATE TABLE IF NOT EXISTS Users (
        id_user INT AUTO_INCREMENT,
        name VARCHAR(50) NOT NULL,
        user VARCHAR(20) NOT NULL,
        email VARCHAR(100) NOT NULL,
        pass VARCHAR(20) NOT NULL,
        phone int(10) NOT NULL,
        address VARCHAR(200) NOT NULL,
        date DATETIME DEFAULT CURRENT_TIMESTAMP,
        admin BOOLEAN DEFAULT FALSE,
        PRIMARY KEY(id_user),
        UNIQUE KEY(user),
        UNIQUE KEY(email)
    );
    CREATE TABLE IF NOT EXISTS products (
        id_product INT AUTO_INCREMENT,
        name VARCHAR(50) NOT NULL,
        detail VARCHAR(200),
        price decimal(8,2) NOT NULL,
        stock INT,
        img VARCHAR(200),
        date DATETIME DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY(id_product),
        UNIQUE KEY(name)
    );
    CREATE TABLE IF NOT EXISTS states (
        id_state INT AUTO_INCREMENT,
        detail VARCHAR(50),
        PRIMARY KEY(id_state),
        UNIQUE KEY(detail)
    );
    CREATE TABLE IF NOT EXISTS pay_method (
        id_method INT AUTO_INCREMENT,
        detail VARCHAR(50),
        PRIMARY KEY(id_method),
        UNIQUE KEY(detail)
    );
    CREATE TABLE IF NOT EXISTS cart (
        id_cart INT AUTO_INCREMENT,
        id_user INT NOT NULL,
        id_product INT NOT NULL,
        quantity INT,
        price DECIMAL(10,2),
        PRIMARY KEY(id_cart),
        UNIQUE KEY(id_user, id_product),
        FOREIGN KEY(id_user) REFERENCES Users(id_user),
        FOREIGN KEY(id_product) REFERENCES products(id_product)
    );
    CREATE TABLE IF NOT EXISTS orders (
        id_order INT AUTO_INCREMENT,
        id_user INT NOT NULL,
        id_state INT NOT NULL DEFAULT 1, 
        id_method INT NOT NULL DEFAULT 1,
        date DATETIME DEFAULT CURRENT_TIMESTAMP,
        price decimal(8,2) NOT NULL,
        pago BOOLEAN DEFAULT FALSE,
        PRIMARY KEY(id_order),
        FOREIGN KEY(id_user) REFERENCES Users(id_user),
        FOREIGN KEY(id_state) REFERENCES states(id_state),
        FOREIGN KEY(id_method) REFERENCES pay_method(id_method)
    );
    CREATE TABLE IF NOT EXISTS orders_detail (
        id_detail INT AUTO_INCREMENT,
        id_order INT,
        id_product INT,
        quantity INT,
        price decimal(8,2) NOT NULL,
        PRIMARY KEY(id_detail),
        UNIQUE KEY(id_order, id_product),
        FOREIGN KEY(id_order) REFERENCES orders(id_order),
        FOREIGN KEY(id_product) REFERENCES products(id_product)
    );
/* Data Manipulation Language */
	-- Estados de Orden
    INSERT INTO states (detail)
	VALUES ('NUEVO'), ('CONFIRMADO'), ('PREPARANDO'), ('ENVIADO'), ('CANCELADO'), ('ENTREGADO');
	-- Metodos de Pago
	INSERT INTO pay_method(detail)
	VALUES ('EFECTIVO'), ('CREDITO'), ('DEBITO'), ('TRANSF.B'), ('VIRTUAL');
	-- Registro Usuarios
    INSERT INTO Users(user, name, email, pass, admin)
	VALUES
		("c215714n", "Cristian Racedo", "cristiandracedo@gmail.com", "vtodyosm", true),
		("freddi_mercury", "Farrokh Bulsara", "freddimercury@gmail.com", "queen", false),
		("jonathan_kim", "Jonathan Kim", "jonathankim@gmail.com", "jonathan", false),
		("anthony", "Anthony Kiedis", "ak@rhcp.com", "cantstop", true),
		("nirvana", "Kurt Cobain", "c_kobain@nirvana", "comeasyouare", false),
		("drummer", "dave grohl", "dave@nirvana.com", "bestofyou", true);
	-- Registro de Productos
    INSERT INTO products(detail, name, stock, price, img) 
	VALUES
		('HamClas', 'Hamburgesa clasica', 1, 250, 'https://i.imgur.com/1cnJL1v.jpg'),
		('BglSalmon', 'Bagel de salmon', 1, 420, 'https://i.imgur.com/yrHKMiK.jpg'),
		('EnsVegg', 'Ensalada veggie', 0, 340, 'https://i.imgur.com/2pmnLhG.jpg'),
		('Foca', 'Focaccia', 1, 300, 'https://i.imgur.com/eQ8563H.jpg'),
		('SandFoca', 'Sandwich focaccia', 0, 440, 'https://i.imgur.com/RgVYbEX.jpg'),
		('EnsCaes', 'Ensalada Caesar', 0, 320, 'https://i.imgur.com/OUwLnpw.jpg'),
		('HambLent', 'Hamburguesa de lentejas', 1, 380, 'https://i.imgur.com/1cnJL1v.jpg'),
		('EnsAtun', 'Ensalada de atún', 0, 305, 'https://i.imgur.com/I2lLT2J.jpg'),
		('TarJyQ', 'Tarta de jamon y queso', 1, 380, 'https://i.imgur.com/hKrt49L.jpg'),
		('TarVerd', 'Tarta integral de verdura', 0, 380, 'https://i.imgur.com/fcTZtic.jpg'),
		('EmpJyQ', 'Empanada de jamon y queso', 1, 100, 'https://i.imgur.com/FcnX7F1.jpg'),
		('EmpCar', 'Empanada de carne', 1, 100, 'https://i.imgur.com/Mxq4vTT.jpg'),
		('EmpVer', 'Empanada de verdura', 1, 100, 'https://i.imgur.com/FhDkhmj.jpg'),
		('WrVer', 'Wrap de verdura', 0, 210, 'https://i.imgur.com/3OlClju.jpg'),
		('WrPollyV', 'Wrap de pollo y verdura', 0, 270, 'https://i.imgur.com/kKExXq7.jpg'),
		('WrAtun', 'Wrap integral de atún', 0, 330, 'https://i.imgur.com/RyF2d3T.jpg'),
		('NoqGel', 'Ñoquis de alcohol en gel', 0, 450, 'https://i.imgur.com/tPbRwcF.jpg');
	-- Carritos de Compras
    INSERT INTO cart(id_user, id_product, quantity, price)
	VALUES
		(1,2,9,310), (1,4,5,340), (1,3,5,420), (1,5,0,300),
		(2,2,6,310), (2,4,7,340), (2,9,4,305),
		(3,7,3,320), (3,15,2,210),
		(4,3,1,420), (4,6,6,440), (4,5,2,300),
		(5,5,10,300),(5,6,7,440), (5,7,3,320), (5,9,5,305);
    -- Actualizacion de Precios
		UPDATE cart AS c 
		SET price = ( SELECT price FROM products AS p WHERE p.id_product = c.id_product ) 
        WHERE price IS NULL;
	-- Actualizacion de Detalles
	INSERT INTO orders_detail(id_product, quantity, price) 
    SELECT id_product, quantity, price FROM cart;
    -- Creacion de Ordenes de Compra
    INSERT INTO orders(id_user,id_state, id_method, price)
    SELECT id_user, 1, 1, SUM(quantity * price) FROM cart
    WHERE cart.id_user = 5;
    SELECT * FROM orders;
/*DML - Consulta de Datos Ingresados */		
	SELECT * FROM users;
	SELECT * FROM products;
	SELECT * FROM cart;
	SELECT * FROM orders;
	SELECT * FROM orders_detail;
    
    INSERT INTO orders_detail(id_product, quantity, price) 
    SELECT id_product, quantity, price 
    FROM cart where id_user = @i;
    INSERT INTO orders(id_user, price) 
    VALUES (1, (SELECT SUM(quantity * price) 
    FROM cart WHERE id_user = 1));
    
SELECT * FROM orders, cart, orders_detail WHERE orders.id_user = cart.id_user;    