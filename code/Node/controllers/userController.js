"use strict";

const db = require("../DB");

const createGroup = async (req, res) => {
    try {
        const name = req.body.name;
        const userID = 1; //TODO Change when LUXID
        
        const inputData = { name, userID };

        const dbOutput = await db.createGroup(inputData);
        let { status_code, message } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message
        })
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

const getGroups = async (req, res) => {
    try {
        const userID = 1; //TODO Change when LUXID

        const inputData = { userID };

        const dbOutput = await db.getGroups(inputData);

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

const updateGroup = async (req, res) => {
    try {
        const name = req.body.name;
        const groupID = parseInt(req.body.groupID);

        const inputData = { name, groupID };
        console.log(inputData);
        const dbOutput = await db.updateGroup(inputData);
        let { status_code, message } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message
        })
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

const getGroup = async (req, res) => {
    try {
        const groupID = parseInt(req.params.id);

        const inputData = { groupID };

        const dbOutput = await db.getGroup(inputData);

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

const getGroupUsers = async (req, res) => {
    try {
        const groupID = parseInt(req.params.id);

        const inputData = { groupID };

        const dbOutput = await db.getGroupUsers(inputData);

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

const getUsers = async (req, res) => {
    try {
        const dbOutput = await db.getUsers();

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

const addUserToGroup = async (req, res) => {
    try {
        const groupID = parseInt(req.body.groupID);
        const userID = parseInt(req.body.userID);

        const inputData = { groupID, userID };

        const dbOutput = await db.addUserToGroup(inputData);

        let { status_code, message } = JSON.parse(dbOutput.outputJSON);
        console.log(message);
        res.status(status_code).json({
            message
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

const deleteUserFromGroup = async (req, res) => {
    try {
        const groupID = parseInt(req.body.groupID);
        const userID = parseInt(req.body.userID);

        const inputData = { groupID, userID };

        const dbOutput = await db.removeUserFromGroup(inputData);

        let { status_code, message } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message
        })
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

const getUsersGroups = async (req, res) => {
    try {
        const userID = 1; //TODO Change when LUXID

        const inputData = { userID };

        const dbOutput = await db.getUsersGroups(inputData);

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
    createGroup,
    getGroups,
    updateGroup,
    getGroup,
    getGroupUsers,
    getUsers,
    addUserToGroup,
    deleteUserFromGroup,
    getUsersGroups
};