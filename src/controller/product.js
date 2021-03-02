const Product = require('../model/product');
const User = require('../model/product');
const productRouter = require('../routes/product');

exports.findAll = function(req, res) {
    User.findAll(function(err, user){
        if (err) res.send(err);
            console.log('Resultado', user)
            res.send(user)
    })
}

exports.findById = function(req, res) {
    User.findById(req.params.id, function(err, user){
        (err) ? res.send(err) : res.json(user)
    })
}

exports.create = function(req, res) {
    const newProduct = new Product(req.body)
    if (req.body.constructor == Object && Object.keys(req.body).length == 0) {
        res.status(400).send({
            error: true,
            message: 'Debes completar todos los campos para enviar este formulario.'
        })
    } else {
        Product.create(newProduct, (err, product) => {
            err ? res.send(err) : res.json({
                error : false,
                message : 'Producto cargado exitosamente.',
                product : product
            })
        })
    }
}

exports.delete = function(req, res) {
    User.delete(req.params.id, function(err, user){
        if (err) res.send(err);
        res.json({
            error:false, 
            message:"El producto fue eliminado."
        })
    })

}