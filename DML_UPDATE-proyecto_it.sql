/*	DML(Data Manipulation Language)
    Agregar/Modificar/Eliminar/Consultar registros
    DELETE: eliminar filas de las tablas
*/
	DELETE FROM users; -- no posible (FOREIGN KEY de users_data y posts)
	DELETE FROM posts; -- eliminacion completa
    DELETE FROM sales WHERE sale_id = 14; -- eliminacion de registro especifico
    TRUNCATE posts; -- reinicio de tabla (contador)
    TRUNCATE sales; -- eliminacion de datos
    
/*	DML(Data Manipulation Language)
    Agregar/Modificar/Eliminar/Consultar registros
    UPDATE: actualizar las filas de tablas
*/
/* Tabla Datos de Usuario */
	UPDATE users_data
    SET profession = "instructor"
    WHERE user = 1;
    
/* Tabla Categorias */
    UPDATE categories SET description = "belleza"
    WHERE description = "maquillaje";
    
/* Tabla Publicaciones */
	## generamos el titulo utilizando los valores de los campos
	UPDATE posts
    SET post_title = CONCAT(
		(SELECT product FROM products WHERE product_id = posts.product), -- obtengo el producto
        " vendido por ", -- uno el texto escrito con espacios
        (SELECT user_name FROM users WHERE user_id = posts.user) -- obtengo el usuario
    ) WHERE post_title IS NULL; -- condicion: no deben poseer titulo

    ## actualizacion masiva del stock (suma de las cantidades vendidas)
    UPDATE posts
    SET stock = CASE
		WHEN (SELECT SUM(quantity) FROM sales WHERE post = post_id) IS NULL THEN stock -- mantener precio si no existen ventas
        ELSE stock - (SELECT SUM(quantity) FROM sales WHERE post = post_id) -- restar la cantidad al stock
    END;

	## actualizacion individual stock para venta 13
    UPDATE posts
    SET stock = stock - (SELECT quantity FROM sales WHERE sale_id = 13)
    WHERE post_id = 16;
    
    ## actualizacion de precios
    SELECT * FROM posts;
	UPDATE posts
    SET price = CASE
		WHEN product BETWEEN 7 AND 10 THEN  price * 1.8 -- aumento 80%
        WHEN product BETWEEN 4 AND 6 THEN price * 1.4
        WHEN product BETWEEN 1 AND 3 THEN price * 1.2
        ELSE price * 1.65
    END;
    
    ## actualizacion de stock (reponer)
    UPDATE posts
	SET stock = stock + ROUND(rand() * 80 + 20) -- aumentamos el stock entre 20 y 100
	WHERE stock <= 50; -- solamente si el valor actual es menor a 50 unidades
    SELECT * FROM posts;
    
/* Tabla Ventas */
	## actualizacion de precios por subconsulta
	UPDATE sales
    SET price = (SELECT price FROM posts WHERE post_id = post) -- verificamos el precio de la publicacion
    WHERE price = 0.00; -- condicion: no debe tener precio definido
    
    ## actualizacion de precio para la venta 13
	UPDATE sales
    SET price = (SELECT price FROM posts WHERE post_id = post)
    WHERE sale_id = 13;
    
    ## asignacion aleatoria de usuarios
    UPDATE sales
	SET user = CEIL(RAND() * 4 + 2 ) -- numero aleatorio entre 3 y 6
    WHERE user IS NULL; -- condicion: no debe existir el usuario
	
    ## reasignacion por valores incorrectos (mismo usuario POSTS y SALES)
    UPDATE sales
    SET user = CASE
		WHEN post IN(2,3,4,11,12) AND user = 4 THEN ROUND(RAND() + 5) -- si a > 1
        WHEN post BETWEEN 7 AND 10 AND user = 5 THEN CEIL(RAND() * 4) -- si !a & b > 2
        WHEN post BETWEEN 5 AND 15 AND user = 6 THEN FLOOR(RAND() * 4 + 1) -- si !ab & c > 3
        ELSE user -- si !abc > 4
    END;
    
    ## agrega un producto a la venta
    UPDATE sales
	SET quantity = quantity + 1
	WHERE sale_id = 15;
    
    ## Billeteras segun el monto a abonar
    UPDATE sales AS s
    SET wallet = (
		SELECT MIN(wallet_id) FROM wallets AS w
        WHERE w.user = s.user AND 
        CASE
				WHEN price < 2000 THEN method = 1 -- pago con credito
                WHEN price < 100000 THEN method = 4 -- pago con cvu
                ELSE method = 3 -- pago con cbu
        END
    )	
    WHERE wallet IS NULL;
	
    ## Primer billetera disponible por usuario
    UPDATE sales AS s
    SET wallet = (SELECT MIN(wallet_id) FROM wallets AS w WHERE w.user = s.user)
    WHERE wallet IS NULL;