<?php
	/* VARIABLE: Valor reservado en la memoria (TEMPORAL) que puede contener cualquier tipo de dato. */
	//php 			//html
	$nombre 	=	$_POST['nombre']; //Cristian
	$email 		=	$_POST['email'];	//cristiandracedo@hotmail.com
	$consulta 	=	$_POST['consulta']; //Buenas Noches America
	// Cuerpo del mail
	$mensaje	= "
		<strong> Nombre: </strong> $nombre <br/>
		<strong> Correo: </strong> $email <br/>
		<strong> Consulta: </strong> $consulta <br/>
	";
	//Generacion del Correo
		mail(
		//destinatario
			'info@misitio.com',
		//asunto
			'Consulta Web', 
		//cuerpo
			$mensaje, 
		//remitente
			"From: $nombre <$email> 
			\n Reply-To:$email 
			\n Content-Type:text/html; 
			charset: utf-8" 
		);
	//Redireccionamiento
		header("location: https://misitio.com/contacto.html");
?>