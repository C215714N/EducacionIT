const User = require('../model/user')


exports.findAll = function(req, res) {
    User.findAll(function(err, user){
        if (err) res.send(err);
            console.log('Resultado', user)
            res.send(user)
    })
}

