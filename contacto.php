<?php  
	// Captura de Datos
	/*php*/		  /*html*/
	$nombre 	= $_POST['nombre']; // Cristian
	$email 		= $_POST['email'];	// Cristiandracedo@hotmail.com 
	$consulta 	= $_POST['consulta']; // Buenas noches
	// Preparacion del Mensaje
	$mensaje = " 
		<strong>Nombre: </strong> $nombre <br/>
		<strong>Correo: </strong> $email <br/>
		<strong>Consulta: </strong> $consulta <br/>
	";
	mail(
		// Destinatario
		"info@misitio.com",
		// Asunto
		"Consulta Web",
		// Cuerpo
		$mensaje,
		// Remitente
		"From: $nombre <$email>"
	);
	// Redireccionamiento	
	header( "location: https://misitio.com/contacto.html");
?>