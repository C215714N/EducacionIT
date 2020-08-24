<?php
	// VARIABLE: Es un espacio reservado en la memoria (TEMPORALMENTE) para almacenar datos, cuyo valor puede cambiar.
	//	PHP 			HTML
		$nombre 	=	$_POST['nombre']; 	//Cristian
		$email 		=	$_POST['email'];	//cristiandracedo@hotmail.com
		$consulta 	=	$_POST['consulta'];	//¡¡Buenos Dias, America!!
		$telefono	=	$_POST['telefono']; //0303-456
	// cuerpo del mail
		$mensaje	= "
			<strong>Nombre:</strong> $nombre <br/>
			<strong>Telefono: </strong> $telefono </br>
			<strong>email:</strong> $email <br/>
			<strong>consulta:</strong> $consulta <br/>
		";
	// envío del mail
			//destinatario		//asunto		//cuerpo  	//remitente
		mail("info@misitio.com", "consulta web", $mensaje, "From: $nombre <$email> \n Reply-To:$email \n Content-Type: text/html; charset=utf-8");
	//Redireccionamiento a pagina Web
		header("Location: http://www.misitio.com/contacto.html");
?>