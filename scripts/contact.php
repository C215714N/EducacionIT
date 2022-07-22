<?php 
// Captura de datos
    $name = $_POST['name'];
    $email = $_POST['email'];
    $subject = $_POST['subject'];
    $consult = $_POST['consult'];
// Generacion del Mensaje
    mail(
        'usuario@servidor', # destinatario
        $subject, # asunto
        $consult, # cuerpo
        "From:$name<$email>"# remitente
    );
// Redireccionamiento
    header("location: ../about.html");
?>