let dbConn = require('../middleware/dbConn');
/* Cart Model Constructor */
    let Cart = function(cart) {
        this.id_user    =   cart.id_user
        this.id_product =   cart.id_product
        this.quantity   =   cart.quantity
    }
/* MySQL Cart Methods (query, params, callback) */
    Cart.create = function(newCart, result) {
        dbConn.query('INSERT INTO Carts SET ?',
        newCart, (err, res) => err ? result(err, null) : result(null, res)
    )   }
    Cart.list = function(result) {
        dbConn.query('SELECT * FROM Cart', 
        (err, res) => (err) ? result(null, err) : result(null, res)
    )   }
    Cart.find = function(id, result) {
        dbConn.query('SELECT * FROM Cart WHERE id_user = ?',
        id, (err, res) => err ? result(err, null) : result(null, res)
    )   }
    Cart.update = function(id, result) {
        dbConn.query('UPDATE Cart WHERE id_cart = ?',
        id, (err, res) => err ? result(null, err) : result(null, res)
    )   }
    Cart.delete = function(id, result) {
        dbConn.query('DELETE FROM Carts WHERE id_cart = ?',
        id, (err, res) => err ? result(null, err) : result(null, res)
    )   }
module.exports = Cart