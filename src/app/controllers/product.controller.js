const Product = require("./../models/product.model");

class ProductController {
    index(req, res, next) {
        
        const limit = req.query._limit || 10;
        const page = req.query._page || 1;
        const s = req.query.s || 1;
        const type = req.query.type || "asc";
        const col = req.query.col || "id";
        const getProductAll = async () => {
            try {
                const [data] = await Product.find(limit, (page - 1) * limit , s, col, type);
                const [count_all] = await Product.count(s);
                const result = {
                    data: data,
                    pagination: {
                        _page: page,
                        _limit: limit,
                        _totalPages: count_all[0].count,
                    },
                };
                res.status(200).json(result);
            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
                next(err);
            }
        };
        getProductAll();
    }

    show(req, res, next) {
        const slug = req.params.slug;
        
        const getProduct = async () => {
            try {
                const [rows] = await Product.findOne(slug);
                res.status(200).json(rows[0]);
            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
                next(err);
            }
        };
        getProduct();
    }
}

module.exports = new ProductController();
