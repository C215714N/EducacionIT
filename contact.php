<?php  
	$nombre 	= $_POST['nombre'];
	$email 		= $_POST['email'];
	$tipo 		= $_POST['tipo'];	
	$consulta	= $_POST['consulta'];
	$mensaje	= "
		<strong> Nombre: </strong> $nombre <br/>
		<strong> Correo: </strong> $email <br/>
		<strong> Consulta: </strong> $consulta
	";	
	
	email(
		"CristianDRacedo@hotmail.com",
		$tipo,	
		$mensaje,
		"From: $nombre <$email>
		\n Reply-To: $email
		\n Content-Type: text/html;
		\n charset=utf-8"
	);
	
	header(
		"location: https://hotmail.com"
	);
?>