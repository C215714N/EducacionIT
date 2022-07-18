<?php   
//  Captura de Datos
    $name = $_POST['name'];
    $email = $_POST['email'];
    $subject = $_POST['subject'];
    $consult = $_POST['consult'];

// Generacion de un correo
    mail(
        'usuario@servidor.com', // Destinatario (servidor)
        $subject, // Asunto
        $consult,// Cuerpo
        'Reply-To: $name<$email>'// Remitente
    );

// Redireccionamiento
    header('location: https://github.com');
?>