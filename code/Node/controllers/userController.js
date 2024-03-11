"use strict";

const db = require("../DB");
const jwt = require("jsonwebtoken");
const crypto = require("crypto");

const createGroup = async (req, res) => {
    try {
        const name = req.body.name;
        const userID = parseInt(req.body.userID);
        
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
        const userID = parseInt(req.body.userID);

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
        const userID = parseInt(req.body.userID);

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

const toggleAsAttending = async (req, res) => {
    try {
        const userID = parseInt(req.body.userID);
        const eventID = parseInt(req.body.eventID);
        const isAttending = parseInt(req.body.isAttending);

        const inputData = { userID, eventID, isAttending };

        const dbOutput = await db.toggleAsAttending(inputData);

        let { status_code, message } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

const toggleAsInterested = async (req, res) => {
    try {
        const userID = parseInt(req.body.userID);
        const eventID = parseInt(req.body.eventID);
        const isInterested = parseInt(req.body.isInterested);

        const inputData = { userID, eventID, isInterested };

        const dbOutput = await db.toggleAsInterested(inputData);

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

const register = async (req, res) => {
    try {
        const firstName= req.body.firstName;
        const lastName = req.body.lastName;
        const email = req.body.email;
        const password = req.body.password;
        const salt = generateSalt();
        const hashedPassword = hashPassword(password, salt);

        const inputData = { firstName, lastName, email, password: hashedPassword, salt };

        const dbOutput = await db.register(inputData);

        let { status_code, message } = JSON.parse(dbOutput.outputJSON);

        res.status(status_code).json({
            message
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

const login = async (req, res) => {
    try {
        const email = req.body.email;
        const password = req.body.password;

        const inputDataSalt = { email };
        const dbSaltOutput = await db.getSalt(inputDataSalt);

        let { salt, userID } = JSON.parse(dbSaltOutput.outputJSON);

        if(!email || !password || !salt || !userID) {
            return res.status(400).send('Missing required fields');
        } else {
            const hashedPassword = hashPassword(password, salt);
            const token = generateAuthToken(email, userID);
            const inputData = { email, password: hashedPassword, token };

            const dbOutput = await db.login(inputData);

            let { status_code, message, user, token_out } = JSON.parse(dbOutput.outputJSON);

            res.status(status_code).json({
                message,
                user,
                token: token_out
            })
        }
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

const checkLoginStatus = async (req, res) => {
    try {
        const activeUser = req.body.activeUser;

        let isLoggedIn;

        if(activeUser !== -1) {
            isLoggedIn = true;
        } else {
            isLoggedIn = false;
        }

        res.status(200).json({
            isLoggedIn
        })

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

function generateSalt(){
    return crypto.randomBytes(32).toString('hex');
}

function hashPassword(password, salt){
    return crypto.pbkdf2Sync(password, salt, 1000, 128, 'sha512').toString('hex');
}

function generateAuthToken(email, userID) {
    const payload = {
        email: email,
        userID: userID,
        exp: Math.floor(Date.now() / 1000) + 12 * 3600,
    };
    const token = jwt.sign(payload, 'Events4USecretKey');
 
    return token;
};


module.exports = {
    createGroup,
    getGroups,
    updateGroup,
    getGroup,
    getGroupUsers,
    getUsers,
    addUserToGroup,
    deleteUserFromGroup,
    getUsersGroups,
    toggleAsAttending,
    toggleAsInterested,
    register,
    login,
    checkLoginStatus
};