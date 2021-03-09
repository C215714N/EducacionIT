let dbConn = require('../middleware/dbConn');
/* Cart Model Constructor */
    let Cart = function(cart) {
        this.id_user    =   cart.id_user
        this.id_product =   cart.id_product
        this.quantity   =   cart.quantity
    }
/* MySQL Cart Methods (query, params, callback) */
    Cart.create = (newCart, result) => {
        dbConn.query(`INSERT INTO Cart SET ?, price = (SELECT price FROM products WHERE id_product = ${newCart.id_product})`,
        newCart, (err, res) => err ? result(err, null) : result(null, res)
    )   }
    Cart.list = (result) => {
        dbConn.query('SELECT * FROM Cart', 
        (err, res) => (err) ? result(null, err) : result(null, res)
    )   }
    Cart.find = (id, result) => {
        dbConn.query('SELECT * FROM Cart WHERE id_user = ?',
        id, (err, res) => err ? result(err, null) : result(null, res)
    )   }
    Cart.update = (id, product, result) => {
        dbConn.query(`UPDATE Cart SET ?, price = (SELECT price FROM products WHERE id_product = ${product.id_product}) WHERE id_user = ? AND id_product = ?`,
        [product, id, product.id_product], (err, res) => err ? result(null, err) : result(null, res)
    )   }
    Cart.delete = (id, product, result) => {
        dbConn.query('DELETE FROM Cart WHERE id_user = ? AND id_product = ?',
        [id, product], (err, res) => err ? result(null, err) : result(null, res)
    )   }
module.exports = Cart