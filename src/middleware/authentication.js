const jwt = require('jsonwebtoken');
const secret = 'hola123';
let session  = require('../../index.js')
const User = require('../model/user')

/*  JWT User SignUp Creation  */
    exports.signup = function(req, res) {
        const userToken = new User(req.body)
        User.create( userToken, (err, user) => { 
            ( err ) ? res.send(err) : jwt.sign( {userToken}, secret,{expiresIn: '1h'}, 
                (err, token) => { res.json( token ) 
            }   )   
    }   )   }
/*  JWT Token LogIn Generate  */
    exports.login = function(req, res){
        User.login( req.body.user, req.body.pass,(err, userToken) => {
            ( userToken[0] ) ? 
                jwt.sign( { userToken }, secret, {expiresIn: '1h'}, 
                    (err, token) =>  { res.json( token ); console.log(userToken)
            }   ) : res.status(404).send({
                error: 404,
                message: "Usuario y/o contraseña incorrectos"
            }   )
    }   )   }  
/*  JWT Validation Access */
    exports.authToken = (req, res, next) => {
        const bearer = req.headers['authorization'] // Bearer Token. La cabecera de la solicitud.
        if(typeof bearer !== 'undefined') { // Verifica si existe el token.
            const token   = bearer.split(' ')[1] // Extrae sólo el token de la const bearer.
            const decoded = jwt.verify(token, secret);
            req.token     = token;
            req.decoded   = decoded;
                session.admin = decoded.userToken[0].admin;
                session.id    = decoded.userToken[0].id_user;
                session.name  = decoded.userToken[0].user;
            (   session.admin == true || session.id == req.params.id || session.name == req.params.id   )   ? 
                next() : res.json(   {
                    error:403,
                    message: "Acceso Restringido, administradores y dueños solamente"
                }   )
        } else {
            res.json(   {
                error: 403, 
                message: "Acceso No autorizado, debes iniciar sesion"
            }   ) 
        }   
    console.log(session.admin, session.id, session.name)
    }
// Verify Permissions
    exports.adminAuth = (req, res, next) => {
        const bearer = req.headers['authorization']
        if(typeof bearer !== 'undefined') { 
            const token = bearer.split(' ')[1];
            const decoded = jwt.verify(token, secret);
            req.token = token;
            req.decoded = decoded;
                session.admin = decoded.userToken[0].admin;
                session.id    = decoded.userToken[0].id_user;
                session.name  = decoded.userToken[0].user;
            ( decoded.userToken[0].admin == true ) ?
                next() : res.json(   {
                    error:403,
                    message: "Acceso Restringido, administradores solamente"
                }   )
        } else {
            res.json(   {
                error: 403, 
                message: "Acceso No autorizado, debes iniciar sesion"
            }   ) 
    }   }