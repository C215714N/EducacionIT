const jwt = require('jsonwebtoken');
const secret = 'hola123';

const User = require('../model/user')

/* Token creation. */
    exports.login = async function(req, res){
        User.login( req.body.user, req.body.pass, function (err, userToken) {
            ( userToken[0][0].id_user ) ? 
                jwt.sign( { userToken } , secret, {expiresIn: '1h'}, 
                    (err, token) =>  { res.json( token )
            }   ) : res.status(404).send({
                error: 404,
                message: "Usuario y/o contraseña incorrectos"
            }   )
    }   )   }  

// Autenticación del token.
    exports.authToken = (req, res, next) => {
        const bearer = req.headers['authorization'] // Bearer Token. La cabecera de la solicitud.
        if(typeof bearer !== 'undefined') { // Verifica si existe el token.
            const token = bearer.split(' ')[1] // Extrae sólo el token de la const bearer.
            const decoded = jwt.verify(token, secret)
            req.token = token
            req.decoded = decoded
            next()
        } else {
            res.json(   {
                error: 403, 
                message: "Acceso No autorizado, debes iniciar sesion"
            }   )  // Si no existe el token, envia el estado de prohibido.
    }   }
// Verify Permissions
/* exports.isAdmin = function(req, res, next){
    const decoded = jwt.verify(req.headers['authorization'] , secret)
    const Validate = dbConn.query('SELECT admin FROM users WHERE (user = ? OR email = ?) AND pass = ?',
        [decoded.user, decoded.user, decoded.pass], (err, user) => console.log(user))
        next()
    Validate ? next() : res.json({
        error: true,
        message: 'Acceso restringido, solo personal autorizado'
    }   )
} */