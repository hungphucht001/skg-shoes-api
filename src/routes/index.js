const userRoute = require('./user.route')
const productRoute = require('./product.route')

function routes(app){
    app.use('/users', userRoute)
    app.use('/products', productRoute)
}

module.exports = routes