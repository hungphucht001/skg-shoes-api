const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const routes = require('./routes')
const app = express()

require('dotenv').config({ path: './.env' })

const PORT = process.env.PORT || 5000

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(cors())

routes(app)

app.listen(PORT, () => console.log(`listening on http://localhost:${PORT}`))