<?php  
	/* Variable: valor que se almacena en la memoria(temporal) y que puede cambiar.	*/
	//Obtener los datos
		$nombre = $_POST['nombre']; //Cristian
		$correo = $_POST['correo']; //CristianDRacedo@hotmail.com
		$consulta = $_POST['consulta']; // Hola que tal
	//Organizar y Realizar el Envio
		$mensaje = "
			<strong>Nombre:</strong> $nombre <br/>
			<strong>Correo:</strong> $correo <br/>
			<strong>Consulta:</strong> $consulta <br/>
		";
		mail(
			//destinatario
			"CristianDRacedo@hotmail.com",
			//asunto
			"Consulta Web",
			//cuerpo del mensaje
			$mensaje,
			//Detalles de Remitente
			"From: $nombre<$mail>
			\n Reply-To: $email
			\n Content-Type: text/html;
			\n charset=utf-8"
		);
	//Redireccionar a otra Pagina
		header( "location: https://hotmail.com" )
?>