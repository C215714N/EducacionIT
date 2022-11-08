<?php
    // Recoleccion de Datos
    $name = $_POST['name'];
    $email = $_POST['email'];
    $subject = $_POST['subject'];
    $consult = $_POST['consult'];
    $contract = $_POST['contract'];
    // Envio del Correo
    mail(
        'info@misitio.com',// destinatario
        $subject, // asunto
        $consult, // cuerpo
        "From: $name<$email>"// remitente
    );
    // Redireccionamiento
    header("location: ../about.html");
?>
<p>
    Gracias por realizar su consulta, puedes volver a la pagina principal haciendo clik en el siguiente <a href="../about.html">Link</a>
</p>