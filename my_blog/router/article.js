const express = require('express')
const router = express.Router()
const ctrl = require('../controller/article.js')

router.get('/article/add', ctrl.showAdd)
router.post('/article/add', ctrl.add)
router.get('/article/info/:id', ctrl.info)
router.get('/article/edit/:id', ctrl.getEdit)
router.post('/article/edit', ctrl.postEdit)
module.exports = router