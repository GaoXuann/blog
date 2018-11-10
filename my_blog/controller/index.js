const conn = require('../db/db.js')
module.exports = {
    showIndex: (req, res) => {
        // if (!req.session.isLogin) return res.redirect('/')
        //每页显示5条数据
        const pagesize = 5
        const nowpage = parseInt(req.query.page) || 1
        console.log(nowpage);
        const sql = `select a.id, a.title, a.c_time,u.nickname 
         from article as a 
         LEFT JOIN user as u 
         on a.author_id = u.id 
         ORDER BY a.id desc    
         limit ${(nowpage - 1) * pagesize}, ${pagesize};
         select count(*) as count from article`
        conn.query(sql, (err, data) => {

            if (err) {
                return res.render('index.ejs', {
                    user: req.session.user,
                    isLogin: req.session.islogin,
                    // 文章列表
                    articles: []
                })
            }

            const totalPage = Math.ceil(data[1][0].count / pagesize)
                // console.log(totalPage);
            res.render('index.ejs', {
                    user: req.session.user,
                    isLogin: req.session.isLogin,
                    articles: data[0],
                    //总页数
                    totalPage: totalPage,
                    nowpage: nowpage

                })
                // console.log(data)

        })
    }
}