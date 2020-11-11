<?php  
	//Obtencion de datos
		//php			html
		$nombre 	= 	$_POST['nombre']; //Cristian
		$correo 	= 	$_POST['correo']; //Cristian@racedo
		$consulta 	= 	$_POST['consulta']; //Texto de prueba
		$asunto		=	$_POST['asunto'];
	//Organizacion de datos
		$mensaje = "
			<strong>NOMBRE: </strong> $nombre <br />
			<strong>CORREO: </strong> $correo <br />
			<strong>CONSULTA: </strong> $consulta
		";
	//Realizacion del envio
		mail(
			//destinatario
				"info@educacionit.com",
			//asunto
				$asunto,
			//cuerpo
				$mensaje,
			//remitente
				"From:$nombre<$correo>
				\n Reply-To: $correo
				\n Content-Type:text/html; charset=utf-8"
		);
	//Redireccionamiento
		header( "location: https://educacionit.com/contacto.html");
?>