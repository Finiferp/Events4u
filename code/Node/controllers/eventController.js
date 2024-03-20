"use strict";

const db = require("../DB");
const PDFDocument = require('pdfkit');
const fs = require('fs');
const mailer = require('./mailer');
const { parse } = require("path");
const { log } = require("console");


/**
 * Retrieves event data based on the provided id and active user, then returns the data or an error message.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise} JSON object with event data or error message
 */
const getEvent = async (req, res) => {
    try {
        const eventId = parseInt(req.params.id);
        const activeUser = parseInt(req.body.activeUser);
        // console.log(activeUser);
        const inputData = { eventId, activeUser };
        const dbOutput = await db.getEvent(inputData);
        // If the event doesn't exist, return an error message and redirect to the events page
        if (JSON.parse(dbOutput.outputJSON) === null) {
            let status_code = 404;
            let message = "Event no longer exists.";
            res.status(status_code).json({
                message,
                redirect: ("/events")
            });
        } else {
            let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
            res.status(status_code).json({
                message,
                data,
                activeUser
            });
        }

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

/**
 * Retrieves events based on the active user provided in the request body.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise<void>} JSON response containing events data or an error message
 */
const getEvents = async (req, res) => {
    try {
        const activeUser = parseInt(req.body.activeUser);
        const inputData = { activeUser };
        const dbOutput = await db.getEvents(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        // If no events are found, return an error message
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

/**
 * Toggles the favorite status of an event for a user and updates the database accordingly.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise<void>} - a promise that resolves when the function completes
 */
const toggleFavorite = async (req, res) => {
    try {
        const userID = parseInt(req.body.activeUser);
        const { isFavorited, eventID } = req.body;
        const inputData = { eventID, isFavorited, userID };
        const dbOutput = await db.toggleFavorite(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        // If the event doesn't exist, return an error message
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

/**
 * Retrieves categories from the database and sends a response with the appropriate status code and data.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {void} 
 */
const getCategories = async (req, res) => {
    try {
        const dbOutput = await db.getCategories();
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        // If no categories are found, return an error message
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

/**
 * Function to retrieve events based on the provided category.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise<void>} This function does not return a direct value but sends a JSON response.
 */
const getEventsOnCategories = async (req, res) => {
    try {
        const { category } = req.params;
        const activeUser = parseInt(req.body.activeUser);
        const inputData = { activeUser, category };
        const dbOutput = await db.getEventsOnCategories(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        // If no events are found for the provided category, return an error message
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

/**
 * Asynchronous function to search for events based on category and title, and handle the response accordingly.
 *
 * @param {object} req - The request object
 * @param {object} res - The response object
 * @return {Promise<void>} A promise that resolves when the search is complete
 */
const search = async (req, res) => {
    try {
        const { category, title } = req.body;
        const activeUser = parseInt(req.body.activeUser);
        const inputData = { activeUser, category, title };
        const dbOutput = await db.getEventsOnCategories(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        // If no events are found for the provided category, return an error message
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

/**
 * Asynchronously creates an event using the request body data and sends a response. 
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise<void>} a Promise that resolves when the event is created and the response is sent
 */
const create = async (req, res) => {
    try {
        const title = req.body.title;
        const startDateTime = req.body.startDateTime;
        const endDateTime = req.body.endDateTime;
        const price = parseInt(req.body.price);
        const location_FK = parseInt(req.body.location);
        const categories = req.body.categories;
        const group = parseInt(req.body.group);
        const ownerId = parseInt(req.body.userID); 
        // console.log(req.body);

        // Set the image path to be saved in the database
        const imageUrl = `http://192.168.129.237:3000/assets/images/${title}/` + req.file.filename;
        const inputData = { title, startDateTime, endDateTime, price, location_FK, categories, ownerId, imageUrl, group };
        // console.log(inputData);
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

/**
 * Update an event with the provided data.
 *
 * @param {Object} req - the request object containing event data
 * @param {Object} res - the response object to send the result
 * @return {Promise} a Promise that resolves with the result of the update
 */
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
        // If an image is uploaded, save the image path in the database else use the old image path
        if (req.file) {
            imageUrl = `http://192.168.129.237/assets/images/${title}/` + req.file.filename;
        } else {
            imageUrl = (req.body.oldImageUrl).toString();
        }
        const inputData = { eventID, title, startDateTime, endDateTime, price, location, categories, imageUrl, isVisible, group };
        const dbOutput = await db.updateEvent(inputData);
        let { status_code, message, updated_eventID } = JSON.parse(dbOutput.outputJSON);

        // send email to users who are attending the event
        mailer.updateEventMessage(updated_eventID);


        res.status(status_code).json({
            message
        });

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

/**
 * Asynchronously deletes an event based on the provided request and response objects.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise} a Promise that resolves to the result of the function
 */
const deleteEvent = async (req, res) => {
    try {
        const eventID = parseInt(req.body.eventID);
        const inputData = { eventID };
        const dbOutput = await db.deleteEvent(inputData);
        let { status_code, message } = JSON.parse(dbOutput.outputJSON);
        res.status(status_code).json({
            message
        });

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

/**
 * Asynchronously adds a review for an event.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise} a Promise that resolves to the response JSON
 */
const addEventReview = async (req, res) => {
    try {
        const eventID = parseInt(req.body.eventID);
        const userID = parseInt(req.body.userID);
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


/**
 * Asynchronous function to retrieve reviews, based on event ID, from the database and send the response.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @return {Promise} Promise that resolves to sending a JSON response
 */
const getReviews = async (req, res) => {
    try {
        const eventID = parseInt(req.params.id);

        const inputData = { eventID };
        const dbOutput = await db.getReviews(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);
        res.status(status_code).json({
            message,
            data
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};


/**
 * Retrieves user events based on the provided user ID from the request body.
 *
 * @param {Object} req - The request object containing the user ID.
 * @param {Object} res - The response object to send the retrieved user events.
 * @return {Promise} The retrieved user events based on the user ID.
 */
const getUserEvents = async (req, res) => {
    try {
        const userID = parseInt(req.body.userID);
        const inputData = { userID };

        const dbOutput = await db.getUserEvents(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

/**
 * Function to retrieve location events based on location ID and user ID.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise<void>} Promise that resolves when the function is done
 */
const getLocationEvents = async (req, res) => {
    try {
        const locationID = parseInt(req.params.id);
        const userID = parseInt(req.body.userID);
        const inputData = { locationID, userID };
        const dbOutput = await db.getLocationEvents(inputData);
        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        });

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};


/**
 * Retrieve group events for a specific group ID and user ID.
 *
 * @param {Object} req - The request object containing parameters.
 * @param {Object} res - The response object to send back.
 * @return {Promise} The response with status, message, and data.
 */
const getGroupEvents = async (req, res) => {
    try {
        const groupID = parseInt(req.params.id);
        const userID = parseInt(req.body.userID);

        const inputData = { groupID };

        const dbOutput = await db.getGroupEvents(inputData);

        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data,
            userID
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

/**
 * Function to export a list as a PDF based on the event ID.
 *
 * @param {Object} req - The request object containing the parameters.
 * @param {Object} res - The response object to send the PDF.
 * @return {Promise<void>} A Promise that resolves when the list is exported as a PDF.
 */
const exportList = async (req, res) => {
    try {
        // Create a new PDF document
        const doc = new PDFDocument();

        const eventID = parseInt(req.params.id);
        const inputData = { eventID };
        const dbOutput = await db.getList(inputData);

        let { status_code, message, attending_users, interested_users } = JSON.parse(dbOutput.outputJSON);

        // Set the headers
        res.setHeader('Content-Type', 'application/pdf');
        res.setHeader('Content-Disposition', 'attachment; filename="exportList.pdf"');

        // Pipe the PDF document to the response
        doc.pipe(res);


        // Add the title to the document
        doc.fontSize(20).text('Interested Users:', { align: 'center' });
        doc.moveDown();

        // Add the list of interested users to the document if there are any
        if (interested_users.interested_users === null) {
            doc.fontSize(12).text('No interested users');
        } else {
            interested_users.interested_users.forEach(name => {
                doc.fontSize(12).text(name.name);
            });
        }

        doc.moveDown();

        // Add the title to the document
        doc.fontSize(20).text('Attending Users:', { align: 'center' });
        doc.moveDown();

        // Add the list of attending users to the document if there are any
        if (attending_users.attending_users === null) {
            doc.fontSize(12).text('No attending users');
        } else {
            attending_users.attending_users.forEach(name => {
                doc.fontSize(12).text(name.name);
            });
        }
        
        // End the PDF document
        doc.end();
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};


/**
 * Asynchronous function to handle retrieving attended events for a user.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise<void>} Promise that resolves once the function is completed
 */
const getAttendedEvents = async (req, res) => {
    try {
        const userID = parseInt(req.body.userID);

        const inputData = { userID };

        const dbOutput = await db.getAttendedEvents(inputData);

        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};



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
    getLocationEvents,
    getGroupEvents,
    exportList,
    getAttendedEvents
};