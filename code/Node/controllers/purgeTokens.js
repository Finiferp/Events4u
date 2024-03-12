"use strict";
const cron = require('node-cron');
const db = require("../DB");
const jwt = require('jsonwebtoken');


const purgeTokens = async (app) => {
    cron.schedule('* 1 * * *', async () => {
        const dbOutput = await db.getTokens();
        const tokens = (JSON.parse(dbOutput.outputJSON)).data;
        tokens.forEach(token => {
            checkValidationToken(token.token,token.id);
        })
    }, {
        scheduled: true,
        timezone: 'Europe/Berlin'
    });
};

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
