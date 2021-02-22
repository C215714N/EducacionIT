/*Creacion del esquema*/
	DROP DATABASE IF EXISTS comercio_lj_11; -- elimina si existe
	CREATE DATABASE IF NOT EXISTS comercio_lj_11; -- crea si no existe
    USE comercio_lj_11; -- selecciona base datos
    
/* Definicion de tablas
	proveedores (id, nombre, cuil, direccion, datos)
    productos(id, nombre, codigo, precio, stock)
	clientes()
    ingreso (proveedor => productos)
    ventas (productos => clientes)
*/

CREATE TABLE proveedores (
	id_proveedor INT AUTO_INCREMENT, -- campo numerico
    proveedor VARCHAR(50) -- campo de texto
);
	