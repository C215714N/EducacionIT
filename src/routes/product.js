const express = require('express')
const router = express.Router()
const productController = require('../controller/product')
const { authToken, isAdmin} = require('../middleware/authentication')
/* Product Routes */
    router.post     ( '/',    authToken, productController.create    )
    router.get      ( '/',               productController.list      )
    router.get      ( '/:id',            productController.find      )
    router.put      ( '/:id', authToken, productController.update    )
    router.delete   ( '/:id', authToken, productController.delete    )
module.exports = router