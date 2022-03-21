<?php
  // Captura de datos
    $nombre = $_POST['nombre'];
    $correo = $_POST['correo'];
    $consulta = $_POST['consulta'];
    $terminos = $_POST['terminos'];
  // Estructura del Mensaje
    mail(
        "info@misitio.com", // destinatario
        "Consulta Web", // asunto
        $consulta, // Cuerpo
        "From: $nombre<$correo>"// Remitente
    );
  // Redireccionamiento
    header( "location: https://github.com");
?>
