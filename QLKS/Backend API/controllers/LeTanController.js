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



//XEM DANH SÁCH HÓA ĐƠN
const DSHDP = async (req, res, next) => {
    try {
        const list = await LeTanData.DSHDP();
        res.send(list);        
    } catch (error) {
        res.status(400).send(error.message);
    }
}


//Tìm hóa đơn 
const HoaDon = async (req, res, next) => {
    try {
        const contractNum = req.params.id;
        const list = await LeTanData.HoaDon(contractNum);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}



//XEM DANH SÁCH DV ĐĂNG KÝ
const updateBill = async (req, res, next) => {
    try {
        const staffId = req.body;
        const list = await LeTanData.updateBill(staffId);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}



//XÓA HÓA ĐƠN
const deleteBill = async (req, res, next) => {
    try {
        const staffId = req.params.id;
        const list = await LeTanData.deleteBill(staffId);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

//XÓA HÓA ĐƠN
const detailBill = async (req, res, next) => {
    try {
        const staffId = req.params.id;
        const list = await LeTanData.detailBill(staffId);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}



module.exports = {
    bookRoomList, detailRoom, suitcaseTrans,
    DSHDP, HoaDon, updateBill, deleteBill, detailBill
}