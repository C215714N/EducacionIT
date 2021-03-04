const express = require('express')

const userRouter = express.Router()
const userController = require('../controller/user')
const { authToken } = require('../middleware/authentication')

userRouter.get( '/', authToken , userController.findAll )
userRouter.get( '/:id', authToken , userController.findById )
userRouter.delete( '/:id', authToken, userController.delete )
userRouter.post( '/', authToken, userController.create )
// userRouter.put('/:id', userController.update)
module.exports = userRouter