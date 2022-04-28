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
    <head>
        <title>Fundamentos Web</title>
        <meta charset=UTF-8>
        <meta http-equiv=X-UA-Compatible content=IE=edge>
        <meta name=viewport content=width=device-width, initial-scale=1.0>
        <title>Fundamentos Web</title>
        <!-- Icono de la Pagina -->
        <link rel=icon href=assets/icon/f_pescar.svg>
        <!-- Styles CSS -->
        <link rel=stylesheet href=../styles/main.css>
    </head>
    <body>
    <header>
        <h1>Fundamentos Web</h1>
        <p>html | css | js</p>
    </header>
    <main>
        muchas gracias $name por enviar tu consulta,
        estaremos contactandonos con vos a la brevedad
        al correo $email .
    </main>
    </body>
    ")
//  Redireccionamiento
?>
