<?php  
	// Captura de datos
		$nombre = $_POST['nombre']; //"cristian racedo";
		$correo = $_POST['correo']; //"cristiandracedo@hotmail.com";
		$consulta = $_POST['consulta']; //"Buenas tardes a todos";

	// Envio del Mensaje
		mail(
			//destinatario
			"info@misitio.com",
			//asunto
			"Consulta Web",
			//cuerpo
			$consulta,
			//remitente
			"From: $nombre <$correo>"
		);
	// Redireccionamiento
		header("location: https://misitio.com/contact.html");
	// Resultado
		echo($mensaje);
?>