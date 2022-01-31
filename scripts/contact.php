<?php
// Captura de Datos (Variables)
    $name = $_POST['name'];
    $email = $_POST['email'];
    $age = $_POST['age'];
    $consult = $_POST['consult'];
    $options = $_POST['options'];

// Generacion del Mensaje (Correo)
    $message = "
        <strong>Nombre: </strong> $name <br>
        <strong>Edad: </strong> $age <br>
        <strong>Acepto: </strong> $options <br>
        <strong>Consulta: </strong> $consult";
    
    mail(
        "usuario@dominio", # destinatario
        "Consulta Web", # asunto
        $message, # cuerpo
        "From: $name<$email>"# remitente
    );
// Redireccionamiento (contacto)
    header("location: ../about.html")
?>