<?php  
	/*Obtener la informacion del formulario*/
		//php 			html
		$nombre 	= 	$_POST['nombre']; 	//Cristian
		$email 		= 	$_POST['email']; 	//cristiandracedo@hotmail.com
		$consulta 	= 	$_POST['consulta']; //Buenas tardes
	/* Organizacion del mensaje*/
		$mensaje = "
			<strong>Nombre: </strong> $nombre <br />
			<strong>Correo: </strong> $email <br />
			<strong>Consulta: </strong> $consulta <br />
		";
	/*Envio del mensaje*/
		mail(
			//Destinatario
			"info@educacionit.com",
			//Asunto
			"Consulta Web",
			//Mensaje
			$mensaje,
			//Remitente
			"From: $nombre<$email>
			\n Reply-To: $email
			\n Content-Type: text/html ; charset=utf-8" //codificacion
		);
	/*Redireccionamiento*/
		header("location: https://educacionit.com");
?>