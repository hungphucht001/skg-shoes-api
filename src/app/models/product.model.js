const db = require('./../../config/db');

class Product {
    static find(limit, offset, s, col, type, min, max) {
        let sql = `SELECT * FROM products where price >= ? and price <= ? and is_male = ? order by ${col} ${type} limit ${limit} offset ${offset}`
        return db.execute(sql, [min, max, s])
    }

    static findOne(slug) {
        return db.execute("SELECT * FROM products where slug=? limit 1", [slug])
    }

    static count(s, min, max) {
        return db.execute("SELECT count(*) as count FROM products where is_male = ? and price >= ? and price <= ?", [s, min, max,])
    }
    static search(q) {
        return db.execute(`SELECT * FROM products where slug LIKE '%${q}%' limit 5`)
    }
}

module.exports = Product