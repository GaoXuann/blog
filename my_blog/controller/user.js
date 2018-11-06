const conn = require('../db/db.js')
const moment = require('moment')
module.exports = {
    login: (req, res) => {
        res.render('user/login.ejs', {})
    },
    register: (req, res) => {
        res.render('user/register.ejs', {})
    },
    getregister: (req, res) => {
        const user = req.body
        const username = req.body.username
        if (user.username.trim().length < 0 || user.password.trim().length < 0 || user.nickname.trim().length < 0) {
            return res.send({ status: 500, mgs: '请将表单内容输入完整' })
        }
        //查询用户名是否重名
        const selSql = "select count(*) as count from user where username = ?"
        conn.query(selSql, username, (err, data) => {
            if (err) return res.status(500).send({ status: 500, msg: '重名查询失败' });
            if (data[0].count != 0) return res.send({ status: 400, msg: '用户名已存在，请重新输入' })

            // //执行注册得业务逻辑
            user.ctime = moment().format('YYYY-MM-DD HH:mm:ss')
                // console.log(user)
            const addSql = 'insert into user set ?'
            conn.query(addSql, user, (err, data) => {
                if (err) return res.status(400).send({ status: 500, msg: '请重新注册' });
                if (data.affectedRows !== 1) return res.status({ status: 500, msg: '注册用户失败' })
                res.send({ status: 200, msg: 'ok' })
            })

        })

    },
    getlogin: (req, res) => {
        const user = req.body
        const username = req.body.username
        const password = req.body.password
        const checkSql = 'select * from user where username=? and password = ?'
        conn.query(checkSql, [username, password], (err, data) => {
            if (err) return res.status(500).send({ status: 500, msg: '用户登录成功' })
            if (data.length !== 1) return res.send({ status: 400, msg: '用户登录失败' })
            req.session.user = data[0]
            req.session.isLogin = true
            res.send({ status: 200, msg: '登录成功' })
        })
    },
    logout: (req, res) => {
        req.session.destroy(function() {
            res.redirect('/')
        })
    },


}