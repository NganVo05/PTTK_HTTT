'use strict';

const express = require('express');
const QLKSControll = require('../controllers/QLKSController');
const BellmanController = require('../controllers/BellmanController');
const LeTanController = require('../controllers/LeTanController');
const BANSPDVControll = require('../controllers/BANSPDVController');
const router = express.Router();


//---------------------------Danh sách đặt phòng---------------
router.get('/book-room-list/:id',LeTanController.bookRoomList);
router.get('/detail-booked-room/:id',LeTanController.detailRoom);
router.post('/add-suitecase-to-trans',LeTanController.suitcaseTrans);

//---------------------------Danh sách hành lý cần vận chuyển---------------
router.get('/suitcase-list-for-bellman/:id',BellmanController.suitcaseListForBellman);
router.post('/update-suitcase-for-bellman', BellmanController.updateSuitcaseForBellman);


//-----------------------------bookingRoom---------------------------------
// router.get('/RoomStatus', QLKSControll.roomStatus);
router.post('/RoomStatus', QLKSControll.roomStatus);
router.post('/Rating', QLKSControll.rateRoom);
router.post('/Booking', QLKSControll.bookRoom);
router.post('/AddCustomer', QLKSControll.addCustomer);
router.post('/AddCustomer', QLKSControll.addCustomer);
router.post('/AddRoomInvoice', QLKSControll.addRoomInvoice);

//-----------------CheckOut------------
router.get('/staff/HoaDon', LeTanController.DSHDP);
router.get('/staff/HoaDon/:id', LeTanController.HoaDon);
router.post('/staff/updateBill', LeTanController.updateBill);
router.delete('/staff/deleteBill/:id', LeTanController.deleteBill);
router.get('/staff/detailBill/:id', LeTanController.deleteBill);

// ----------------Ban SPDV--------------
router.get('/getlistservtickets', BANSPDVControll.BANSPDV_XemPhieuDatSP_DV);
router.post('/getinfooneticket',BANSPDVControll.BANSPDV_XemThongTinPhieuSP_DV);
router.post('/createbill',BANSPDVControll.BANSPDV_TaoHoaDonSPDV);
router.post('/deleteorder',BANSPDVControll.BANSPDV_XoaPhieuDK_SPDV);
router.post('/getcustomercode',BANSPDVControll.BANSPDV_LayMAKH);
router.get('/getproductlist', BANSPDVControll.BANSPDV_LayDS_DPDV);
router.post('/getproductprice',BANSPDVControll.BANSPDV_LayGia_SP);
router.post('/getsevicedetail',BANSPDVControll.BANSPDV_Lay_KG_Gia_DV);
router.post('/createorder',BANSPDVControll.BANSPDV_TaoPhieuDK_SPDV);

module.exports = {
    routes: router
}