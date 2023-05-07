'use strict';
const utils = require('../utils');
const config = require('../../config');
const sql = require('mssql');


const BANSPDV_XemPhieuDatSP_DV = async() => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('banspdv');
        const list = await pool.request()
                            .query(sqlQueries.BANSPDV_XemPhieuDatSP_DV);
        return list.recordset;
    } catch (error) {
        return error.message;
    }
}

const BANSPDV_XemThongTinPhieuSP_DV = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('banspdv');
        const info = await pool.request()
                            .input('mapdk', sql.VarChar(20), data.mapdk)
                            .input('stt', sql.Int, data.stt)
                            .query(sqlQueries.BANSPDV_XemThongTinPhieuSP_DV);
        return info.recordset;
    } catch (error) {
        return error.message;
    }
}

const BANSPDV_TaoHoaDonSPDV = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('banspdv');
        const result = await pool.request()
                            .input('mahd', sql.VarChar(15), data.mahd)
                            .input('mapdk', sql.VarChar(15), data.mapdk)
                            .input('stt', sql.Int, data.stt)
                            .query(sqlQueries.BANSPDV_TaoHoaDonSPDV);
        return result.recordset;
    } catch (error) {
        return error.message;
    }
}

const BANSPDV_XoaPhieuDK_SPDV = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('banspdv');
        const result = await pool.request()
                            .input('mapdk', sql.VarChar(15), data.mapdk)
                            .input('stt', sql.Int, data.stt)
                            .query(sqlQueries.BANSPDV_XoaPhieuDK_SPDV);
        return result.recordset;
    } catch (error) {
        return error.message;
    }
}

const BANSPDV_LayMAKH = async(data) => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('banspdv');
        const result = await pool.request()
                            .input('mapdk', sql.VarChar(15), data.mapdk)
                            .query(sqlQueries.BANSPDV_LayMAKH);
        return result.recordset;
    } catch (error) {
        return error.message;
    }
}

const BANSPDV_LayDS_DPDV = async() => {
    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('banspdv');
        const result = await pool.request()
                            .query(sqlQueries.BANSPDV_LayDS_DPDV);
        return result.recordsets;
    } catch (error) {
        return error.message;
    }
}

const BANSPDV_LayGia_SP = async(data) => {

    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('banspdv');
        const result = await pool.request()
                            .input('masp', sql.VarChar(15), data.masp)
                            .query(sqlQueries.BANSPDV_LayGia_SP);
        return result.recordset;
    } catch (error) {
        return error.message;
    }
}

const BANSPDV_Lay_KG_Gia_DV = async(data) => {

    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('banspdv');
        const result = await pool.request()
                            .input('madv', sql.VarChar(15), data.madv)
                            .query(sqlQueries.BANSPDV_Lay_KG_Gia_DV);
        return result.recordset;
    } catch (error) {
        return error.message;
    }
}

const BANSPDV_TaoPhieuDK_SPDV = async(data) => {

    try {
        let pool = await sql.connect(config.sql);
        const sqlQueries = await utils.loadSqlQueries('banspdv');
        const result = await pool.request()
                            .input('madv', sql.VarChar(15), data.madv)
                            .input('makg', sql.VarChar(15), data.makg)
                            .input('makh', sql.VarChar(15), data.makh)
                            .input('mapdk', sql.VarChar(15), data.mapdk)
                            .input('masp', sql.VarChar(15), data.masp)
                            .input('soluong', sql.Int, data.soluong)
                            .input('stt', sql.Int, data.stt)
                            .input('thanhtien', sql.Float, data.thanhtien)
                            .input('ghichu', sql.VarChar(50), data.ghichu)
                            .query(sqlQueries.BANSPDV_TaoPhieuDK_SPDV);
        return result.recordset;
    } catch (error) {
        return error.message;
    }
}
module.exports = {
    BANSPDV_XemPhieuDatSP_DV, BANSPDV_XemThongTinPhieuSP_DV, BANSPDV_TaoHoaDonSPDV, BANSPDV_XoaPhieuDK_SPDV,
    BANSPDV_LayMAKH, BANSPDV_LayDS_DPDV, BANSPDV_LayGia_SP, BANSPDV_Lay_KG_Gia_DV, BANSPDV_TaoPhieuDK_SPDV
}