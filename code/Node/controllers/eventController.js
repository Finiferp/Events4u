"use strict"

const db = require("../DB");

const getEvent = async (req, res) => {
    try {
        const eventId = parseInt(req.params.id);
        const activeUser = 1; //TODO IF NO ONE LOGGED IN SET TO -1

        const inputData = { eventId, activeUser };
        const dbOutput = await db.getEvent(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        if(data === null){
            status_code = 404;
            message =  "Event no longer exists.";
        }
        
        res.status(status_code).json({
            message,
            data: data,
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

const getEvents = async (req, res) => {
    try {
        const activeUser = 1; //TODO IF NO ONE LOGGED IN SET TO -1
        const inputData = { activeUser };
        const dbOutput = await db.getEvents(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        if(data === null){
            status_code = 404;
            message =  "No Events Found";
        }
        
        res.status(status_code).json({
            message,
            data: data,
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

const toggleFavorite = async (req, res) => {
    try {
        const userID = 1; //TODO IF NOT LOGGED IN REDIRECT TO LOGIN PAGE
        const {isFavorited, eventID} = req.body;
        const inputData = { eventID, isFavorited, userID };
        const dbOutput = await db.toggleFavorite(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        if(data === null){
            status_code = 404;
            message =  "No Event Found";
        }
        
        res.status(status_code).json({
            message,
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}
const getCategories = async (req, res) => {
    try {
        const dbOutput = await db.getCategories();
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        if(data === null){
            status_code = 404;
            message =  "No Categories Found";
        }
        
        res.status(status_code).json({
            message,
            data
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}


module.exports = {
    getEvent,
    getEvents,
    toggleFavorite,
    getCategories
};