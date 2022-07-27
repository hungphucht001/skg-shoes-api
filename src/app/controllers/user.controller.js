const User = require('./../models/user.model')
const urlSlug = require('url-slug')

class UserController {
    index(req, res, next) {
        const limit = req.query.limit
        const getUserAll = async () => {

            try {
                const [rows] = await User.find(limit);

                res.status(200).json({ data: rows });
            }
            catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
                next(err);
            }
        }
        getUserAll()
    }

    show(req, res, next) {
        const username = req.params.username || ''
        const getUser = async () => {
            try {
                const [rows] = await User.findOne(username);
                res.status(200).json({ user: rows[0] });
            }
            catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
                next(err);
            }
        }
        getUser()
    }

}

module.exports = new UserController;