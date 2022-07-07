const Product = require('./../models/product.model')

class ProductController{

    index(req, res, next) {
        const getProductAll = async () => {

            try {
                const [rows]  = await Product.find();
                res.status(200).json(rows);
            }
            catch (err) {
                if(!err.statusCode)
                {
                    err.statusCode = 500;
                }
                next(err);
            }
        }
        getProductAll()
    }
}

module.exports = new ProductController;