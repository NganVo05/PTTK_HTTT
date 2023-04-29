'use strict';
const LoginData = require('../data/login');


const login_customer = async (req, res, next) => {
    try {
        const data = req.body;
        const username = await LoginData.loginCustomer(data);
        res.send(username);
    } catch (error) {
        res.status(400).send(error.message);
    }
}


module.exports = {
    login_customer
}