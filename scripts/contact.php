<?php 
    // Recopilacion de Datos
    $name = $_POST['name'];
    $email = $_POST['email'];
    $subject = $_POST['subject'];
    $consult = $_POST['consult'];
    // Generacion del Mensaje
    mail(
        "info@misitio.com", // Destinatario
        $subject, // Asunto
        $consult,// Cuerpo
        "From: $name<$email>" // Remitente
    );
    // Redireccionamiento
    header("location: ../others.html");
?>
<p>
    Gracias por realizar tu consulta, podes volver a la pagina principal desde el siguiente <a href="../others.html">link</a>
</p>