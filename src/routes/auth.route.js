const express = require('express');
const Router = express.Router();

const authController = require("../app/controllers/auth.controller")

Router.post('/login', authController.login)
Router.post('/refresh', authController.refreshToken)

module.exports = Router