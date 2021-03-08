const Product = require('../model/product');
/*  NodeJS Product Handler Methods */
    exports.create = function(req, res) {
        const newProduct = new Product(req.body)
        (req.body.constructor == Object && Object.keys(req.body).length == 0) ?
            res.status(400).send( {
                error: true,
                message: 'Debes completar todos los campos.'
            }   ) : Product.create(newProduct, (err, product) => err ? res.send(err) : res.json( {
                error : false,
                message : 'Producto cargado exitosamente.',
                product : product
            }   )
    )   }
    exports.list = function(req, res) {
        Product.list( (err, user) => { (err) ? res.send(err) : res.send(user) }
    )   }
    exports.find = function(req, res) {
        Product.find(req.params.id, (err, user) => (err) ? res.send(err) : res.json(user)
    )   }
    exports.update = function(req, res) {
        (req.body.constructor == Object && Object.keys(req.body).length == 0) ?
            res.status(400).send( {
                error: true,
                message: 'Debes completar todos los campos.'
            }   ) : Product.update(req.body, (err, product) => err ? res.send(err) : res.json( {
                error : false,
                message : 'Producto actualizado exitosamente.',
                product : product
            }   )
    )   }
    exports.delete = function(req, res) {
        Product.delete(req.params.id, (err, product) => (err) ? res.send(err) : res.json(   {
            error:false, 
            message:"El producto fue eliminado.",
            user: product
        }   )
    )   }