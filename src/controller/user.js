const User = require('../model/user')

exports.create = function(req, res) {
    const newUser = new User(req.body)
    (req.body.constructor == Object && Object.keys(req.body) == 0) ?
        res.status(400).send(   {
            error:true,
            message:'Todos los campos son obligatorios.'
        }   ) : User.create(newUser, (err, user) => err ? res.send(err) : res.json( {
            error:false,
            message:'Usuario agregado con éxito.',
            data: user
        }   )
)   }
exports.list = function(req, res) {
    User.list( (err, user) => (err) ? res.send(err) : res.send(user)
)   }
exports.find = function(req, res) {
    User.find(req.params.id, (err, user) => (err) ? res.send(err) : res.json(user)
)   }
exports.update = function(req, res) {
    (req.body.constructor == Object && Object.keys(req.body).length == 0) ?
        res.status(400).send(   {
            error: true,
            message: 'Debes completar todos los campos.'
        }   ) : User.update(req.params.id, new User(req.body), (err, user) => (err) ? res.sen(err): res.json( {   
            message: "Los datos fueron actualizados.",
            user: user   
        }  )
)   }
exports.delete = function(req, res) {
    User.delete(req.params.id, (err, user) => (err) ? res.send(err) : res.json(   {
        error:false, 
        message:"El usuario fue eliminado",
        user: user
    }   )
)   }