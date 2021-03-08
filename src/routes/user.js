const express = require('express')
const router = express.Router()
const userController = require('../controller/user')
const { authToken, login } = require('../middleware/authentication')
/* UserRoutes */
    router.post   ('/login',            login  )
    router.post   ( '/',    authToken,  userController.create )
    router.get    ( '/',    authToken,  userController.list   )
    router.get    ( '/:id', authToken,  userController.find   )
    router.delete ( '/:id', authToken,  userController.delete )
    router.put    ( '/:id', authToken,  userController.update )
module.exports = router