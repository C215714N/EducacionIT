<?php /* HyperText PreProcesor */
	// Recoleccion de datos
	//php 			//html
	$nombre 	=	$_POST['nombre']; // Cristian
	$email		=	$_POST['email']; // Cristiandracedo@hotmail.com
	$consulta 	=	$_POST['consulta']; // Buenas Noches
	// Preparar el Mensaje
	$mensaje = "
		<strong>Nombre: </strong> $nombre <br/>
		<strong>Correo: </strong> $email <br/>
		<strong>Consulta: </strong> $consulta";
	mail(
		//destinatario
		"info@misitio.com" ,
		//asunto
		"Consulta Web" ,
		//cuerpo
		$mensaje ,
		//remitente
		"From: $nombre <$email>
		\n Reply-To: $email"
	);
	// Redireccionamiento
	header( "location: https://misitio.com/contacto.html");
?>
