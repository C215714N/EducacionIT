/* Importaciones */
const userRoutes = require('./src/userRoutes')

/* Consts */
const express = require('express'); // Para poder establecer la comunicación.
const bodyParser = require('body-parser'); // Para la conversión de los datos.
const { application } = require('express');
const delilah = express(); // La aplicación mediante Express.
const port = process.env.PORT || 5000; // Puerto de la aplicación (Postman o 5000).

/* Acceso a la aplicación */
delilah.use(
    bodyParser.urlencoded({extended : true}) // urlencoded: a través de la URL reciba la información solicitada.
);

delilah.use(
    bodyParser.json() // Convierte los datos recibidos en formato .json.
);

delilah.get('/', (req, res) => {
    res.send('La conexión funciona correctamente.') // Mensaje de conexión exitosa.
});

delilah.listen(port, () => {
    console.log(`El puerto utilizado es: ${port}.`); // Notificación del puerto.
});

/* Ejecutar el comando "node server" o "npm start" para ejecutar el servidor local*/

delilah.use('/users', userRoutes)