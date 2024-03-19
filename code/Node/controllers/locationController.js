"use strict"

const db = require("../DB");

/**
 * Retrieves locations from the database and sends the response to the client.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise} the response sent to the client
 */
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


/**
 * Asynchronous function for adding a location.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise} a promise that resolves to the result of adding a location
 */
const addLocation = async (req, res) => {
    try {
        const adress = req.body.adress;
        const inputData = { adress };
        //console.log(inputData);
        const dbOutput = await db.addLocation(inputData);
        let { status_code, message } = JSON.parse(dbOutput.outputJSON);
        //console.log(message);
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