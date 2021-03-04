const jwt = require('jsonwebtoken');
const secret = 'hola123';

/* Token creation. */
// Función que genera el token.
exports.logIn = (req, res) => {
    const user = req.body.user;
    const pass = req.body.pass;
    jwt.sign({user, pass}, secret, {expiresIn: '1h'},
    (err, token) => {res.json({token})
    next()
    })
}

// Autenticación del token.
exports.authToken = (req, res, next) => {
    const bearer = req.headers['authorization'] // Bearer Token. La cabecera de la solicitud.
    if(typeof bearer !== 'undefined') { // Verifica si existe el token.
        const bearerToken = bearer.split(' ')[1] // Extrae sólo el token de la const bearer.
        req.token = bearerToken // El req será igual al token obtenido.
        next()
    } else {res.json({Error: 403, Mensaje: "Acceso sólo para administradores."})}  // Si no existe el token, envia el estado de prohibido.
}

//