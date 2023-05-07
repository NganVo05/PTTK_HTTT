'use strict';
const BanSPDVData = require('../data/banspdv');



const BANSPDV_XemPhieuDatSP_DV = async (req, res, next) => {
    try {
        const list = await BanSPDVData.BANSPDV_XemPhieuDatSP_DV();
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const BANSPDV_XemThongTinPhieuSP_DV = async (req, res, next) => {
    try {
        const data = req.body;
        const info = await BanSPDVData.BANSPDV_XemThongTinPhieuSP_DV(data);
        res.send(info);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const BANSPDV_TaoHoaDonSPDV = async (req, res, next) => {
    try {
        const data = req.body;
        const result = await BanSPDVData.BANSPDV_TaoHoaDonSPDV(data);
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const BANSPDV_XoaPhieuDK_SPDV = async (req, res, next) => {
    try {
        const data = req.body;
        const result = await BanSPDVData.BANSPDV_XoaPhieuDK_SPDV(data);
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const BANSPDV_LayMAKH = async (req, res, next) => {
    try {
        const data = req.body;
        const result = await BanSPDVData.BANSPDV_LayMAKH(data);
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const BANSPDV_LayDS_DPDV = async (req, res, next) => {
    try {
        const result = await BanSPDVData.BANSPDV_LayDS_DPDV();
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const BANSPDV_LayGia_SP = async (req, res, next) => {
    try {
        const data = req.body;
        const result = await BanSPDVData.BANSPDV_LayGia_SP(data);
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const BANSPDV_Lay_KG_Gia_DV = async (req, res, next) => {
    try {
        const data = req.body;
        const result = await BanSPDVData.BANSPDV_Lay_KG_Gia_DV(data);
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

const BANSPDV_TaoPhieuDK_SPDV = async (req, res, next) => {
    try {
        const data = req.body;
        const result = await BanSPDVData.BANSPDV_TaoPhieuDK_SPDV(data);
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
module.exports = {
    BANSPDV_XemPhieuDatSP_DV, BANSPDV_XemThongTinPhieuSP_DV, BANSPDV_TaoHoaDonSPDV, BANSPDV_XoaPhieuDK_SPDV,
    BANSPDV_LayMAKH, BANSPDV_LayDS_DPDV, BANSPDV_LayGia_SP, BANSPDV_Lay_KG_Gia_DV, BANSPDV_TaoPhieuDK_SPDV
}