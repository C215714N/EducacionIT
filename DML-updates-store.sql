USE store;
## eliminacion de registros
	-- proveedor cuyo id es 8
    DELETE FROM proveedores 
	WHERE id_proveedor = 8 ; -- condicion restrictiva

## actualizacion de registros
	-- actualizacion sin restriccion
		UPDATE productos -- tabla a modificar
		SET stock = 2000; -- valor de actualizacion
        
    -- registros especificos
		UPDATE productos -- tabla consultada
			SET stock = 5000 -- valor actualizado
			WHERE valoracion >= 4; -- condicion actualizacion
	
    -- actualizaciones multiples campos
		UPDATE productos
			SET stock = 8000,
				precio = 300
			WHERE categoria = "alimentos"
			AND articulo LIKE "%gas%";
	
    -- actualizaciones selectivas
		UPDATE productos
			SET precio =
			CASE
				WHEN articulo LIKE "%colch_n%" THEN 25500
				WHEN articulo LIKE "%micro%" THEN 15900
			END
            WHERE categoria LIKE "%hog%"
            AND articulo NOT LIKE "%aire%" 
            AND articulo NOT LIKE "%hela%";
            
		UPDATE productos
			SET precio = 
				CASE -- valores asignados a precio
					WHEN categoria LIKE "%tec%" THEN 35000 -- c1v1
					WHEN categoria LIKE "%hog%" THEN 65000 -- !c1 => c2v2 
					WHEN categoria LIKE "%al%" THEN 500 -- !c1 && !c2 => c3v3
					ELSE 800 -- !c1 && !c2 && !c3 (default)
				END
			WHERE 
				articulo NOT LIKE "%gas%"
				AND articulo NOT LIKE "%colch_n%"
				AND articulo NOT LIKE "%micro%"; -- restriccion
            
/*
	Tablas de la verdad
	AND	|c1F|c1V|		OR	|c1V|c1F|
	c2F	| F	| F	|		c2V	| V	| V |
	c2V	| F	| V |		c2F	| V	| F |
*/

    -- actualizacion dinamica
		-- correos con nombre y apellido
		UPDATE clientes -- tabla
			SET email = LOWER(CONCAT(nombre, "_", apellido, "@gmail.com")) -- concatenacion de texto
		WHERE email IS NULL; -- debe estar vacio (NULL)
		
        -- correos info @ proveedor
        UPDATE proveedores
			SET email = LOWER(CONCAT("info@",proveedor,".com"))
		WHERE email IS NOT NULL;
		
        UPDATE proveedores
			SET email = "info@coca_cola.com"
		WHERE proveedor LIKE "%COCA%";
        