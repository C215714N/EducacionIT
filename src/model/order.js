let dbConn = require('../middleware/dbConn');
/*  Detail Model Constructor */
    let Order = function(order) {
        this.id_order   =  order.id_order
        this.id_product =  order.id_product
        this.cantidad   =  order.cantidad
        this.price      =  order.price
    }
/*  MySQL Detail methods (query, params, callback) */
    Order.create = (id, result) => {
        var queries = 
            `INSERT INTO orders_detail(id_product, quantity, price) SELECT id_product, quantity, price FROM cart WHERE id_user = ?;
            INSERT INTO orders(id_user, price) VALUES ( ?, ( SELECT SUM(quantity * price) FROM cart WHERE id_user = ?; DELETE FROM users WHERE id_user = ?`
        ;
        dbConn.query( queries, [ id, id, id, id ],  (err, res) => (err) ? result(err, null) : result(null, res)
    )   } 
    Order.list = (result) => {
        dbConn.query('SELECT * FROM orders_detail AS od, orders AS WHERE od.id_order = o.id_order ', 
        (err, res) => (err) ? result(null, err) : result(null, res)
    )   } 
    Order.find   = (id, result) => {
        dbConn.query('SELECT * FROM Orders_detail AS od, orders AS WHERE od.id_order = o.id_order AND id_user = ?', 
        [ id ], (err, res) => (err) ? result(err, null) : result(null, res)
    )   }
    Order.update = (id, detail, result) => {
        dbConn.query('UPDATE orders_detail SET ? WHERE id_detail = ?', 
        [ detail, id ], (err, res) => (err) ? result(err, null) : result(null, res)
    )   }
    Order.delete = (id, result) => {
        dbConn.query('DELETE FROM orders_detail WHERE id_order = ?', 
        [ id, id ], (err, res) => (err) ? result(null, err) : result(null, res)
    )   }
module.exports  = Order;