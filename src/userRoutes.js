const express = require('express')

const userRouter = express.Router()
const userController = require('./controller/user')

userRouter.get('/', userController.findAll)
userRouter.get('/:id', userController.findById)
userRouter.delete('/:id', userController.delete)

module.exports = userRouter