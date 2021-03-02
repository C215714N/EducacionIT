const express = require('express')

const productRouter = express.Router()
const productController = require('../controller/product')

productRouter.get('/', productController.findAll)
productRouter.get('/:id', productController.findById)
// productRouter.put('/:id', productController.update)
productRouter.post('/', productController.create)
productRouter.delete('/:id', productController.delete)



module.exports = productRouter