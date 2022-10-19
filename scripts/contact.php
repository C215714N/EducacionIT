<?php
// Captura de Datos
    $name = $_POST['name'];
    $email = $_POST['email'];
    $subject = $_POST['subject'];
    $consult = $_POST['consult'];

// Creacion del Mensaje
    mail(
        "info@misitio.com", // Destinatario
        $subject, // Asunto
        $consult, // Mensaje
        "From: $name<$email>"  // Remitente  
    );
// Redireccionamiento
    // header("Location: ../about.html");
?>
<h1>Fundamentos web</h1>
<p>
    Muchas gracias por realizar su consulta, nos pondremos en contacto a la brevedad. Puede volver a la pagina principal haciendo click en el siguiente <a href="../about.html">link</a>
</p>