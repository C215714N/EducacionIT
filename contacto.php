<?php  
	/*Captura de Datos*/
		$nombre 	= $_POST['nombre'];	 //Cristian 
		$email 		= $_POST['email'];	 //cristiandracedo@hotmail.cm
		$consulta 	= $_POST['consulta'];//Buenas Tardes
		$contrato 	= $_POST['contrato'];//true
	/*Preparacion del Mensaje*/
		$mensaje = "
			<strong>Nombre: </strong> $nombre <br/>
			<strong>Correo: </strong> $email <br/>
			<strong>Acepto las Bases y condiciones: </strong> $contrato <br/>
			<strong>Consulta: </strong> $consulta
		";
		mail(
			//destinatario
			"info@misitio.com",
			//asunto
			"Consulta Web",
			//cuerpo
			$mensaje,
			//remitente
			"From: $nombre <$email>"
		);
	/*Redireccionamiento*/
		header("location: https://misitio.com/contacto.html");
?>

