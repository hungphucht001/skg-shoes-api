const express = require('express');
const Router = express.Router();

const authController = require("../app/controllers/auth.controller")
const authMiddleware = require("../app/middlewares/auth.middleware")

Router.get('/', authMiddleware.authenToken, authController.cart)

module.exports = Router