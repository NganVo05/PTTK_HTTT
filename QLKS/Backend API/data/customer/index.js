'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');


const getOneStore = async(StoreName) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('customer');
        const store = await pool.request()
                            .input('NAME', sql.NChar(35), StoreName)
                            .query(sqlQueries.getStoreByName);
        return store.recordset;
    } catch (error) {
        return error.message;
    }
}

const createCustomer = async (data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('customer');
        const insert = await pool.request()
                            .input('makh'   , sql.Char(15), data.MAKH)
                            .input('hoten'  , sql.NChar(30), data.HOTEN)
                            .input('email'  , sql.Char(50), data.EMAIL)
                            .input('mk'     , sql.Char(20), data.MK)
                            .input('sdt'    , sql.Char(15), data.SDT)
                            .input('diachi' , sql.NChar(50), data.DIACHI)
                            .query(sqlQueries.createCustomer);                            
        return insert.recordset;
    } catch (error) {
        return error.message;
    }
}

module.exports = {
    getOneStore, createCustomer
}   