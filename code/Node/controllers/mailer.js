"use strict";
const cron = require('node-cron');
const nodemailer = require('nodemailer');
const db = require("../DB");

// Configuration of the email transport
const transporter = nodemailer.createTransport({
    host: 'david-nerdspace.net',

    port: 465,
    auth: {
        user: 'event4u@david-nerdspace.net',
        pass: 'gdi52&3wV8C_'

    }
});


/**
 * Starts a cron job that sends reminders to attending users for upcoming events.
 *
 * @param {Object} app - the application object
 * @return {Promise<void>} A promise that resolves when the cron job is started
 */
const startCron = async (app) => {
    console.log("Cron started");

    // Sends reminders at 1am every day for upcoming events
    cron.schedule('* 1 * * *', async () => {
        const dbOutput = await db.getReminders();
        const events = (JSON.parse(dbOutput.outputJSON)).events;
        events.forEach(event => {
            // check if the event is attended by the users, if so send a reminder to the user, 1 day before the event
            if (event.attending_users !== null) {
                event.attending_users.forEach(user => {
                    let mailOptions = {
                        from: 'event4u@david-nerdspace.net',
                        to: user.email,
                        subject: 'Reminder',
                        html: `<p>Dear ${user.name},</p>
                        <p>We would like to remind you that you are going to the event <a href="http://192.168.131.123:8080/event/${event.event_code}">${event.event_name}</a> tomorrow.</p>
                        <p>This is an automated message. Please do not reply.</p>
                        <p>Thank you.</p>`,
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

/**
 * Sends an email if an event got updated to attending users when the event is edited.
 *
 * @param {string} eventID - The ID of the event to update
 * @return {Promise<void>} This function does not return anything explicitly
 */
const updateEventMessage = async (eventID) => {
    const inputData = { eventID };

    const dbOutput = await db.updateMailer(inputData);

    const { events } = JSON.parse(dbOutput.outputJSON);

    events.forEach(event => {
        console.log(event.event_code);
        // check if the event is attended by the users, if so send a mail to the user that the event was updated
        if (event.attending_users !== null) {
            event.attending_users.forEach(user => {
                let mailOptions = {
                    from: 'event4u@david-nerdspace.net',
                    to: user.email,
                    subject: 'Update warning.',
                    html: `
                    <p>Dear ${user.name},</p>
                    <p>We would like to inform you that the event <a href="http://192.168.131.123:8080/event/${event.event_code}">${event.event_name}</a> was edited. Please check the event page for the latest information.</p>
                    <p>This is an automated message. Please do not reply.</p>
                    <p>Thank you.</p>`
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
