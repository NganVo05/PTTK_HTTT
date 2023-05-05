'use strict';

const express = require('express');
const QLKSControll = require('../controllers/QLKSController');

<<<<<<< Updated upstream
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

=======
// const CUSTOMERControll = require('../controllers/CUSTOMERController');

const router = express.Router();

//-----------------------------login---------------------------------
// router.post('/login/customer', QLKSControll.login_customer);
//----------------------------customer-------------------------------
// router.get('/customer/:id', CUSTOMERControll.getStoreByName);
// router.get('/customer/disk/:id', CUSTOMERControll.getDiskById);
// router.get('/customer/order/:id', CUSTOMERControll.getOrderByID);
// router.post('/customer/addOrder', CUSTOMERControll.postOrder);
// router.post('/customer/addOrderStore', CUSTOMERControll.postOrderStore);
// router.post('/customer/addOrderDetail', CUSTOMERControll.postOrderDetail);
// router.post('/customer/addFeedback',CUSTOMERControll.postFeedback);
// router.post('/customer/signup',CUSTOMERControll.create_Customer);
>>>>>>> Stashed changes
//-----------------------------bookingRoom---------------------------------
// router.get('/RoomStatus', QLKSControll.roomStatus);
router.post('/RoomStatus', QLKSControll.roomStatus);
router.post('/Rating', QLKSControll.rateRoom);
router.post('/Booking', QLKSControll.bookRoom);
router.post('/AddCustomer', QLKSControll.addCustomer);

module.exports = {
    routes: router
}