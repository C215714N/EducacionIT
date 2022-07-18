<?php 
// Captura de Datos
    $name = $_POST['name'];
    $email = $_POST['email'];
    $subject = $_POST['subject'];
    $consult = $_POST['consult'];

// Generacion del Correo
    mail(
        'usuario@servidor', # destinatario
        $subject, # asunto
        $consult, # cuerpo
        "From: $name<$email>"# remitente
    );

// Redireccionamiento
    header('location: ../forum.html');
?>