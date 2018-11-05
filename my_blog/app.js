const express = require('express')
const app = express()
const bodyParser = require('body-parser')


//设置模板引擎
app.set('view engine', 'ejs')
    //模板的根目录，来渲染页面的相对数据
app.set('views', './view')
    //托管静态资源
app.use('/node_modules', express.static('./node_modules'))

app.use(bodyParser.urlencoded({ extended: false }))

const indexRouter = require('./router/index.js')
app.use(indexRouter)

const userRouter = require('./router/user.js')
app.use(userRouter)


app.listen(80, () => {
    console.log('http://127.0.0.1')
})