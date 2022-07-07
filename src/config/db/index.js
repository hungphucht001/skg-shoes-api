const mysql = require('mysql2'); 

const pool = mysql.createPool({
    host : 'localhost',
    user : 'root',
    password : '',
    database : 'skg_shoes'
    });

module.exports = pool.promise();