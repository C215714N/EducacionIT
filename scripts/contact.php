<?php 
// Captura de Datos (Variables)
$name  = $_POST['name']; // Cristian
$email = $_POST['email']; // cristiandracedo@hotmail.com
$subject = $_POST['subject']; //html
$consult = $_POST['consult']; // Texto escrito en la consulta

// Generacion del Mensaje (Metodo)
mail(
    'info@misitio.com',   # Destinatario
    $subject,             # Asunto
    $consult,             # Cuerpo
    "From: $name<$email>" # Remitente
);
/* 
    // Redireccionamiento
    header("location: ../support.html"); 
*/
?>
<p>
    Gracias por realizar tu consulta, podes volver a la pagina anterior haciendo click en el siguiente <a href="../support.html">link</a>
</p>