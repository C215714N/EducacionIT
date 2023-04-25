<?php
// Recoleccion de datos
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $subject = $_POST['subject'];
    $consult = $_POST['consult'];

// Preparacion del Mensaje
    mail(
        "info@servidor",     // Destinatario
        $subject,            // Asunto
        $consult,            // Cuerpo
        "From:$name<$email>" // Remitente
    );

// Redireccionamiento
    header("location: ../group.html")
?>