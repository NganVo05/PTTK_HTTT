'use strict';
const LoginData = require('../data/login');
<<<<<<< Updated upstream
const booking = require('../data/booking');
=======
<<<<<<< HEAD

=======
const booking = require('../data/booking');
>>>>>>> b22ff4b1410b776fbedb8a05d99d45c43a44ae1d
>>>>>>> Stashed changes

const login_customer = async (req, res, next) => {
    try {
        const data = req.body;
        const username = await LoginData.loginCustomer(data);
        res.send(username);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

<<<<<<< Updated upstream
=======
<<<<<<< HEAD

module.exports = {
    login_customer
=======
>>>>>>> Stashed changes
const roomStatus = async (req, res, next) => {
    try {
        // var data = {};
        // data.arrive = req.query.arrive;
        // data.depart = req.query.depart;
        // data.type = req.query.type;
        // console.log("Data: ", data);
        const data = req.body;
        const room = await booking.roomStatus(data);
        res.send(room);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const rateRoom = async (req, res, next) => {
    try {
        const data = req.body;
        const result = await booking.rateRoom(data);
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const bookRoom = async (req, res, next) => {
    try {
        const data = req.body;
        const result = await booking.bookRoom(data);
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

module.exports = {
    login_customer, roomStatus, rateRoom, bookRoom,
<<<<<<< Updated upstream
=======
>>>>>>> b22ff4b1410b776fbedb8a05d99d45c43a44ae1d
>>>>>>> Stashed changes
}