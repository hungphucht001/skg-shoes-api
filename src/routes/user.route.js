const express = require('express');
const Router = express.Router();

const userController = require("../app/controllers/user.controller")

Router.get('/:username', userController.show)
Router.get('/', userController.index)

module.exports = Router