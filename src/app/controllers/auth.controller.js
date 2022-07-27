const Auth = require('./../models/auth.model')
const jwt = require('jsonwebtoken');
const dotenv = require('dotenv')
dotenv.config();

class AuthController {
    login(req, res, next) {

        const username = req.body.username
        const password = req.body.password

        const check = async () => {
            try {
                const [rows1] = await Auth.findOne(username);
                if (rows1.length > 0) {
                    const [rows2] = await Auth.login(username, password);
                    if (rows2.length > 0) {
                        const data = {
                            id: rows2[0].id,
                            name: rows2[0].name,
                            username: rows2[0].username,
                            avatar: rows2[0].avatar,
                        }

                        res.setHeader('Content-Type', 'application/json')
                        console.log(rows2[0])
                        const accessToken = jwt.sign(data, process.env.ACCESS_TOKEN_SECRET, { expiresIn: '30s' })
                        const refreshToken = jwt.sign(data, process.env.REFRESH_TOKEN_SECRET)
                        await Auth.updateToken(refreshToken, data.id);
                        res.json({
                            data: {
                                user: data,
                                token: {
                                    accessToken,
                                    refreshToken,
                                }
                            }
                        })
                    }
                    else res.json({ message: 'wrong password' })
                }
                else res.json({ message: 'username not found' })
            }
            catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
                next(err);
            }
        }
        check()
    }

    refreshToken(req, res, next) {
        const refreshToken = req.body.token
        if (!refreshToken) res.sendStatus(401)
        const check = async () => {
            const [rows] = await Auth.selectToken(refreshToken)
            if (rows.length <= 0) {
                res.sendStatus(403)
            }
            jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET, (err, data) => {
                if (err) res.sendStatus(403)//Không có quyền truy cập route
                const accessToken = jwt.sign({ username: data.username }, process.env.ACCESS_TOKEN_SECRET, { expiresIn: '30s' })
                res.json({ accessToken })
            })
        }
        check()
    }

    logout(req, res, next) {
        const refreshToken = req.body.token
        console.log(refreshToken);
        if (!refreshToken) res.sendStatus(403)
        if (refreshTokens.indexOf(refreshToken) === -1) res.sendStatus(403)
        // refreshTokens.slice(refreshToken)
        refreshTokens = refreshTokens.filter(refToken => refToken !== refreshToken);
        res.sendStatus(200)
    }

    cart(req, res, next) {
        res.json("hello nè")
    }
}
module.exports = new AuthController()