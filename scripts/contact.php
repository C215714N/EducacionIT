<?php
// Captura de datos
    $name = $_POST['name'];
    $email = $_POST['email'];
    $consult = $_POST['consult'];

//  Creacion del mensaje    
    $message = "
        <strong>Nombre: </strong> $name <br>
        <strong>Correo: </strong> $email <br>
        <strong>Consulta: </strong> $consult
    ";
    echo("
        <link rel=stylesheet href=../styles/main.css>
        <header id=header>
            <h1>Fundamentos Web</h1>
            <p>html | css | js</p>
        </header>
        <p>
            muchas gracias $name por enviar tu consulta,
            estaremos contactandonos con vos a la brevedad
            al correo $email. Podes seguir visitando nuestra pagina desde el siguiente <a href=../forum.html>link</a>
        </p>
    ")
//  Redireccionamiento
?>
