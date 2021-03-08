    const express = require('express')
    const bodyParser = require('body-parser')
    const delilah = express()
    const port = process.env.PORT || 5000

    const user = require('./src/routes/user')
    const product = require('./src/routes/product')
    const { login, signup } = require('./src/middleware/authentication')

    delilah.use( bodyParser.urlencoded( {extended : true} ) )
    delilah.use( bodyParser.json() )
    delilah.get('/', (req, res) => { res.send('La conexión funciona correctamente.') } )
    delilah.listen( port, () => { console.log(`El puerto utilizado es: ${port}`) } );

    
    delilah.use(  '/signup',  signup   )
    delilah.use(  '/login',    login   )
    delilah.use(  '/users',    user    )
    delilah.use(  '/products', product )