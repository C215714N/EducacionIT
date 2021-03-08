const express = require('express')
const router = express.Router()
const cartController = require('../controller/cart')
const { authToken, adminAuth } = require('../middleware/authentication')
/* Cart Routes */
    router.post   (  '/',     authToken,  cartController.create  )  // Nuevo Item
    router.get    (  '/',     adminAuth,  cartController.list    )  // Total Carritos
    router.get    (  '/:id',  authToken,  cartController.find    )  // Carrito de Usuario
    router.put    (  '/:id',  authToken,  cartController.update  )  // Actualizar Producto
    router.delete (  '/:id',  authToken,  cartController.delete  )  // Remover un Producto
module.exports = router