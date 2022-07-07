const express = require('express');
const Router = express.Router();

const userController = require("../app/controllers/user.controller")

Router.get('/',userController.index)
Router.get('/login',userController.login)
Router.get('/:username',userController.show)

module.exports = Router