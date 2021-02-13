let dbCon = require('../dbCon');

let User = function(user) {
    this.nombre = user.nombre
    this.usuario = user.usuario
    this.correo = user.correo
    this.pass = user.pass
    this.telefono = user.telefono
    this.address = user.address
    this.administrator = user.administrator ? user.administrator : false
}

User.findAll = function(result) {
    dbCon.query('select * from usuarios', function(err, res){
        if (err) {
            console.log('Error.', err)
            result(null, err)
        }
        else {
            console.log('Usuarios: ', res)
            result(null, res)
        }
    })
}

module.exports = User