<?php 
// captura de datos (variables)
    $name = $_POST['name'];
    $age = $_POST['age'];
    $email = $_POST['email'];
    $consult = $_POST['consult'];
    $contract = $_POST['contract'];
// generacion de mensaje (correo)
    $message = "
        <strong>Nombre: </strong> $name <br>
        <strong>Edad: </strong> $age <br>
        <strong> Terminos: </strong> $contract <br>
        <strong>Consulta: </strong> $consult";
    mail(
        "info@localhost", # destinatario
        "Consulta Web", # asunto
        $message, # cuerpo
        "From: $name<$email>" # remitente
    );
// rediccionamiento (contacto)
    header("location: ../about.html");
?>