"use strict";
const cron = require('node-cron');
const nodemailer = require('nodemailer');
const db = require("../DB");

module.exports = function (app) {

    const transporter = nodemailer.createTransport({
        host: 'david-nerdspace.net',

        port: 465,
        auth: {
            user: 'event4u@david-nerdspace.net',
            pass: 'gdi52&3wV8C_'

        }
    });


    cron.schedule('* 1 * * *', async () => {
        const dbOutput = await db.getReminders();
        const events = (JSON.parse(dbOutput.outputJSON)).events;
        events.forEach(event => {
            if (event.attending_users !== null) {
                event.attending_users.forEach(user => {
                    console.log(user);
                    let mailOptions = {
                        from: 'event4u@david-nerdspace.net',
                        to: user.email,
                        subject: 'Reminder',
                        text: `Dear ${user.name},\n\nWe would like to remind you that you are going to the event ${event.event_name} tomorrow.`
                    };
                    console.log("sending mail");
                    transporter.sendMail(mailOptions);
                    
                })
            }
        });
    }, {
        scheduled: true,
        timezone: 'Europe/Berlin'
    });
};