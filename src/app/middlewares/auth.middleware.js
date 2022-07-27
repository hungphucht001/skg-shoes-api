
const jwt = require('jsonwebtoken');
const dotenv = require('dotenv')
dotenv.config();

module.exports = {
    authenToken: function (req, res, next) {
        const authorizationHeader = req.headers['authorization'];
        const token = authorizationHeader.split(' ')[1];

        if (!token) return res.sendStatus(401)
        jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, data) => {
            if (err)
                res.json({ data: { code: 403 } }).sendStatus(403)
            else next()
        })
    }
}