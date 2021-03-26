<?php  
	// Captura de datos
		$nombre   =	$_POST['nombre'];	//cristian
		$email 	  =	$_POST['email'];	//cristiandracedo@hotmail.com
		$consulta =	$_POST['consulta']; //consulta web
	// Generacion del Mensaje
		$mensaje = "
			<strong> Nombre: </strong> $nombre <br/>
			<strong> Correo: </strong> $email <br/>
			<strong> Consulta: </strong> $consulta			
		";
		mail(
			//destinatario
			"info@misitio.com",
			//asunto
			"consulta web",
			//cuerpo
			$mensaje,
			//remitente y configuracion
			"From: $nombre <$email>
			\n Content-Type: text/html
			\n charset=utf-8"
		);

	// Redireccionamiento
		header("location: https://misitio.com/contacto.html");
?>