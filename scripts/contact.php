<?php
// Captura de datos
    $name = $_POST['name'];
    $email = $_POST['email'];
    $consult = $_POST['consult'];

//  Creacion del mensaje    
    $message = "
        <strong>Nombre: </strong> $name <br>
        <strong>Consulta: </strong> $consult
    ";
    mail(
        "info@misitio.com", // destinatario
        "Consulta Web",     // asunto
        $message,           // cuerpo
        $email              // remitente
    );

//  Redireccionamiento
    echo("
        <link rel=stylesheet href=../styles/main.css>
        <header id=header>
            <h1>Fundamentos Web</h1>
            <p>html | css | js</p>
        </header>
        <p class=message>
            muchas gracias $name por enviar tu consulta,
            estaremos contactandonos con vos a la brevedad
            al correo $email. Podes seguir visitando nuestra pagina desde el siguiente <a href=../forum.html>link</a>
        </p>
    ");
    header("location: ../forum.html");
?>
