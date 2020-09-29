<?php 
	/* Variable: Espacio reservado en la memoria (temporalmente) cuyo valor puede campo */
	
	//php 		//html
	$nombre 	= $_POST['nombre']; //cristian
	$email 		= $_POST['email']; //cristiandracedo@hotmail.com
	$consulta 	= $_POST['consulta']; //Buenas noches, América!!
	/*Estructura del Mensaje*/
	$mensaje = "
		<strong>Nombre: </strong>$nombre <br />
		<strong>Correo: </strong>$email <br />
		<strong>Consulta: </strong>$consulta
	";
	/*Generacion automatica del Mensaje*/
	mail(
		"info@misitio.com", //Destinatario
		"Consulta Web", //Asunto
		$mensaje, // Cuerpo del Mail
		"From:$nombre<$email>
		\n Reply-To:$email
		\n Content-Type: text/html; charset=utf-8" //Remitente - extras
	);

	header("location: https://misitio.com");
 ?>