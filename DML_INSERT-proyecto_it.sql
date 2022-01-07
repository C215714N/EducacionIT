/*	DML(Data Manipulation Language)
    Agregar/Modificar/Eliminar/Consultar registros
    Filas de tablas
*/

/* Tabla usuarios */
	# carga completa (ordinal)
	INSERT INTO users 
    VALUES(
		0, -- user_id
        "c215714n", -- user_name
        "cristiandracedo@hotmail.com", -- user_email
        "root" -- user_pass
    );
    # carga selectiva 
    INSERT INTO users(user_email, user_name) -- indico los campos
    VALUES("cristiandracedo@gmail.com","racedo_cristian"); -- completo en el orden indicado
    # carga multiple (registros)
    INSERT INTO users(user_name, user_email, user_pass)
    VALUES
		("Tux","l.torvalds@linux.com","gnu_kernel"),
        ("Windows","b.gates@microsoft.com","system_32"),
        ("macOS","s.jobs@apple.com","macinstosh");