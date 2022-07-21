const db = require('./../../config/db');

class User{
    constructor(id, name, email, password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;   
    }
    static find( limit ){
        let sql = limit? "select * from users limit "+limit :"SELECT * FROM users"
        return db.execute(sql)
    }
    static findOne(username){
        return db.execute('select * from users where username = ?', [username])
    }
    static login(username, password){
        return db.execute('select * from users where username = ? and password = ? limit 1', [username, password])
    }
}


module.exports = User