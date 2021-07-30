<?php  
	/* Captura de Variables */
		$contactName 	= $_POST['contactName']; 	// Cristian Racedo
		$contactEmail 	= $_POST['contactEmail']; 	// cdr@hotmail.com
		$contactConsult = $_POST['contactConsult']; // ¡Buenas tardes a todos!
		$contract 		= $_POST['contract']; 		// 1 | 0
	/* Envio del Mensaje */
		$message = "
			<strong>Nombre: </strong> $contactName <br/>
			<strong>Acepto el Contrato: </strong> $contract <br />
			<strong>Consulta: </strong> $contactConsult";
		mail(
			"info@misitio.com", // Destinatario
			"consulta web", 	// Asunto
			$message, 			// Mensaje
			"From: $contactName<$contactEmail>"	// Remitente
		);
	/* Redireccionamiento */
		header( "location: https://misitio.com/contact.html" );
?>
