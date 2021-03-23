<?php  
	// Recoleccion de datos
	/*	php 	  	html 	name 	*/
		$nombre   = $_POST['nombre'];
		$email 	  = $_POST['email'];
		$consulta = $_POST['consulta'];
	// Generacion del mensaje
		$mensaje = "
			<strong>Nombre: </strong> $nombre <br/>
			<strong>Correo: </strong> $email <br/>
			<strong>Consulta: </strong> $consulta <br/>
		";
		mail(
			//destinatario
			"info@dominio.com",
			//asunto
			"consulta web",
			//cuerpo
			$mensaje,
			//remitente y formato
			"From: $nombre <$email>
			\n Content-Type: text/html
			\n charset=utf-8"
		);
	// Redireccionamiento
		header( "location: https://dominio.com/contacto.html" );
?>