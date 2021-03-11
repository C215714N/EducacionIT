let dbConn = require('../middleware/dbConn');
/*  Detail Model Constructor */
    let Order = function(order) {
        this.id_order   =  order.id_order
        this.id_product =  order.id_product
        this.cantidad   =  order.cantidad
        this.price      =  order.price
    }
/*  MySQL Detail methods (query, params, callback) */
    Order.create = async (id, pay, cart, result) => {
        dbConn.query( `INSERT INTO Orders VALUES(id_user, id_method) VALUES(${id}, ${pay})`)
        const id_order = await dbConn.query(`SELECT max(id_order) FROM Order WHERE id_user = ${id}`, (err, res) => (err) ? result(null, err) : result(null, err));
        dbConn.query(`INSER INTO orders_detail SET id_order=${id_order} ? WHERE id_user=${id}`, 
            cart, (err, res) => (err) ? result(err, null) : resutl(null,err)
        )   } 
    Order.list = (result) => {
        dbConn.query('SELECT * FROM orders AS o JOIN orders_detail AS od ON od.id_order = o.id_order', 
        (err, res) => (err) ? result(null, err) : result(null, res)
    )   } 
    Order.find   = (id, result) => {
        dbConn.query('SELECT * FROM orders AS o JOIN orders_detail AS od ON od.id_order = o.id_order WHERE id_user = ?', 
        id , (err, res) => (err) ? result(err, null) : result(null, res)
    )   }
    Order.update = async (id, detail, result) => {
        const order = await dbConn.query('SELECT MAX(id_order) WHERE id_user = ?', 
            id, (err, res) => res.send(res))
        dbConn.query('UPDATE Orders SET id_state = ? WHERE id_user = ? AND id_order = ?)', 
        [ detail, id, order ], (err, res) => (err) ? result(err, null) : result(null, res)
    )   }
    Order.delete = (id, result) => {
        dbConn.query('DELETE orders_detail WHERE id_order = ?', 
        id, (err,res) => err ? res.send(null, err) : res.send(null, res) )
        .then ( dbConn.query('DELETE orders WHERE id_order = ?', 
        id, (err,res) => err ? res.send(null, err) : res.send(null, res) )   
    )   }
module.exports  = Order;