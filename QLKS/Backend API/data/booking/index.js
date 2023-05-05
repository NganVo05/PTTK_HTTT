'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');


const roomStatus = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('booking');
        // console.log(typeof(data.arrive));
        console.log(data);
        const room = await pool.request()
                            .input('Arrive', sql.VarChar(10), data.arrive)
                            .input('Depart', sql.VarChar(10), data.depart)
                            .input('Type', sql.NVarChar(20), data.type)
                            .query(sqlQueries.availableRoom);
        console.log(room.recordsets);
        return room.recordsets;
    } catch (error) {
        return error.message;
    }
}

const rateRoom = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('booking');
        // console.log(typeof(data.arrive));
        console.log(data);
        const room = await pool.request()
                            .input('mapdk', sql.VarChar(20), data.mapdk)                    
                            .input('diem', sql.VarChar(20), data.diem)
                            .query(sqlQueries.rateRoom);
        console.log(room.recordset);
        return room.recordset;
    } catch (error) {
        return error.message;
    }
}

const bookRoom = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('booking');
        // console.log(typeof(data.arrive));
        // console.log(data);
        const room = await pool.request()
                            .input('MAPDK', sql.VarChar(15), data.MAPDK)
                            .input('MAKH', sql.VarChar(15), data.MAKH)
                            .input('NGAYLAP', sql.DateTime, data.NGAYLAP)
                            .input('NGAYDEN', sql.DateTime, data.NGAYDEN)
                            .input('NGAYDI', sql.DateTime, data.NGAYDI)
                            .input('SODEMLUUTRU', sql.Int, data.SODEMLUUTRU)
                            .input('THANHTIEN', sql.Float, data.THANHTIEN)
                            .input('TYPE', sql.VarChar(20), data.TYPE)
                            .input('SOPHONG', sql.Int, data.SOPHONG)
                            .input('NOTE', sql.VarChar(50), data.NOTE)
                            .query(sqlQueries.bookRoom);
        console.log(room.recordset);
        return room.recordset;
    } catch (error) {
        return error.message;
    }
}

const addCustomer = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('booking');
        // console.log(typeof(data.arrive));
        // console.log(data);
        const result = await pool.request()
                            .input('MAKH', sql.VarChar(15), data.MAKH)
                            .input('TENKH', sql.VarChar(30), data.TENKH)
                            .input('CCCD', sql.VarChar(15), data.CCCD)
                            .input('DIACHI', sql.VarChar(50), data.DIACHI)
                            .input('SDT', sql.VarChar(15), data.SDT)
                            .input('FAX', sql.VarChar(20), data.FAX)
                            .input('EMAIL', sql.VarChar(30), data.EMAIL)
                            .input('TENDOAN', sql.VarChar(30), data.TENDOAN)
                            .input('SOLUONG', sql.Int, data.SOLUONG)
                            .query(sqlQueries.addCustomer);
        console.log(result.recordset);
        return result.recordset;
    } catch (error) {
        return error.message;
    }
}

module.exports = {
    roomStatus, rateRoom, bookRoom, addCustomer
}   