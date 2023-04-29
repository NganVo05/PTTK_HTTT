'use strict';
const CustomerData = require('../data/customer');


const getStoreByName = async (req, res, next) => {
    try {
        const StoreId = req.params.id;
        const store = await CustomerData.getOneStore(StoreId);
        res.send(store);
    } catch (error) {
        res.status(400).send(error.message);
    }
}


const create_Customer = async (req, res, next) => {
    try {
        const data = req.body;
        const insert = await CustomerData.createCustomer(data);
        res.send(insert);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
module.exports = {
    getStoreByName,create_Customer
}