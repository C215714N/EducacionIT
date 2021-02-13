const express = require('express')

const userRouter = express.Router()
const userController = require('./controller/user')

userRouter.get('/', userController.findAll)

module.exports = userRouter