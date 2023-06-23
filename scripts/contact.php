<?php 
// Recopilacion de Datos
$name   = $_POST['name'];
$email  = $_POST['email'];
$subject = $_POST['subject'];
$consult = $_POST['consult'];

// Preparacion del Mensaje
mail(
    "info@misitio.com",     # destinatario
    $subject,               # asunto
    $consult,               # cuerpo
    "From: $name<$email>"   # remitente
);

// Redireccionamiento
header("location: ../about.html");
?>