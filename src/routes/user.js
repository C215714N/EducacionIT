const express = require('express')
const router = express.Router()
const userController = require('../controller/user')
const { authToken, adminAuth } = require('../middleware/authentication')
/* User Routes */
    router.post   (  '/',     authToken,  userController.create  )
    router.get    (  '/',     adminAuth,  userController.list    )
    router.get    (  '/:id',  authToken,  userController.find    )
    router.put    (  '/:id',  authToken,  userController.update  )
    router.delete (  '/:id',  authToken,  userController.delete  )
module.exports = router