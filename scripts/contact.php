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

    echo($message);
//  Redireccionamiento
?>