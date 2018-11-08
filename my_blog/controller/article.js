const moment = require('moment')
const conn = require('../db/db.js')
const marked = require('marked')
module.exports = {
    showAdd: (req, res) => {
        if (!req.session.isLogin) return res.redirect('/')
        res.render('article/add.ejs', {
            user: req.session.user,
            isLogin: req.session.isLogin
        })
    },
    // 添加页面
    add: (req, res) => {
        const body = req.body
        body.c_time = moment().format('YYYY-MM-DD HH:mm:ss')
        body.author_id = req.session.user.id
            // console.log(body)
        const insertSql = 'insert into article set ?'
        conn.query(insertSql, body, (err, data) => {
            if (err || data.affectedRows !== 1) return res.send({ status: 400, msg: '文章发表失败' })
            res.send({ msg: '发表文章成功！', status: 200, insertId: data.insertId })


        })
    },
    //详情页面
    info: (req, res) => {
        // res.render('article/info.ejs', {})
        const id = req.params.id
            //根据文章得id查询详情页
        const selSql = 'select * from article where id = ?'
        conn.query(selSql, id, (err, data) => {
            if (err) return res.send({ status: 500, mgs: '详情页查看失败', data: null })
            if (data.length !== 1) return res.redirect('/')

            //在调用res.render前把markdown语法转为html语法
            const html = marked(data[0].content)
                //把转好的html文本赋值给content
            data[0].content = html
                //渲染详情页面
            res.render('article/info.ejs', { user: req.session.user, isLogin: req.session.isLogin, article: data[0] })

        })
    },
    // 获取编辑页面
    getEdit: (req, res) => {
        if (!req.session.isLogin) return res.redirect('/')
        const sql = 'select * from article where id = ?'
        conn.query(sql, req.params.id, (err, data) => {
            res.render('article/edit.ejs', {
                user: req.session.user,
                isLogin: req.session.isLogin,
                article: data[0]
            })
        })

    },
    postEdit: (req, res) => {
        const user = req.body
        user.c_time = moment().format('YYYY-MM-DD HH:mm:ss')
            // console.log(user)
        const editSql = 'update article set ? where id = ?'
        conn.query(editSql, [user, user.id], (err, result) => {
            console.log(result)
            if (err || result.affectedRows !== 1) return res.send({ status: 400, msg: '修改文章失败', data: null })
            res.send({ status: 200, msg: '修改文章成功' })
        })
    }



}