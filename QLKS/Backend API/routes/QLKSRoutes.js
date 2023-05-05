'use strict';

const express = require('express');
const QLKSControll = require('../controllers/QLKSController');
<<<<<<< Updated upstream

const CUSTOMERControll = require('../controllers/CUSTOMERController');

=======
<<<<<<< HEAD
const CUSTOMERControll = require('../controllers/CUSTOMERController');
const BellmanController = require('../controllers/BellmanController')
const LeTanController = require('../controllers/LeTanController');
=======

const CUSTOMERControll = require('../controllers/CUSTOMERController');

>>>>>>> b22ff4b1410b776fbedb8a05d99d45c43a44ae1d
>>>>>>> Stashed changes
const router = express.Router();

//-----------------------------login---------------------------------
router.post('/login/customer', QLKSControll.login_customer);
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
//---------------------------customer----------------------------
router.get('/customer/:id', CUSTOMERControll.getStoreByName);
router.get('/customer/disk/:id', CUSTOMERControll.getDiskById);
router.get('/customer/order/:id', CUSTOMERControll.getOrderByID);
router.post('/customer/addOrder', CUSTOMERControll.postOrder);
router.post('/customer/addOrderStore', CUSTOMERControll.postOrderStore);
router.post('/customer/addOrderDetail', CUSTOMERControll.postOrderDetail);
router.post('/customer/addFeedback',CUSTOMERControll.postFeedback);
router.post('/customer/signup',CUSTOMERControll.create_Customer);

//---------------------------Danh sách đặt phòng---------------
router.get('/book-room-list/:id',LeTanController.bookRoomList);
router.get('/detail-booked-room/:id',LeTanController.detailRoom);
router.post('/add-suitecase-to-trans',LeTanController.suitcaseTrans);

//---------------------------Danh sách hành lý cần vận chuyển---------------
router.get('/suitcase-list-for-bellman/:id',BellmanController.suitcaseListForBellman);
router.post('/update-suitcase-for-bellman', BellmanController.updateSuitcaseForBellman)
=======
>>>>>>> Stashed changes
//----------------------------customer-------------------------------
// router.get('/customer/:id', CUSTOMERControll.getStoreByName);
// router.get('/customer/disk/:id', CUSTOMERControll.getDiskById);
// router.get('/customer/order/:id', CUSTOMERControll.getOrderByID);
// router.post('/customer/addOrder', CUSTOMERControll.postOrder);
// router.post('/customer/addOrderStore', CUSTOMERControll.postOrderStore);
// router.post('/customer/addOrderDetail', CUSTOMERControll.postOrderDetail);
// router.post('/customer/addFeedback',CUSTOMERControll.postFeedback);
// router.post('/customer/signup',CUSTOMERControll.create_Customer);
//-----------------------------bookingRoom---------------------------------
// router.get('/RoomStatus', QLKSControll.roomStatus);
router.post('/RoomStatus', QLKSControll.roomStatus);
router.post('/Rating', QLKSControll.rateRoom);
router.post('/Booking', QLKSControll.bookRoom);

<<<<<<< Updated upstream
=======
>>>>>>> b22ff4b1410b776fbedb8a05d99d45c43a44ae1d
>>>>>>> Stashed changes
module.exports = {
    routes: router
}