'use strict';

const express = require('express');
const CUSTOMERControll = require('../controllers/CUSTOMERController');
const router = express.Router();


//---------------------------customer----------------------------
router.get('/customer/:id', CUSTOMERControll.getStoreByName);
router.post('/customer/signup',CUSTOMERControll.create_Customer);

module.exports = {
    routes: router
}