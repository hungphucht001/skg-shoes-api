const mysql = require('mysql2');

const public = {
    host: 'beryowmacowdt6vhsrjk-mysql.services.clever-cloud.com',
    user: 'urammh9cbgqxvvco',
    password: 'sk67DAVEPWBqjwN8BPsN',
    database: 'beryowmacowdt6vhsrjk'
}

const local = {
    host: 'localhost',
    user: 'admin',
    password: '@Hung001',
    database: 'akg_shoes'
}

const pool = mysql.createPool(public);

module.exports = pool.promise();
