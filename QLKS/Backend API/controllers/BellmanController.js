'use strict';
const bellmanData = require('../data/Bellman');


const suitcaseListForBellman = async (req, res, next) => {
    try {
        const manv = req.params.id;
        const list = await bellmanData.suitcaseList(manv);
        res.send(list);
    } catch (error) {
        res.status(400).send(error.message);
    }
}
const updateSuitcaseForBellman = async (req, res, next) => {
    try {
        const data = req.body;
        const result = await bellmanData.updateSuitcase(data);
        res.send(result);
    } catch (error) {
        res.status(400).send(error.message);
    }
}

module.exports = {
    suitcaseListForBellman, updateSuitcaseForBellman
}