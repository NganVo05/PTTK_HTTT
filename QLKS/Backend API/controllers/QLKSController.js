'use strict';
const booking = require('../data/booking');

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
    roomStatus, rateRoom, bookRoom,
}