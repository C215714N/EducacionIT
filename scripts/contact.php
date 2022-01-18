<?php
/* Captura de datos */
    $contract = $_POST['contract'];
    $name = $_POST['name'];
    $age = $_POST['age'];
    $email = $_POST['email'];
    $consult = $_POST['consult'];
/* Generacion del Mensaje */
    $message = "
        <strong>Nombre: </strong> $name <br>
        <strong>Edad: </strong> $age <br>
        <strong>Bases y Condiciones: </strong> $contract <br>
        <strong>Consulta: </strong> $consult
    ";
    mail(
        # destinatario
        "info@fundamentos.net",
        # asunto
        "Consulta Web",
        # mensaje
        $message,
        # remitente
        "From: $name<$email>"
    );
/* Redireccionamiento */
    header("location: https://localhost/fundamentos.net")
?>