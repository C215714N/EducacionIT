const Order = require('../model/order')
/*  NodeJS Orders Handler Methods */
    exports.Order = function (req, res) {
        Order.create( req.params.id, (err, order) => (err) ? res.send(err) : res.send( {
            message: 'La orden fue cargada con exito',
            descripton: order
        }   )
    )   }
    exports.Order = function (req, res) {
        Order.list( (err, order) => { (err) ? res.send(err) : res.send(order) 
        console.log(order)}
    )   }
    exports.Order = function (req, res) {
        Order.find( req.params.id, (err, order) => { (err) ? res.send(err) : res.send(order);
        console.log(order)}
    )   }