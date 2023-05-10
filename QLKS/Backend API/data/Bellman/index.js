'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');


const suitcaseList = async(manv) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('Bellman');
        const bookList = await pool.request()
                            .query(sqlQueries.getSuitcaseList);
        return bookList.recordset;
    } catch (error) {
        return error.message;
    }
}

const updateSuitcase = async (data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('Bellman');
        const result = await pool.request()
                            .input('mapdk', sql.Char(15), data.MAPDK)
                            .query(sqlQueries.updateSuitcase);
        return result.recordset;
    } catch (error) {
        console.log(error.message);
    }
}

module.exports = {
    suitcaseList, updateSuitcase
}