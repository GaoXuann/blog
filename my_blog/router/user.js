const express = require('express')
const router = express.Router()

const conn = require('../db/db.js')

const ctrl = require('../controller/user.js')
router.get('/login', ctrl.login)
router.get('/register', ctrl.register)
router.post('/register', ctrl.getregister)

router.post('/login', ctrl.getlogin)
module.exports = router