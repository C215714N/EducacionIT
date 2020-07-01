<?php
	// VARIABLE: Espacio reservado en la memoria cuyo valor puede cambiar
	// captura de variables.
	//	PHP 			HTML
		$nombre 	=	$_POST['nombre']; 	//Cristian
		$email 		=	$_POST['email'];	//cristiandracedo@hotmail.com
		$tel 		=	$_POST['tel'];		//
		$nac 		= 	$_POST['nac'];
		$consulta 	=	$_POST['consulta'];	//¡¡Buenas noches, America!!

	// cuerpo del mail
	$mensaje="
	<strong>Nombre:</strong> $nombre<br/>
	<strong>email:</strong> $email<br/>
	<strong>tel:</strong> $tel <br/> 
	<strong>consulta:</strong> $consulta<br/>
	";

	// envío del mail
		//destinatario		//asunto		//cuerpo  //remitente
	mail("info@misitio.com", "presupuesto", $mensaje, "From: $nombre <$email>\nReply-To:$email\nContent-Type: text/html; charset=utf-8");

	//Redireccionamiento a pagina Web
	header("Location: http://www.misitio.com/contacto.html");
?>