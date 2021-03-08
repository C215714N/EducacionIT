let dbConn = require('../middleware/dbConn');
/* Product Model Constructor */
    let Product    = function(product) {
        this.name   =   product.name
        this.detail =   product.detail
        this.price  =   product.price
        this.stock  =   product.stock
        this.img    =   product.img
    }
/* MySQL Product Methods (query, params, callback) */
    Product.create = (newProduct, result) => {    
        dbConn.query( "INSERT INTO products SET ?", 
            newProduct, (err, res) => (err) ? result(err, null) : result(null, res)
    )   }
    Product.list   = (result) => {
        dbConn.query( "SELECT * FROM products", 
            (err, res) => (err) ? result(null, err) : result(null, res)
    )   }
    Product.find   = (id, result) => {
        dbConn.query( "SELECT * FROM products WHERE id_product = ? OR name LIKE ?", 
            [id, '%'+id+'%'], (err, res) => (err) ? result(err, null) : result(null, res)
    )   }
    Product.update = (id, product, result) => {
        dbConn.query( "UPDATE products SET ? WHERE id_product = ?", 
            [ product, id ], (err, res) => (err) ? result(null, err) : result(null, res)
    )   }
    Product.delete = (id, result) => {
        dbConn.query( "DELETE FROM products WHERE id_product = ?", 
            id, (err, res) => (err) ? result(null, err) : result(null, res)
    )   }
module.exports     = Product