const db = require('./../../config/db');

class Product{
    static find(limit, offset, s){
        return db.execute("SELECT * FROM products where is_male = ? limit ? offset ?",[s, limit, offset])
    }
    static findOne(id){
        return db.execute("SELECT * FROM products where id=? limit 1", [id])
    }
    static count()
    {
        return db.execute("SELECT count(*) as count FROM products")
    }
}

module.exports = Product