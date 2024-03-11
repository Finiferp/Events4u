"use strict";
const cron = require('node-cron');
const nodemailer = require('nodemailer');
const db = require("../DB");


const transporter = nodemailer.createTransport({
    host: 'david-nerdspace.net',

    port: 465,
    auth: {
        user: 'event4u@david-nerdspace.net',
        pass: 'gdi52&3wV8C_'

    }
});

const startCron = async (app) => {
    cron.schedule('* 1 * * *', async () => {
        const dbOutput = await db.getReminders();
        const events = (JSON.parse(dbOutput.outputJSON)).events;
        console.log("cron");
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
                    console.log(`sending mail to ${user.name}`);
                    transporter.sendMail(mailOptions);
                });
            }
        });
    }, {
        scheduled: true,
        timezone: 'Europe/Berlin'
    });
};


const updateEventMessage = async (eventID) => {
    const inputData = { eventID };

    const dbOutput = await db.updateMailer(inputData);

    const { events } = JSON.parse(dbOutput.outputJSON);

    events.forEach(event => {
        if (event.attending_users !== null) {
            event.attending_users.forEach(user => {
                console.log(user);
                let mailOptions = {
                    from: 'event4u@david-nerdspace.net',
                    to: user.email,
                    subject: 'Update warning.',
                    text: `Dear ${user.name},\n\nWe would like to inform you that the event ${event.event_name} was edited. Please check the event page for the latest information.`
                };
                console.log(`sending mail to ${user.name}`);
                transporter.sendMail(mailOptions);
            });
        }
    });
};

module.exports = {
    updateEventMessage,
    startCron
};
