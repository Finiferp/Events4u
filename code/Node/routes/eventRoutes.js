"use strict";
const multer = require('multer');
const fs = require('fs');

/**
 * Initializes routes for handling events and related functionalities.
 *
 * @param {Object} app - The Express application object
 * @return {void}
 */
module.exports = function (app) {
    const event = require("../controllers/eventController.js");
    // import of middlewares
    const authenticateToken = require("../middleware/authemticateToken.js");
    const checkLoginStatus = require("../middleware/checkLoginStatus.js");

    // configuration of multer
    const storage = multer.diskStorage({
        destination: (req, file, cb) => {
            // create directory if it doesn't exist
            const userdir = `./assets/images/${req.body.title}`;
            if (!fs.existsSync(userdir)) {
                fs.mkdirSync(userdir, { recursive: true });
            }
            cb(null, userdir);
        },
        // generate a unique filename
        filename: (req, file, cb) => {
            const name = `${req.body.title}.png`;
            cb(null, Date.now() + "-" + name);
        }
    });

    // multer middleware
    const upload = multer({
        storage: storage
    }).single("imageUrl");

    app.route("/event/all").get(checkLoginStatus, event.getEvents);
    app.route("/event/:id").get(checkLoginStatus, event.getEvent);
    app.route("/event/favorite").put(checkLoginStatus, event.toggleFavorite);
    app.route("/categories").get(event.getCategories);
    app.route("/event/category/:category").get(checkLoginStatus, event.getEventsOnCategories);
    app.route("/event/search").post(checkLoginStatus, event.search);
    app.route("/event/delete").delete(event.deleteEvent);
    app.route("/event/addReview").post(authenticateToken, event.addEventReview);
    app.route("/event/getReviews/:id").get(event.getReviews);
    app.route("/myEvents").get(authenticateToken, event.getUserEvents);
    app.route("/events/location/:id").get(authenticateToken, event.getLocationEvents);
    app.route("/group/events/:id").get(authenticateToken, event.getGroupEvents);
    app.route("/event/exportList/:id").get(event.exportList);
    app.route("/events/attended").get(authenticateToken, event.getAttendedEvents);
    app.route("/event/create").post(authenticateToken,
        // multer middleware
        (req, res, next) => {
            upload(req, res, (err) => {
                if (err) {
                    console.log(err);
                    res.status(500).json({ error: "File upload failed" });
                    return;
                }
                next();
            });
        },
        event.create);
    app.route("/event/update").post(
        // multer middleware
        (req, res, next) => {
            upload(req, res, (err) => {
                if (err) {
                    console.log(err);
                    res.status(500).json({ error: "File upload failed" });
                    return;
                }
                next();
            });
        },
        event.updateEvent);

};