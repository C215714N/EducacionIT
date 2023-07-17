<?php
    // Captura de Datos
    $name = $_POST['name'];
    $email = $_POST['email'];
    $subject = $_POST['subject'];
    $consult = $_POST['consult'];
    // Generar el Mensaje
    mail(
        'info@misitio.com', # destinatario
        $subject, # asunto
        $consult, # cuerpo
        "From: $name<$email>" # remitente
    );
    // Redireccionamiento
    header("location: ../blog.html");
?>
<p>
    Muchas gracias por enviar tu Consulta, podes volver a la pagina anterior haciendo click en el siguiente <a href="../blog.html">link</a>
</p>