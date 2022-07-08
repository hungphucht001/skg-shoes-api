const db = require('./../../config/db');

class Product{
    static find(limit){
        let sql = limit? "select * from products limit "+limit :"SELECT * FROM products"
        return db.execute(sql)
    }
}

module.exports = Product