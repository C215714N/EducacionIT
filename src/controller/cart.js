const Cart = require('../model/cart')

exports.create = function(req, res) {
    const newCart = new Cart(req.body)
    (req.body.constructor == Object && Object.keys(req.body).length == 0) ?
        res.status(400).send( {
            error: true,
            message: 'Debes seleccionar un producto'
        }   ) : Cart.create(newCart, (err, cart) => err ? res.send(err) : res.json( {
            error : false,
            message : 'Producto agregado al carrito.',
            cart : cart
        }   )
)   }
exports.list = function(req, res) {
    Cart.list((err, user) => { (err) ? res.send(err) : res.send(user) }
)   }
exports.find = function(req, res) {
    Cart.find(req.params.id, (err, user) => (err) ? res.send(err) : res.json(user)
)   }
exports.update = function(req, res) {
    (req.body.constructor == Object && Object.keys(req.body).length == 0) ?
        res.status(400).send( {
            error: true,
            message: 'Debes completar todos los campos.'
        }   ) : Cart.update(req.body, (err, cart) => err ? res.send(err) : res.json( {
            error : false,
            message : 'Carrito actualizado exitosamente.',
            cart : cart
        }   )
)   }
exports.delete = function(req, res) {
    Cart.delete(req.params.id, (err, cart) => (err) ? res.send(err) : res.json(   {
        error:false, 
        message:"El producto fue eliminado del carrito",
        user: cart
    }   )
)   }