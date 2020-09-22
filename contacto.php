<?php  
	/* VARIABLE: Espacio reservado en la memoria (Temporal) cuyo valor puede cambiar*/
	//Capturar Variables
	//php 		//html
	$nombre 	= $_POST['nombre']; //Cristian
	$correo 	= $_POST['email']; //cristiandracedo@hotmail.com
	$consulta 	= $_POST['consulta']; //Buenos dias!!

	//Estructura del Mensaje
	$mensaje ="
		<strong>Nombre: </strong> $nombre <br/>
		<strong>Correo: </strong> $email <br />
		<strong>Consulta: </strong> $consulta
	"
	//Envio del Mail
	mail(
		"info@misitio.com", 	//destinatario
		"Consulta Web", 		//asunto
		$mensaje,				//Cuerpo del Mail
		"From: $nombre<$email>
		\n Reply-To:$email
		\n Content-Type:text/html;
		charset=utf-8"			//Remitente y tipo de Mensaje
	)
	//Redireccionamento
	header("location: https://misitio.com/contacto.html")
?>