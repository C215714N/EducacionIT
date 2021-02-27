<?php 
	/* Captura de Datos */
	//php 		html
	$nombre 	= $_POST['nombre']; //Cristian
	$email 		= $_POST['email']; //cdr@hotmail.com
	$consulta 	= $_POST['consulta']; // Buenas noches
	/* Creacion del Mensaje */
	$mensaje = "
		<strong>NOMBRE: </strong> $nombre <br/>
		<strong>CORREO: </strong> $email <br />
		<strong>CONSULTA: </strong> $consulta
	";
	mail(
		//Destinatario
		"info@miweb.com",
		//Asunto
		"Consulta Web",
		//Cuerpo
		$mensaje,
		//Remitente y Codificacion
		"From: $nombre <$email>
		\n Reply-To: $email
		\n Content-Type: text/html
		\n charset=utf-8"
	);
	
	/* Redireccionamiento */
	header( "location: https://miweb.com")
?>