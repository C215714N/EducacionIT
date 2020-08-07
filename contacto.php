<?php
	// VARIABLE: Es un espacio reservado en la memoria (TEMPORALMENTE) para almacenar datos, cuyo valor puede cambiar.
	//	PHP 			HTML
		$nombre 	=	$_POST['nombre']; 	//Cristian
		$email 		=	$_POST['email'];	//cristiandracedo@hotmail.com
		$consulta 	=	$_POST['consulta'];	//¡¡Buenas Noches, America!!

	// cuerpo del mail
		$mensaje	= "
			<strong>Nombre:</strong> $nombre <br/>
			<strong>email:</strong> $email <br/>
			<strong>consulta:</strong> $consulta <br/>
		";

	// envío del mail
		//destinatario		//asunto		//cuerpo  	//remitente
	mail("info@misitio.com", "consulta web", $mensaje, "From: $nombre <$email>\nReply-To:$email\nContent-Type: text/html; charset=utf-8");

	//Redireccionamiento a pagina Web
	header("Location: http://www.misitio.com/contacto.html");
?>