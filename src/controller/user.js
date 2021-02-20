const { response } = require('express');
const User = require('../model/user')

exports.findAll = function(req, res) {
    User.findAll(function(err, user){
        if (err) res.send(err);
            console.log('Resultado', user)
            res.send(user)
    })
}

exports.findById = function(req, res) {
    User.findById(req.params.id, function(err, user){
        (err) ? res.send(err) : res.json(user)
    })
}

exports.delete = function(req, res) {
    User.delete(req.params.id, function(err, user){
        if (err) res.send(err);
        res.json({
            error:false, 
            message:"El usuario fue eliminado"
        })
    })

}

exports.create = function (req, res) {
    const newUser = new User (req.body)
    if (req.body.constructor == Object && Object.keys(req.body) == 0) {
        res.status(400).send({
            error:true,
            message:'Todos los campos son obligatorios.'
        })
    } else {
        User.create(newUser, function(err, user) {
        err ? res.send(err) : res.json({
            error:false,
            message:'Usuario agregado con éxito.',
            data:user
        })
        }
        )
    }
}