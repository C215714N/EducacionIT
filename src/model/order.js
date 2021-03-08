let dbConn = require('../middleware/dbConn');
/* Order Model Constructor */
    let Order    = function(order) {
        this.cart.id_user    =   order.cart.id_user
        this.cart.id_state   =   order.cart.id_state
        this.cart.id_method  =   order.cart.id_method
        this.cart.price      =   order.cart.price
        this.cart.pago       =   order.cart.pago
        this.detail.id_order   = order.detail.id_order
        this.detail.id_product = order.detail.id_product
        this.detail.cantidad   = order.detail.cantidad
        this.detail.price      = order.detail.price
    }
/* MySQL Order Methods (query, params, callback) */
    Order.create = function(newOrder, result) {
        dbConn.query('INSERT INTO Orders VALUES ?', newOrder.cart, (err, res) => (err) ? result(null, err) : result(null, res))
        .then(order => dbConn.query(
            'INSERT INTO Orders_detail VALUES ?', newOrder.detail, (err, res) => (err) ? result(null, err) : result(null, res))
        .then(detail => dbConn.query(
            'UPDATE Orders SET price = (SELECT SUM(price * cantidad) WHERE id_order = ? AND id_user = ?)',
        [detail.order_id, order.id_user], (err, res) => (err) ? result(null, err) : result(null, res)
    )   )   )   }
    Order.list   = function(result) {
        dbConn.query('SELECT * FROM Order AS o JOIN Orders_detail AS od ON o.id_order =', 
        (err, res) => (err) ? result(null, err) : result(null, res)
    )   }
    Order.find   = function(id, result) {
        dbConn.query('SELECT * FROM Order WHERE id_user = ?',
        id, (err, res) => err ? result(err, null) : result(null, res)
    )   }
    Order.update = function(id, result) {
        dbConn.query('UPDATE Order WHERE id_order = ?',
        id, (err, res) => err ? result(null, err) : result(null, res)
    )   }
    Order.delete = function(id, result) {
        dbConn.query('DELETE FROM Orders WHERE id_order = ?',
        id, (err, res) => err ? result(null, err) : result(null, res)
    )   }
module.exports   = Order