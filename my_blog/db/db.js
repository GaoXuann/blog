const mysql = require('mysql')

const conn = mysql.createConnection({
    host: '127.0.0.1',
    database: 'blog',
    password: 'root',
    user: 'root',
    // 开启执行多条Sql语句的功能
    multipleStatements: true
})
module.exports = conn