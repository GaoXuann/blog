const conn = require('../db/db.js')
module.exports = {
    showIndex: (req, res) => {
        const sql = "select * from article"
        conn.query(sql, (err, data) => {
            res.render('index.ejs', {
                user: req.session.user,
                isLogin: req.session.isLogin,
                article: data[0]
            })
        })

    }
}