<?php  
	/* VARIABLE: Un espacio reservado en la memoria (temporalmente) cuyo valor puede cambiar*/
	//php 		//html
	$nombre	= 	$_POST['nombre']; 	//Cristian
	$email	=	$_POST['email']; 	//CristianDracedo@hotmail.com
	$consulta = $_POST['consulta'] 	//Buenas tardes!!

	//Cuerpo del Mensaje
	$mensaje = "
		<strong>Nombre: </strong> $nombre <br/>
		<strong>Correo: </strong> $email <br/>
		<strong>Consulta: </strong> $consulta
	";	

	//Envio de Correo
	mail(
		//Destinatario
		"info@misitio.com",
		//Asunto
		"Consulta Web",
		//Mensaje
		$mensaje,
		//Remitente
		"From:$nombre<$email>
		\n Reply-To: $email
		\n Content-Type: text/html; charset=utf-8" //codificacion
	);

	//Redireccionamiento
	header("location: https://misitio.com");
?>