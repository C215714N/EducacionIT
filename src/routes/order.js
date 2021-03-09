const express = require('express')
const router = express.Router()
const orderController = require('../controller/cart')
const { authToken, adminAuth } = require('../middleware/auth')
/* Cart Routes */
    router.post   (  '/',     authToken,  orderController.create  )  // Nuevo Item
    router.get    (  '/',     adminAuth,  orderController.list    )  // Total Carritos
    router.get    (  '/:id',  authToken,  orderController.find    )  // Carrito de Usuario
    router.put    (  '/:id',  authToken,  orderController.update  )  // Actualizar Producto
    router.delete (  '/:id',  authToken,  orderController.delete  )  // Remover un Producto
module.exports = router