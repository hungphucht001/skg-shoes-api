const userRoute = require('./user.route')
const productRoute = require('./product.route')
const authRoute = require('./auth.route')
const cartRoute = require('./cart.route')

function routes(app) {
    app.use('/users', userRoute)
    app.use('/products', productRoute)
    app.use('/auth', authRoute)
    app.use('/cart', cartRoute)
}

module.exports = routes