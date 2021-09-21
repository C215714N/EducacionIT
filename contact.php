<?php  
	// Captura de Datos
	$nombre = $_POST['nombre'];
	$correo = $_POST['correo'];
	$consulta = $_POST['consulta'];

	// Creacion del Mensaje
	mail(
		//destinatario
		"info@misitio.com",
		//asunto
		"Consulta Web",
		//cuerpo
		$consulta ,
		//remitente
		"From: $nombre<$correo>"
	);

	// Redireccionamiento
	header("location: https://misitio.com");
?>