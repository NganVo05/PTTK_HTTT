'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');


const BookList = async(manv) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('LeTan');
        const bookList = await pool.request()
                            
                            .query(sqlQueries.getBookListRoom);
        return bookList.recordset;
    } catch (error) {
        return error.message;
    }
}

const detailBookedRoom = async(maphong) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('LeTan');
        const roomDetail = await pool.request()
                            .input('MAPHONG', sql.Char(15), maphong)
                            .query(sqlQueries.getRoomDetail);
        return roomDetail.recordsets;
    } catch (error) {
        return error.message;
    }
}

const suitcaseToTrans = async (data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('LeTan');
        const insert = await pool.request()
                            .input('mapdk'      , sql.VarChar(15), data.MAPDK)
                            .input('makh'       , sql.VarChar(15), data.MAKH)
                            .input('ngaylap'    , sql.DateTime, data.NGAYLAP)
                            .input('soluong'    , sql.Int, data.SOLUONG)
                            .input('mahl'       , sql.VarChar(15), data.MAHL)
                            .query(sqlQueries.addSuitcaseNeedToTrans);                            
        return insert.recordset;
    } catch (error) {
        return error.message;
    }
}



//XEM DANH SÁCH HÓA ĐƠN
const DSHDP = async () => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('LeTan');
        const list = await pool.request().query(sqlQueries.DSHDP);
        return list.recordset;
    } catch (error) {
        console.log(error.message);
    }
}

//TÌM HÓA ĐƠN
const HoaDon = async(bookingID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('LeTan');
        const list = await pool.request()
                            .input('MAPDK', sql.Char(15),bookingID)
                            .query(sqlQueries.HoaDon);
        console.log(list.recordset);
        return list.recordset;  
    } catch (error) {
        return error.message;
    }
}

//CẬP NHẬT HÓA ĐƠN
const updateBill = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('LeTan');
        console.log(data.NOTE);
        const staff = await pool.request()
                            .input('MAPDK', sql.VarChar(15), data.MAPDK)
                            .input('PTTT', sql.NVarChar(30), data.PTTT)
                            .input('TINHTRANG', sql.NVarChar(50), data.TINHTRANG)
                            .input('NOTE', sql.NVarChar(50), data.NOTE)
                            .input('NGAYLAP', sql.DateTime, data.NGAYLAP)
                            .query(sqlQueries.updateBill);
        console.log(staff.recordset);
        return staff.recordset;
    } catch (error) {
        return error.message;
    }
}

//XÓA HÓA ĐƠN
const deleteBill = async(bookingID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('LeTan');
        const staff = await pool.request()
                            .input('MAPDK', sql.Char(15), bookingID)
                            .query(sqlQueries.deleteBill);
        return staff.recordset;
    } catch (error) {
        return error.message;
    }
}

//CHI TIẾT HÓA ĐƠN
const detailBill = async(bookingID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('LeTan');
        const staff = await pool.request()
                            .input('MAPDK', sql.Char(15), bookingID)
                            .query(sqlQueries.detailBill);
        console.log(staff.recordset);
        return staff.recordset;
    } catch (error) {
        return error.message;
    }
}



module.exports = {
    BookList, detailBookedRoom, suitcaseToTrans,
    DSHDP, HoaDon, updateBill, deleteBill, detailBill
}
