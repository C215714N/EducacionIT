const express = require('express')
const router = express.Router()
const userController = require('../controller/user')
const cartController = require('../controller/cart')
const { authToken, adminAuth } = require('../middleware/authentication')
/* UserRoutes */
    router.post   (  '/',     authToken,  userController.create  )
    router.get    (  '/',     adminAuth,  userController.list    )
    router.get    (  '/:id',  authToken,  userController.find    )
    router.put    (  '/:id',  authToken,  userController.update  )
    router.delete (  '/:id',  authToken,  userController.delete  )
/* Cart Router */
    router.post   (  '/:id/cart', adminAuth, cartController.create  )
    router.get    (  '/:id/cart',            cartController.list    )
    router.put    (  '/:id/cart/:id',        cartController.update  )
    router.delete (  '/:id/cart/:id',        cartController.delete  )


module.exports = router