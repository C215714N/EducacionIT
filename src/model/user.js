let dbCon = require('../dbCon');

let User = function(user) {
    this.name = user.name
    this.user = user.user
    this.email = user.email
    this.pass = user.pass
    this.phone = user.phone
    this.address = user.address
    this.admin = user.admin ? user.admin : false
}

User.findAll = function(result) {
    dbCon.query('SELECT * FROM Users', function(err, res){
        if (err) {
            console.log('Error.', err)
            result(null, err)
        }
        else {
            result(null, res)
        }
    })
}

User.findById = function(id, result) {
    dbCon.query('SELECT * FROM Users WHERE id_user = ?',
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

User.delete = function(id, result) {
    dbCon.query('DELETE FROM Users WHERE id_user = ?',
    [id],
    function(err, res) {
        if (err) {
            result(null, err) 
        } else {
            result(null, res)
        }
    })
}

module.exports = User