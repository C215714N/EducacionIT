<?php  
	//captura de datos
		$contactName = $_POST['contactName'];
		$contactEmail = $_POST['contactEmail'];
		$contactConsult = $_POST['contactConsult'];
	//organizacion de datos
		$mensaje = "
			<strong>Nombre: </strong> $contactName <br />
			<strong>Correo: </strong> $contactEmail <br />
			<strong>Consulta: </strong> $contactConsult <br />
		"
	//envio del correo
		mail(
			//destinatario
			"info@educacionit.com",
			//asunto
			"Consulta Web",
			//cuerpo
			$mensaje,
			//remitente y formato
			"From:$contactName<$contactEmail>
			\n Reply-To:<$contactEmail>
			\n Content-Type:text/html; charset=utf-8"
		);
	//redireccionamiento
		header("location: https://educacionit.com");
?>