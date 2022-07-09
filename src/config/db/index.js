const mysql = require('mysql2'); 

const pool = mysql.createPool({
    host : 'sql8.freemysqlhosting.net',
    user : 'sql8505067',
    password : 'PnGNNyNtFV',
    database : 'sql8505067'
    });

module.exports = pool.promise();