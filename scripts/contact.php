<?php
// Captura de Datos
    $name = $_POST['name'];
    $email = $_POST['email'];
    $subject = $_POST['subject'];
    $consult = $_POST['consult'];
// Envio del correo
    mail(
        "info@servidor", # Destinatario
        $subject, # Asunto
        $consult, # Cuerpo
        "From:$name<$email>" # Remitente
    );
// Redireccionamiento
    header("location: ../detail.html");
?>