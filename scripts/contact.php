<?php 
// Captura de Datos
$name = $_POST['name'];
$email = $_POST['email'];
$subject = $_POST['subject'];
$consult = $_POST['consult'];
// Generacion del Mensaje
mail(
    "micuenta@midominio", # destinatario
    $subject, # asunto
    $consult, # cuerpo
    "From: $name<$email>"# remitente
);
// Redireccionamiento
header("location: ../about.html");
?>
<p>
    Gracias por realizar tu consulta, podes volver a la pagina anterior desde el siguiente <a href="../about.html">link</a>
</p>