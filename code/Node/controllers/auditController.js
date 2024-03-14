"use strict";

const db = require("../DBAudit");

/**
 * Asynchronous function to retrieve belongs audit information from the database and send the response.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @return {Promise<void>} Promise that resolves with the retrieval and sending of audit information
 */
const getBelongsAudit = async (req, res) => {
    try {
        const dbOutput = await db.getBelongsAudit();

        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
} 


/**
 * Retrieves category audit information from the database and sends it as a response.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise<void>} - a Promise that resolves once the response is sent
 */
const getCategoryAudit = async (req, res) => {
    try {
        const dbOutput = await db.getCategoryAudit();

        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

/**
 * Retrieves event audit information from the database and sends a JSON response.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @return {Promise<void>} - A promise that resolves after sending the JSON response
 */
const getEventAudit = async (req, res) => {
    try {
        const dbOutput = await db.getEventAudit();

        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

/**
 * Retrieves the favorite audit from the database and sends it as a JSON response.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @return {Promise<void>} A promise that resolves when the favorite audit is successfully retrieved and sent as a JSON response
 */
const getFavoriteAudit = async (req, res) => {
    try {
        const dbOutput = await db.getFavoriteAudit();

        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}


/**
 * Retrieves the group audit from the database and sends it as a response.
 *
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 * @return {Object} The group audit data as a JSON response.
 */
const getGroupAudit = async (req, res) => {
    try {
        const dbOutput = await db.getGroupAudit();

        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        });

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}


/**
 * Retrieves location audit information from the database and sends it as a JSON response.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @return {Promise<void>} Sends a JSON response with location audit information or an error message
 */
const getLocationAudit = async (req, res) => {
    try {
        const dbOutput = await db.getLocationAudit();

        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        });

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

/**
 * Retrieves a part of the audit from the database and sends it as a JSON response.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @return {Promise<void>} Promise that resolves when the response is sent
 */
const getPartOfAudit = async (req, res) => {
    try {
        const dbOutput = await db.getPartOfAudit();

        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        });

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

/**
 * Asynchronous function to retrieve review audit data from the database and send it as a JSON response.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise<void>} - returns a promise that resolves when the response is sent
 */
const getReviewAudit = async (req, res) => {
    try {
        const dbOutput = await db.getReviewAudit();

        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        });

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

/**
 * Retrieves user audit information from the database and sends it as a JSON response.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @return {Promise<void>} Promise that resolves when the function completes
 */
const getUserAudit = async (req, res) => {
    try {
        const dbOutput = await db.getUserAudit();

        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        });

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

/**
 * Retrieve interested audit information from the database and send it as a JSON response.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @return {Promise<void>} - A Promise that resolves when the function completes
 */
const getInterestedAudit = async (req, res) => {
    try {
        const dbOutput = await db.getInterestedAudit();

        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message,
            data
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}


/**
 * Asynchronous function to retrieve attendance audit data from the database and send it as a JSON response.
 *
 * @param {Object} req - Express request object
 * @param {Object} res - Express response object
 * @return {Promise<void>} Promise that resolves when the data is sent as a response or rejects if an error occurs
 */
const getAttendsAudit = async (req, res) => {
    try {
        const dbOutput = await db.getAttendsAudit();

        let { status_code, message, data } = JSON.parse(dbOutput.outputJSON);

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
    getBelongsAudit,
    getCategoryAudit,
    getEventAudit,
    getFavoriteAudit,
    getGroupAudit,
    getLocationAudit,
    getPartOfAudit,
    getReviewAudit,
    getUserAudit,
    getInterestedAudit,
    getAttendsAudit
}