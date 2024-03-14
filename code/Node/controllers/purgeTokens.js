"use strict";
const cron = require('node-cron');
const db = require("../DB");
const jwt = require('jsonwebtoken');


/**
 * Purges tokens periodically from the database.
 *
 * @param {Object} app - The application object.
 * @return {Promise<void>} A Promise that resolves when the tokens are purged.
 */
const purgeTokens = async (app) => {
    // Purges tokens at 1am every day
    cron.schedule('* 1 * * *', async () => {
        const dbOutput = await db.getTokens();
        const tokens = (JSON.parse(dbOutput.outputJSON)).data;
        tokens.forEach(token => {
            // check if token is valid if not it is deleted
            checkValidationToken(token.token,token.id);
        })
    }, {
        scheduled: true,
        timezone: 'Europe/Berlin'
    });
};

/**
 * Verify validation token and delete token if expired.
 *
 * @param {string} token - The validation token to be verified.
 * @param {string} id - The id associated with the token.
 */
function checkValidationToken(token, id) {
    jwt.verify(token, 'Events4USecretKey', (err, decoded) => {
        if (err) {
            if (err.name === 'TokenExpiredError') {
                const inputData = { id };
                db.deleteToken(inputData);
            }
        }
    });
}

module.exports = {
    purgeTokens
};
