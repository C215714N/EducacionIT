<?php  
	// Captura de datos
	/*php*/		/*html*/
	$nombre   = $_POST['nombre']; //cristian
	$email 	  = $_POST['email']; //cristiandracedo@hotmail.com
	$tipo 	  = $_POST['tipo']; // frontend
	$consulta = $_POST['consulta']; // Buenos dias
	// Envio del mensaje
	$mensaje = "
		<strong> Nombre: </strong> $nombre <br/>
		<strong> Correo: </strong> $email <br/>
		<strong> Consulta: </strong> $consulta
	";
	mail(
		//destinatario 
		"info@misitio.com",
		//asunto
		$tipo,
		//cuerpo
		$mensaje,
		//remitente
		"From: $nombre <$email>"
	);
	// Redireccionamiento
	header("redirect: http://misitio.com");
?>