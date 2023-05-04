'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');


const roomStatus = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('booking');
        // console.log(typeof(data.arrive));
        // console.log(data);
        const arriveDate = new Date();
        const departDate = new Date();
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
                            .input('diem', sql.VarChar(20), data.point)
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
        console.log(data);
        const room = await pool.request()
                            .input('MAPDK', VARCHAR(15),)
                            .input('MAKH', VARCHAR(15),)
                            .input('NGAYLAP', DATETIME,)
                            .input('MANV', VARCHAR(8),)
                            .input('NGAYDEN', DATETIME,)
                            .input('NGAYDI', DATETIME,)
                            .input('SODEMLUUTRU', INT,)
                            .input('THANHTIEN', FLOAT,)
                            .input('TYPE', VARCHAR(20),)
                            .input('SoPhong', INT,)
                            .input('NOTE', VARCHAR(50),)
                            .query(sqlQueries.bookRoom);
        console.log(room.recordset);
        return room.recordset;
    } catch (error) {
        return error.message;
    }
}

module.exports = {
    roomStatus, rateRoom, bookRoom
}   