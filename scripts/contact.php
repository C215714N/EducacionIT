<?php 
/*captura de datos*/
	$nombre = $_POST['nombre'];
	$edad = $_POST['edad'];
	$correo = $_POST['correo'];
	$consulta = $_POST['consulta'];
	$terminos = $_POST['terminos'];
/*redaccion de un mensaje*/
	$mensaje = "
		<strong>Nombre:</strong> $nombre <br>
		<strong>Edad: </strong> $edad <br>
		<strong>Acepto:</strong> $terminos <br>
		<strong>Consulta: </strong> $consulta
	";
	mail(
	//destinatario
		"info@localhost",
	//asunto
		"Consulta Web",
	//mensaje
		$mensaje,
	//remitente
		"From: $nombre <$correo>"
	);
/*redireccionamiento*/
	header("location: https://github.com/c215714n/EducacionIT/tree/html-lx09");
?>