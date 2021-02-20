const express = require('express')

const userRouter = express.Router()
const userController = require('../controller/user')

userRouter.get('/', userController.findAll)
userRouter.get('/:id', userController.findById)
userRouter.delete('/:id', userController.delete)
userRouter.post('/', userController.create)
userRouter.put('/:id', userController.update)
module.exports = userRouter