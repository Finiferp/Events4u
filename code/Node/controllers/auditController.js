"use strict";

const db = require("../DBAudit");

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

const getViewAudit = async (req, res) => {
    try {
        const dbOutput = await db.getViewAudit();

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
    getViewAudit
}