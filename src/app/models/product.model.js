const db = require('./../../config/db');

class Product{
    static find(){
        return db.execute('select * from products')
    }
}

module.exports = Product