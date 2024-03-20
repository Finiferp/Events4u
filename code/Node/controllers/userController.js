"use strict";

const db = require("../DB");
const jwt = require("jsonwebtoken");
const crypto = require("crypto");

/**
 * Asynchronously creates a group using the data provided in the request body.
 *
 * @param {Object} req - the request object containing the group information
 * @param {Object} res - the response object used to send a response
 * @return {Promise<void>} Promise that resolves once the group is created or rejects on error
 */
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


/**
 * Retrieves groups data for a specific user from the database and sends it as a response.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {void} 
 */
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


/**
 * Updates a group in the database based on the provided request body data.
 *
 * @param {Object} req - The request object containing the data to update the group.
 * @param {Object} res - The response object to send back the result.
 * @return {Promise<void>} - No return value, updates the group in the database and sends a response.
 */
const updateGroup = async (req, res) => {
    try {
        const name = req.body.name;
        const groupID = parseInt(req.body.groupID);

        const inputData = { name, groupID };
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

/**
 * Retrieves a group by its ID from the database and sends the response.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise} - the response with the group data or an error message
 */
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


/**
 * Retrieves group users from the database based on the provided group ID.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise<void>} sends a JSON response with group users or an error message
 */
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


/**
 * Asynchronous function to retrieve users from the database and send the response.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @return {Promise} A promise that resolves to the JSON response
 */
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


/**
 * Asynchronous function to add a user to a group.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise} a Promise that resolves to the result of adding the user to the group
 */
const addUserToGroup = async (req, res) => {
    try {
        const groupID = parseInt(req.body.groupID);
        const userID = parseInt(req.body.userID);

        const inputData = { groupID, userID };

        const dbOutput = await db.addUserToGroup(inputData);

        let { status_code, message } = JSON.parse(dbOutput.outputJSON);
        //console.log(message);
        res.status(status_code).json({
            message
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}


/**
 * Deletes a user from a group.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise} - a Promise that resolves when the user is successfully removed from the group
 */
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


/**
 * Retrieves user groups based on the provided userID from the request body.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @return {Promise<void>} - Returns a promise that resolves when the function completes
 */
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


/**
 * Toggles a user's attendance status for a specific event.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise} Promise object representing the completion of the function
 */
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


/**
 * Function to toggle a user's interest in a specific event.
 *
 * @param {object} req - the request object containing userID, eventID, and isInterested
 * @param {object} res - the response object
 * @return {Promise} resolves with a JSON response containing a message
 */
const toggleAsInterested = async (req, res) => {
    try {
        const userID = parseInt(req.body.userID);
        const eventID = parseInt(req.body.eventID);
        const isInterested = parseInt(req.body.isInterested);

        const inputData = { userID, eventID, isInterested };

        const dbOutput = await db.toggleAsInterested(inputData);

        let { status_code, message } = JSON.parse(dbOutput.outputJSON);

        //console.log(message);
        res.status(status_code).json({
            message
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}


/**
 * Register a user with the provided information in the request body.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @return {Promise} Promise that resolves when the registration is complete
 */
const register = async (req, res) => {
    try {
        const firstName= req.body.firstName;
        const lastName = req.body.lastName;
        const email = req.body.email;
        const password = req.body.password;
        // Generate salt and hash password using the functions
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


/**
 * Function to handle user login.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Object} response with status and user details
 */
const login = async (req, res) => {
    try {
        const email = req.body.email;
        const password = req.body.password;
        // console.log(email, password);

        const inputDataSalt = { email };
        const dbSaltOutput = await db.getSalt(inputDataSalt);

        let { salt, userID } = JSON.parse(dbSaltOutput.outputJSON);

        // If no email, password, salt, or userID is found, return an error
        if(!email || !password || !salt || !userID) {
            return res.status(400).send('Missing required fields');
        } else {
            // Hash password using the salt
            const hashedPassword = hashPassword(password, salt);
            // Generate a jwt token
            const token = generateAuthToken(email, userID);
            const inputData = { email, password: hashedPassword, token };

            const dbOutput = await db.login(inputData);

            let { status_code, message, user, token_out } = JSON.parse(dbOutput.outputJSON);

            // console.log(message);
            // console.log(status_code);

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

/**
 * Asynchronous function to check the login status of the active user.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @return {Promise} A promise that resolves to the JSON response with the login status
 */
const checkLoginStatus = async (req, res) => {
    try {
        const activeUser = req.body.activeUser;

        let isLoggedIn;

        // If activeUser is -1, the user is not logged in else the user has a positive value which means the user is logged in
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

/**
 * Generate a salt using crypto.randomBytes and convert it to a hexadecimal string.
 *
 * @return {string} The generated salt as a hexadecimal string.
 */
function generateSalt(){
    return crypto.randomBytes(32).toString('hex');
}

/**
 * Generates a hashed password using the PBKDF2 algorithm with the provided salt.
 *
 * @param {string} password - The password to be hashed
 * @param {string} salt - The salt to be used in the hashing process
 * @return {string} The hashed password
 */
function hashPassword(password, salt){
    return crypto.pbkdf2Sync(password, salt, 1000, 128, 'sha512').toString('hex');
}

/**
 * Generate an authentication token based on the provided email and userID.
 *
 * @param {string} email - The email address of the user.
 * @param {string} userID - The ID of the user.
 * @return {string} The generated authentication token.
 */
function generateAuthToken(email, userID) {
    const payload = {
        email: email,
        userID: userID,
        exp: Math.floor(Date.now() / 1000) + 12 * 3600,
    };
    const token = jwt.sign(payload, 'Events4USecretKey');
 
    return token;
};

/**
 * Check the admin status based on the active user in the request body.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @return {Promise<void>} A Promise that resolves when the admin status is checked
 */
const checkAdminStatus = async (req, res) => {
    try {
        const activeUser = parseInt(req.body.activeUser);
        const inputData = { activeUser };

        const dbOutput = await db.checkAdminStatus(inputData);

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
 * Function to retrieve user favorites asynchronously.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise} Promise that resolves when favorites are retrieved
 */
const getUserFavorites = async (req, res) => {
    try {
        const userID = parseInt(req.body.userID);
        const inputData = { userID };
        const dbOutput = await db.getUserFavorites(inputData);
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
    checkLoginStatus,
    checkAdminStatus,
    getUserFavorites
};