<?php 
// Captura de Datos
$name = $_POST['name'];
$email = $_POST['email'];
$subject = $_POST['subject'];
$consult = $_POST['consult'];

// Preparacion del Mensaje
mail(
    'info@misitio.com', # Destinatario
    $subject, # Asunto
    $consult, # Cuerpo
    "From:$name<$email>" # Remitente
);

// Redireccionamiento
header('location: ../about.html');
?>
<p>
    Muchas gracias por enviar su consulta. Podes volver a la pagina anterior desde el siguiente <a href="../about.html">Link</a>
</p>

