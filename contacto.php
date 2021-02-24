<?php  
	/* CAPTURA DE DATOS */
	//php 		  html
	$nombre 	= $_POST['nombre']; // cristian
	$email 		= $_POST['email']; // cristiandracedo@hotmail.com
	$consulta 	= $_POST['consulta']; // Buenos dias
	
	/* ELABORACION DEL CORREO */
	$mensaje = "
		<strong>Nombre: </strong> $nombre <br/>
		<strong>Correo: </strong> $email <br/>
		<strong>Consulta: </strong> $consulta <br/>
	";
	mail(
		//Destinatario
		"info@misitio.com",
		//Asunto
		"Consulta Web",
		//Cuerpo del Mensaje
		$mensaje,
		// Remitente y codificacion
		"From: $nombre <$email> 
		\n Reply-To: $email
		\n Content-Type: text/html;
		\n charset=utf-8"
	);

	/* REDIRECCIONAMIENTO */
	header( "location: https://misitio.com/contacto.html" );
?>
