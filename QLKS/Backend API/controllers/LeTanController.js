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



//XEM DANH SÁCH PHÒNG
const DSPhong = async (req, res, next) => {
    try {
        const list = await LeTanData.DSphong();
        res.send(list);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}


//Tìm phòng 
const TimPhong = async (req, res, next) => {
    try {
        const contractNum = req.params.id;
        const list = await LeTanData.Timphong(contractNum);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}



//XEM DANH SÁCH DV ĐĂNG KÝ
const DSDVDky = async (req, res, next) => {
    try {
        const staffId = req.params.id;
        const list = await LeTanData.DSDVDKy(staffId);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}



//DANH SÁCH HÓA ĐƠN
const DSHoaDon = async (req, res, next) => {
    try {
        const staffId = req.params.id;
        const list = await LeTanData.DSHoaDon(staffId);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}




module.exports = {
    bookRoomList, detailRoom, suitcaseTrans,
    DSPhong,TimPhong,DSDVDky, DSHoaDon
}