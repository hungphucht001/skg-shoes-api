const mysql = require('mysql2'); 

const public = {
    host : 'sql8.freemysqlhosting.net',
    user : 'sql8505067',
    password : 'PnGNNyNtFV',
    database : 'sql8505067'
    }

const local = {
    host : 'localhost',
    user : 'admin',
    password : 'hungphuc',
    database : 'skg_shoes'
    }

const pool = mysql.createPool(local);

module.exports = pool.promise();
