const express = require('express')
const router = express.Router()
const ctrl = require('../controller/article.js')

router.get('/article/add', ctrl.showAdd)
router.post('/article/add', ctrl.add)
router.get('/article/info/:id', ctrl.info)
module.exports = router