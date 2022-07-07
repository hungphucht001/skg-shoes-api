const express = require('express');
const Router = express.Router();

const productController = require("../app/controllers/product.controller")

Router.get('/',productController.index)

module.exports = Router