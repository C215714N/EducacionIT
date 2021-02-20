let dbCon = require('../dbCon');

let Product = function(product) {
    this.name = product.name
    this.detail = product.detail
    this.price = product.price
    this.stock = product.stock
    this.img = product.img
}

Product.findAll = function(result) {
    dbCon.query('SELECT * FROM Products', function(err, res){
        if (err) {
            console.log('Error.', err)
            result(null, err)
        }
        else {
            result(null, res)
        }
    })
}

Product.findById = function(id, result) {
    dbCon.query('SELECT * FROM Products WHERE id_product = ?',
    [id],
    function(err, res) {
        if (err) {
            console.log('Error: ', err);
            result(err, null)
        }
        else {
            result(null, res)
        }
    })
}

Product.delete = function(id, result) {
    dbCon.query('DELETE FROM Products WHERE id_product = ?',
    [id],
    function(err, res) {
        if (err) {
            result(null, err) 
        } else {
            result(null, res)
        }
    })
}

module.exports = Product