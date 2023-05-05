'use strict';

const express = require('express');
const QLKSControll = require('../controllers/QLKSController');

const BellmanController = require('../controllers/BellmanController')
const LeTanController = require('../controllers/LeTanController');

const router = express.Router();


//---------------------------Danh sách đặt phòng---------------
router.get('/book-room-list/:id',LeTanController.bookRoomList);
router.get('/detail-booked-room/:id',LeTanController.detailRoom);
router.post('/add-suitecase-to-trans',LeTanController.suitcaseTrans);

//---------------------------Danh sách hành lý cần vận chuyển---------------
router.get('/suitcase-list-for-bellman/:id',BellmanController.suitcaseListForBellman);
router.post('/update-suitcase-for-bellman', BellmanController.updateSuitcaseForBellman)

//-----------------------------bookingRoom---------------------------------
// router.get('/RoomStatus', QLKSControll.roomStatus);
router.post('/RoomStatus', QLKSControll.roomStatus);
router.post('/Rating', QLKSControll.rateRoom);
router.post('/Booking', QLKSControll.bookRoom);

module.exports = {
    routes: router
}