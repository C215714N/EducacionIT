	USE pepe_y_los_globos_store;
/*DELETE*/
	DELETE FROM sales_detail; -- eliminacion completa
	TRUNCATE sales_detail; -- reinicia la tabla
    DELETE FROM sales;
    TRUNCATE sales;
/*UPDATE*/