<?php
// captura de variables
//valor que se almacena en la memoria y que puede cambiar

//PHP 			//HTML
$nombre 	= 	$_POST['nombre']; 	//Cristian
$email 		= 	$_POST['email']; 	//CristianDracedo@hotmail.com
$consulta 	= 	$_POST['consulta']; //Buenas Noches, America!!

// cuerpo del mail
//Estructura del mensaje que se enviara
$mensaje="
<strong>Nombre:</strong> $nombre<br/>		
<strong>email:</strong> $email<br/> 
<strong>consulta:</strong> $consulta<br/>
";

// envío del mail
//Informacion utilizada por el servidor para generar el mensaje
	//destinatario			//asunto		//cuerpo	//remitente
mail("micorreo@midominio.com","Consulta Web",$mensaje, "From: $nombre <$email>\nReply-To:$email\nContent-Type: text/html; charset=utf-8");

//Redireccionamiento a pagina Web
//Actualiza la pagina a la URL especificada
header ("Location: http://www.misitio.com/mipagina.html");
?>