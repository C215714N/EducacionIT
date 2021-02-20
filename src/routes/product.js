const express = require('express')

const productRouter = express.Router()
const productController = require('../controller/product')

productRouter.get('/', productController.findAll)
productRouter.get('/:id', productController.findById)
productRouter.delete('/:id', productController.delete)

module.exports = productRouter