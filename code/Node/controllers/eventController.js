"use strict";

const db = require("../DB");

const getEvent = async (req, res) => {
    try {
        const eventId = parseInt(req.params.id);
        const activeUser = 1; //TODO IF NO ONE LOGGED IN SET TO -1

        const inputData = { eventId, activeUser };
        const dbOutput = await db.getEvent(inputData);
        if (JSON.parse(dbOutput.outputJSON) === null) {
            let status_code = 404;
            let message = "Event no longer exists.";
            res.status(status_code).json({
                message,
                redirect: ("/events")           // TODO MAYBE change to full url and not localhost
            });
        } else {
            let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
            res.status(status_code).json({
                message,
                data: data,
            });
        }

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

const getEvents = async (req, res) => {
    try {
        const activeUser = 1; //TODO IF NO ONE LOGGED IN SET TO -1
        const inputData = { activeUser };
        const dbOutput = await db.getEvents(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        if (data === null) {
            status_code = 404;
            message = "No Events Found";
        }

        res.status(status_code).json({
            message,
            data: data,
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

const toggleFavorite = async (req, res) => {
    try {
        const userID = 1; //TODO IF NOT LOGGED IN REDIRECT TO LOGIN PAGE
        const { isFavorited, eventID } = req.body;
        const inputData = { eventID, isFavorited, userID };
        const dbOutput = await db.toggleFavorite(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        if (data === null) {
            status_code = 404;
            message = "No Event Found";
        }

        res.status(status_code).json({
            message,
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};
const getCategories = async (req, res) => {
    try {
        const dbOutput = await db.getCategories();
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        if (data === null) {
            status_code = 404;
            message = "No Categories Found";
        }

        res.status(status_code).json({
            message,
            data
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

const getEventsOnCategories = async (req, res) => {
    try {
        const { category } = req.params;
        const activeUser = 1; //TODO IF NO ONE LOGGED IN SET TO -1
        const inputData = { activeUser, category };
        const dbOutput = await db.getEventsOnCategories(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        if (data === null) {
            status_code = 404;
            message = "No Event for this Category Found";
        }
        res.status(status_code).json({
            message,
            data
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};
const search = async (req, res) => {
    try {
        const { category, title } = req.body;
        const activeUser = 1; //TODO IF NO ONE LOGGED IN SET TO -1
        const inputData = { activeUser, category, title };
        const dbOutput = await db.getEventsOnCategories(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        if (data === null) {
            status_code = 404;
            message = "No Event for this Category Found";
        }
        res.status(status_code).json({
            message,
            data
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

const create = async (req, res) => {
    try {
        //const {title, startDateTime, endDateTime, parseInt(price), location, categories } = req.body;
        const title = req.body.title;
        const startDateTime = req.body.startDateTime;
        const endDateTime = req.body.endDateTime;
        const price = parseInt(req.body.price);
        const location_FK = parseInt(req.body.location);
        const categories = req.body.categories;
        const group = parseInt(req.body.group);

        const ownerId = 1; //TODO IF NO ONE LOGGED IN SET TO -1 
        const imageUrl = `http://127.0.0.1:3000/assets/images/${title}/` + req.file.filename;
        const inputData = { title, startDateTime, endDateTime, price, location_FK, categories, ownerId, imageUrl, group };
        const dbOutput = await db.createEvent(inputData);
        let { status_code, message } = JSON.parse(dbOutput.outputJSON);
        // console.log(message);
        res.status(status_code).json({
            message
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

const updateEvent = async (req, res) => {
    try {
        const eventID = parseInt(req.body.eventID);
        const title = (req.body.title).toString();
        const startDateTime = (req.body.startDateTime).toString();
        const endDateTime = (req.body.endDateTime).toString();
        const price = parseInt(req.body.price);
        const location = parseInt(req.body.location);
        const categories = (req.body.categories).toString();
        const isVisible = parseInt(req.body.isVisible);
        const group = parseInt(req.body.group);
        let imageUrl;
        if (req.file) {
            imageUrl = `http://127.0.0.1:3000/assets/images/${title}/` + req.file.filename;
        } else {
            imageUrl = (req.body.oldImageUrl).toString();
        }
        const inputData = { eventID, title, startDateTime, endDateTime, price, location, categories, imageUrl, isVisible, group };
        const dbOutput = await db.updateEvent(inputData);
        let { status_code, message } = JSON.parse(dbOutput.outputJSON);
        res.status(status_code).json({
            message
        });

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

const deleteEvent = async (req, res) => {
    try {
        const eventID = parseInt(req.body.eventID);
        const inputData = { eventID };
        const dbOutput = await db.deleteEvent(inputData);
        console.log(inputData);
        let { status_code, message } = JSON.parse(dbOutput.outputJSON);
        console.log(message);
        res.status(status_code).json({
            message
        });

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

const addEventReview = async (req, res) => {
    try {
        const eventID = parseInt(req.body.eventID);
        const userID = 1; //TODO Change when LUXID
        const review = req.body.review;
        const stars = parseInt(req.body.stars);
        const date = req.body.date;

        const inputData = { stars, review, date, eventID, userID };

        const dbOutput = await db.addEventReview(inputData);
        let { status_code, message } = JSON.parse(dbOutput.outputJSON);
        res.status(status_code).json({
            message
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

const getReviews = async (req, res) => {
    try {
        const eventID = parseInt(req.params.id);

        const inputData = { eventID };
        const dbOutput = await db.getReviews(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        res.status(status_code).json({
            message,
            data
        })
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

const getUserEvents = async (req, res) => {
    try {
        const userID = 1; //TODO Change when LUXID

        const inputData = { userID };

        const dbOutput = await db.getUserEvents(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        })
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

const getLocationEvents = async (req, res) => {
    try {
        const locationID = parseInt(req.params.id);
        const userID = 1 //TODO Change when LUXID
        const inputData = { locationID, userID };
        console.log(inputData);
        const dbOutput = await db.getLocationEvents(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        })
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

module.exports = {
    getEvent,
    getEvents,
    toggleFavorite,
    getCategories,
    getEventsOnCategories,
    search,
    create,
    updateEvent,
    deleteEvent,
    addEventReview,
    getReviews,
    getUserEvents,
    getLocationEvents
};