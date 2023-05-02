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
        const arriveDate = new Date(data.arrive);
        const departDate = new Date(data.depart);
        const room = await pool.request()
                            .input('arrive', sql.Date, arriveDate)
                            .input('depart', sql.Date, departDate)
                            .input('type', sql.VarChar(20), data.type)
                            .query(sqlQueries.availableRoom);
        console.log(room.recordset);
        return room.recordset;
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
                            .input('mapdk', sql.VarChar(20), data.mapdk)                    
                            .input('diem', sql.VarChar(20), data.point)
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