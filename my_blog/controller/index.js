const conn = require('../db/db.js')
module.exports = {
    showIndex: (req, res) => {
        const sql = `select a.id, a.title, a.c_time,u.nickname 
         from article as a 
         LEFT JOIN user as u 
         on a.author_id = u.id 
         ORDER BY a.id desc`;
        conn.query(sql, (err, data) => {
            if (err) {
                return res.render('index.ejs', {
                    user: req.session.user,
                    islogin: req.session.islogin,
                    // 文章列表
                    articles: []
                })
            }
            res.render('index.ejs', {
                user: req.session.user,
                isLogin: req.session.isLogin,
                articles: data
            })
            console.log(data)

        })
    }
}