const db = require('./../../config/db');

class Auth {
    static login(username, password) {
        return db.execute('select * from users where username = ? and password = ? limit 1', [username, password])
    }
    static findOne(username) {
        return db.execute('select * from users where username = ?', [username])
    }
    static updateToken(token, id) {
        return db.execute('UPDATE users set token = ? where id = ?', [token, id])
    }
    static selectToken(token) {
        return db.execute('SELECT token from users WHERE token = ?', [token])
    }
}


module.exports = Auth