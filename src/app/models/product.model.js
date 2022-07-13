const db = require('./../../config/db');

class Product{
    static find(limit, offset, s, col, type){
        let sql =  `SELECT * FROM products where is_male = ? order by ${col} ${type} limit ? offset ?`
        return db.execute(sql,[s, limit, offset])

    }
    static findOne(slug){
        return db.execute("SELECT * FROM products where slug=? limit 1", [slug])
    }
    static count(s)
    {
        return db.execute("SELECT count(*) as count FROM products where is_male = ?", [s])
    }
}

module.exports = Product