<?php  
	//VARIABLE: Espacio reservado en la memoria (dato)	cuyo valor puede cambiar (TEMPORAL)
	//php 		html
	$nombre 	= $_POST['nombre']; //cristian
	$email 		= $_POST['email']; //cristiandracedo@hotmail.com
	$consulta	= $_POST['consulta']; //buenas noches, America!!
	$asunto		= $_POST['asunto'];
	//Acomodamos los datos, para el cuerpo del mail
	$mensaje = "
		<strong>Nombre: </strong> $nombre <br/>
		<strong>Correo: </strong> $email <br/>
		<strong>Consulta: </strong> $consulta
	";

	//Generacion automatica del mensaje
	mail(
		"info@misitio.com", //destinatario
		$asunto, //asunto
		$mensaje,//cuerpo
		"From: $nombre <$email>
		\n Reply-To: $email
		\n Content-Type: text/html; charset=utf-8" //remitente
	);

	//Redireccionamiento
	header("location: https://misitio.com/contacto.html")
?>