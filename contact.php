<?php  
	// Captura de datos
		$nombre = $_POST['nombre']; // "cristian racedo";
		$correo = $_POST['correo']; // "cristiandracedo@hotmail.com";
		$consulta = $_POST['consulta']; // "Buenos tardes a todos";

	// Envio del mensaje
		$mensaje = "
			<strong>Nombre: </strong> $nombre <br>
			<strong>Consulta: </strong> $consulta
		";
		mail(
			//destinatario
			"info@misitio.com",
			//asunto
			"Consulta Web",
			//cuerpo
			$mensaje,
			//remitente
			"From: $nombre<$correo>"
		);
	// Redireccionamiento
		header("location: https://misitio.com/contact.html");
?>
