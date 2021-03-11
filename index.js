    const express = require('express')
    const swaggerJsDoc = require("swagger-jsdoc");
    const swaggerUi = require("swagger-ui-express");

    const delilah = express()
    const app = require('./package.json')
    const port = process.env.PORT || 5000
    
    const user    = require( './src/routes/user'    )
    const product = require( './src/routes/product' )
    const cart    = require( './src/routes/cart'    )
    const order   = require( './src/routes/order'   )
    const { login, signup } = require('./src/middleware/auth')
    
    delilah.use( express.urlencoded( {extended : true} ) )
    delilah.use( express.json() )
    delilah.get('/', (req, res) => { res.send( {
        tittle:  app.name,
        message: `Bienvenido a ${app.description}, comienza realizando un pedido`,
        autor: app.author,
        version: app.version,
        puerto: port
        }   ) 
    }   )
    delilah.listen( port, () => { console.log(`El puerto utilizado es: ${port}`) } );
// Extended: https://swagger.io/specification/#infoObject
    const swaggerOptions = {
        swaggerDefinition: {
        info: {
            version: app.version,
            title: app.name,
            description: "Delilah Resto API REST",
            contact: {
            name: port
            },
            servers: ["http://localhost:5000"]
        }
        },
        // ['.routes/*.js']
        apis: ["index.js"]
    };
    const swaggerDocs = swaggerJsDoc(swaggerOptions);

    delilah.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocs));
    delilah.use( '/signup',   signup  ) // Registro de usuario
    delilah.use( '/login',    login   ) // Inicio de Sesion
    delilah.use( '/users',    user    ) // Perfiles de Usuario
    delilah.use( '/products', product ) // Venta de Productos
    delilah.use( '/cart',     cart    ) // Carrito de Compras
    delilah.use( '/orders',   order   ) // Ordenes de compra 

/* AUTH */
    /**
     * @swagger
     *  tags:
     *      name: auth    
     *      description: delilah user authentication,
     */ 
    /**
    @swagger
    *  /:
    *  get:
    *      tags: [auth]
    *      summary: Start API Endpoint
    *      responses:
    *      '200':
    *          description: Bienvenido a Delilah Resto
    */

    /**
     * @swagger
     * /signup:
     *  post:
     *    tags: [auth]
     *    summary: Creates a new user and generates access token
     *    responses:
     *      '200':
     *        description: A successful response
     *      '400':
     *        description: User already exists
     */
    /**
    @swagger
    *  /login:
    *  post:
    *      tags: [auth]
    *      summary: Validates user data for Access
    *      responses:
    *      '200':
    *          description: User Authenticated
            '400':
                description: Invalid User o Pass
    */

/* USERS */
    /**
     * @swagger
     *  tags:
     *      name: users    
     *      description: delilah user authentication,
     */ 
    /**
     * @swagger
     * /users/:
     *   post:
     *     summary: Create a new user (admin)
     *     tags: [users]
     *     parameters:
     *       - in: headers
     *         name: authorization
     *         schema:
     *           type: string
     *         required: true
     *         description: JWT validation Token required
     *     responses:
     *       200:
     *         description: User created succesfully
     *         contens:
     *           application/json:
     *             schema:
     *               $ref: '#/components/schemas/user'
     *       400:
     *         description: User already exists
     */
    /**
     * @swagger
     * /users:
     *   get:
     *     summary: get all users cart (admin rigths)
     *     tags: [users]
     *     responses:
     *       200:
     *         description: Lista de Usuarios
     *         content:
     *           application/json:
     *             schema:
     *               type: array
     *               items:
     *                 $ref: '#/components/schemas/user'
     */
    /**
     * @swagger
     * /users/{id}:
     *   get:
     *     summary: Get profile by id_user
     *     tags: [users]
     *     parameters:
     *       - in: path
     *         name: id
     *         schema:
     *           type: string
     *         required: true
     *         description: User Profile
     *     responses:
     *       200:
     *         description: Access granted
     *         contens:
     *           application/json:
     *             schema:
     *               $ref: '#/components/schemas/user'
     *       404:
     *         description: Authorization Required
     */
    /**
     * @swagger
     * /users/{id}:
     *   put:
     *     summary: updates cart by id_user
     *     tags: [users]
     *     parameters:
     *       - in: path
     *         name: id
     *         schema:
     *           type: string
     *         required: true
     *         description: id
     *     responses:
     *       200:
     *         description: id
     *         contens:
     *           application/json:
     *             schema:
     *               $ref: '#/components/schemas/user'
     *       404:
     *         description: no shopping-cart for this user
     */
    /**
 * @swagger
 * /users/{id}:
 *   delete:
 *     summary: delete user by id_user
 *     tags: [users]
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: id
 *     responses:
 *       200:
 *         description: product deleted
 *         contens:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/user'
 *       404:
 *         description: no shopping-cart for this user
 */

/* PRODUCTS */
    /**
     * @swagger
     *  tags:
     *      name: products    
     *      description: delilah product authentication,
     */ 
    /**
     * @swagger
     * /products/:
     *   post:
     *     summary: Create a new product (admin)
     *     tags: [products]
     *     parameters:
     *       - in: headers
     *         name: JWT token
     *         schema:
     *           type: string
     *         required: true
     *         description: JWT validation Token required
     *     responses:
     *       200:
     *         description: product created succesfully
     *         contens:
     *           application/json:
     *             schema:
     *               $ref: '#/components/schemas/product'
     *       400:
     *         description: product already exists
     */
    /**
     * @swagger
     * /products:
     *   get:
     *     summary: get all products cart (admin rigths)
     *     tags: [products]
     *     responses:
     *       200:
     *         description: list of shopping cart
     *         content:
     *           application/json:
     *             schema:
     *               type: array
     *               items:
     *                 $ref: '#/components/schemas/product'
     */
    /**
     * @swagger
     * /products/{id}:
     *   get:
     *     summary: Get profile by id_product
     *     tags: [products]
     *     parameters:
     *       - in: path
     *         name: id
     *         schema:
     *           type: string
     *         required: true
     *         description: id
     *     responses:
     *       200:
     *         description: id
     *         contens:
     *           application/json:
     *             schema:
     *               $ref: '#/components/schemas/product'
     *       404:
     *         description: no shopping-cart for this product
     */
    /**
     * @swagger
     * /products/{id}:
     *   put:
     *     summary: updates cart by id_product
     *     tags: [products]
     *     parameters:
     *       - in: path
     *         name: id
     *         schema:
     *           type: string
     *         required: true
     *         description: id
     *     responses:
     *       200:
     *         description: id
     *         contens:
     *           application/json:
     *             schema:
     *               $ref: '#/components/schemas/product'
     *       404:
     *         description: no shopping-cart for this product
     */
    /**

/* CART */
/**
  * @swagger
  * tags:
  *   name: cart
  *   description: user cart management
  */
/**
 * @swagger
 * /cart:
 *   get:
 *     summary: get all users cart (admin rigths)
 *     tags: [cart]
 *     responses:
 *       200:
 *         description: list of shopping cart
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/cart'
 */
/**
 * @swagger
 * /cart/{id}:
 *   get:
 *     summary: Get the cart by id_user
 *     tags: [cart]
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: id
 *     responses:
 *       200:
 *         description: id
 *         contens:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/cart'
 *       404:
 *         description: no shopping-cart for this user
 */
/**
 * @swagger
 * /cart/{id}:
 *   put:
 *     summary: updates cart by id_user
 *     tags: [cart]
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: id
 *     responses:
 *       200:
 *         description: id
 *         contens:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/cart'
 *       404:
 *         description: no shopping-cart for this user
 */
/**
 * @swagger
 * /cart/{id}:
 *   delete:
 *     summary: Get the cart by id_user
 *     tags: [cart]
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: id
 *     responses:
 *       200:
 *         description: product deleted
 *         contens:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/cart'
 *       404:
 *         description: no shopping-cart for this user
 */

/**
 * @swagger
 *  tags:
 *      name: orders    
 *      description: delilah order authentication,
 */ 
/**
 * @swagger
 * /orders/:
 *   post:
 *     summary: Create a new order (admin)
 *     tags: [orders]
 *     parameters:
 *       - in: headers
 *         name: JWT token
 *         schema:
 *           type: string
 *         required: true
 *         description: JWT validation Token required
 *     responses:
 *       200:
 *         description: order created succesfully
 *         contens:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/order'
 *       400:
 *         description: order already exists
 */
/**
 * @swagger
 * /orders:
 *   get:
 *     summary: get all orders cart (admin rigths)
 *     tags: [orders]
 *     responses:
 *       200:
 *         description: list of shopping cart
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/order'
 */
/**
 * @swagger
 * /orders/{id}:
 *   get:
 *     summary: Get profile by id_order
 *     tags: [orders]
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: id
 *     responses:
 *       200:
 *         description: id
 *         contens:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/order'
 *       404:
 *         description: no shopping-cart for this order
 */
/**
 * @swagger
 * /orders/{id}:
 *   put:
 *     summary: updates cart by id_order
 *     tags: [orders]
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: id
 *     responses:
 *       200:
 *         description: id
 *         contens:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/order'
 *       404:
 *         description: no shopping-cart for this order
 */