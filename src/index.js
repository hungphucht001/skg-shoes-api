const express = require('express')
const bodyParser = require('body-parser')
var cors = require('cors')
const routes = require('./routes')


require('dotenv').config({path: './.env'})

const PORT = process.env.PORT || 3006

const app = express()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(cors()) 
routes(app)

app.listen(PORT, ()=> console.log(`listening on http://localhost:${PORT}`))