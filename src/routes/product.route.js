const express = require('express');
const Router = express.Router();

const productController = require("../app/controllers/product.controller")

Router.get('/:slug',productController.show)
Router.get('/',productController.index)

module.exports = Router