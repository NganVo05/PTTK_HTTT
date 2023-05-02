'use strict';

const express = require('express');
const QLKSControll = require('../controllers/QLKSController');

const CUSTOMERControll = require('../controllers/CUSTOMERController');

const router = express.Router();

//-----------------------------login---------------------------------
router.post('/login/customer', QLKSControll.login_customer);
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
router.get('/RoomStatus', QLKSControll.roomStatus);
router.post('/Rating', QLKSControll.rateRoom);
router.post('/Booking', QLKSControll.bookRoom);

module.exports = {
    routes: router
}