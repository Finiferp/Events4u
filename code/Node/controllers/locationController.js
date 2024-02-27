"use strict"

const db = require("../DB");

const getLocations = async (req, res) => {
    try {
        const dbOutput = await db.getLocations();
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        res.status(parseInt(status_code)).json({
            message,
            data
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}


const addLocation = async (req, res) => {
    try {
        const adress = req.body.adress;
        const inputData = { adress };
        console.log(inputData);
        const dbOutput = await db.addLocation(inputData);
        let { status_code, message } = JSON.parse(dbOutput.outputJSON);
        console.log(message);
        res.status(parseInt(status_code)).json({
            message        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}


module.exports = {
    getLocations,
    addLocation

};