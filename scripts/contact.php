<?php
// Captura de Datos
    $name = $_POST['name'];
    $email = $_POST['email'];
    $consult = $_POST['consult'];

// Creacion del Mensaje
    mail(
        "info@misitio.com", // Destinatario
        "consulta web", // Asunto
        $consult, // Mensaje
        "From: $name<$email>"  // Remitente  
    );
// Redireccionamiento
    header("Location: ../about.html");
?>