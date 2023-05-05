'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');


const BookList = async(manv) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('LeTan');
        const bookList = await pool.request()
                            .input('MANV', sql.Char(15), manv)
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
                            .input('manv'       , sql.VarChar(15), data.MANV)
                            .input('soluong'    , sql.Int, data.SOLUONG)
                            .query(sqlQueries.addSuitcaseNeedToTrans);                            
        return insert.recordset;
    } catch (error) {
        return error.message;
    }
}



//XEM DANH SÁCH PHÒNG
const DSphong = async () => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('LeTan');
        const list = await pool.request().query(sqlQueries.DSPhongTra);
        return list.recordset;
    } catch (error) {
        console.log(error.message);
    }
}

//Tìm phòng
const Timphong = async(contractNum) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('LeTan');
        const list = await pool.request()
                            .input('tukhoa', sql.Char(15),contractNum)
                            .query(sqlQueries.TimPhong);
        return list.recordset;  
    } catch (error) {
        return error.message;
    }
}


//XEM DANH SÁCH DỊCH VỤ ĐĂNG KÝ
const DSDVDKy = async(staffID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('LeTan');
        const staff = await pool.request()
                            .input('makh', sql.Char(15), staffID)
                            .query(sqlQueries.DanhSachDVDK);
        return staff.recordset;
    } catch (error) {
        return error.message;
    }
}



//XEM HÓA ĐƠN
const DSHoaDon = async(staffID) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('LeTan');
        const staff = await pool.request()
                            .input('makh', sql.Char(15), staffID)
                            .query(sqlQueries.HoaDon);
        return staff.recordset;
    } catch (error) {
        return error.message;
    }
}




module.exports = {
    BookList, detailBookedRoom, suitcaseToTrans,
    DSphong, Timphong, DSDVDKy, DSHoaDon
}