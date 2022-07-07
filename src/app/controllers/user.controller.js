const User = require('./../models/user.model')
const urlSlug = require('url-slug')

class UserController{
    index(req, res, next) {
        const limit = req.query.limit
        const getUserAll = async () => {

            try {
                const [rows]  = await User.find(limit);
        
                res.status(200).json({data: rows});
            }
            catch (err) {
                if(!err.statusCode)
                {
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
                const [rows]  = await User.findOne(username);
                res.status(200).json({user:rows[0]});
            }
            catch (err) {
                if(!err.statusCode)
                {
                    err.statusCode = 500;
                }
                next(err);
            }
        }
        getUser()
    }
    login(req, res, next) {

        const username = req.body.username || 'hunght001'
        const password = req.body.password || '123'

        const check = async () => {
            try {
                const [rows1]  = await User.findOne(username);
                if(rows1[0]){
                    const [rows2] = await User.login(username, password);
                    if(rows2[0]){
                        res.json('login success')
                    }
                    else res.json({message:'wrong password'})
                }
                else res.json({message: 'username not found'})
            }
            catch (err) {
                if(!err.statusCode)
                {
                    err.statusCode = 500;
                }
                next(err);
            }
        }
        check()
    }
}

module.exports = new UserController;