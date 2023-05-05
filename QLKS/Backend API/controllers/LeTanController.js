'use strict';
const LeTanData = require('../data/LeTan');


const bookRoomList = async (req, res, next) => {
    try {
        const manv = req.params.id;
        const list = await LeTanData.BookList(manv);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const detailRoom = async (req, res, next) => {
    try {
        const maphong = req.params.id;
        const room = await LeTanData.detailBookedRoom(maphong);
        res.send(room);
    } catch (error) {
        res.status(400).send(error.message);
    }
}


const suitcaseTrans = async (req, res, next) => {
    try {
        const data = req.body;
        const result = await LeTanData.suitcaseToTrans(data);
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}


module.exports = {
    bookRoomList, detailRoom, suitcaseTrans
}