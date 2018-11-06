const express = require('express')
const app = express()
const fs = require('fs')
const path = require('path')
const bodyParser = require('body-parser')


//设置模板引擎
app.set('view engine', 'ejs')
    //模板的根目录，来渲染页面的相对数据
app.set('views', './view')
    //托管静态资源
app.use('/node_modules', express.static('./node_modules'))

app.use(bodyParser.urlencoded({ extended: false }))

// const indexRouter = require('./router/index.js')
// app.use(indexRouter)

// const userRouter = require('./router/user.js')
// app.use(userRouter)

//循环读取路由模块下的文件
fs.readdir(path.join(__dirname, './router'), (err, res) => {
    if (err) return console.log('文件读取失败')
    res.forEach(fname => {
        // console.log(fname)
        const router = require(path.join(__dirname, './router', fname))
        app.use(router)
            // console.log(router)
    })

})


app.listen(80, () => {
    console.log('http://127.0.0.1')
})