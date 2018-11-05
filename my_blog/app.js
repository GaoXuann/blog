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
app.get('/', (req, res) => {
    res.render('index.ejs', {})
})
app.get('/login', (req, res) => {
    res.render('user/login.ejs', {})
})
app.get('/register', (req, res) => {
        res.render('user/register.ejs', {})
    })
    // app.post('/register',(req,res)=>{
    //     console.log(body.p)
    // })
app.listen(80, () => {
    console.log('http://127.0.0.1')
})