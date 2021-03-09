    const express = require('express')
    const bodyParser = require('body-parser')
    const delilah = express()
    const app = require('./package.json')
    const port = process.env.PORT || 5000
    
    const user    = require( './src/routes/user'    )
    const product = require( './src/routes/product' )
    const cart    = require( './src/routes/cart'    )
    const order   = require( './src/routes/order'   )
    const { login, signup } = require('./src/middleware/auth')

    delilah.use( bodyParser.urlencoded( {extended : true} ) )
    delilah.use( bodyParser.json() )
    delilah.get('/', (req, res) => { res.send( {
        tittle:  app.name,
        message: `Bienvenido a ${app.name}, comienza realizando un pedido`,
        autor: app.author,
        version: app.version,
        puerto: port
        }   ) 
    }   )
    delilah.listen( port, () => { console.log(`El puerto utilizado es: ${port}`) } );

    delilah.use( '/signup',   signup  ) // Registro de usuario
    delilah.use( '/login',    login   ) // Inicio de Sesion
    delilah.use( '/users',    user    ) // Perfiles de Usuario
    delilah.use( '/products', product ) // Venta de Productos
    delilah.use( '/cart',     cart    ) // Carrito de Compras
    delilah.use( '/orders',    order   ) // Ordenes de compra 

    exports.session