'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');


const loginCustomer = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('login');
        const login = await pool.request()
                            .input('username', sql.Char(50), data.username)
                            .input('password', sql.Char(20), data.password)
                            .query(sqlQueries.customer);
        return login.recordset;
    } catch (error) {
        return error.message;
    }
}

module.exports = {
    loginCustomer
}