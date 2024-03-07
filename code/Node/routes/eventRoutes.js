"use strict";
const multer = require('multer');
const fs = require('fs');

module.exports = function (app) {
    const event = require("../controllers/eventController.js");

    const storage = multer.diskStorage({
        destination: (req, file, cb) => {
            const userdir = `./assets/images/${req.body.title}`;
            if (!fs.existsSync(userdir)) {
                fs.mkdirSync(userdir, { recursive: true });
            }
            cb(null, userdir);
        },
        filename: (req, file, cb) => {
            const name = `${req.body.title}.png`;
            cb(null, Date.now() + "-" + name);
        }
    });

    const upload = multer({
        storage: storage
    }).single("imageUrl");

    app.route("/event/all").get(event.getEvents);
    app.route("/event/:id").get(event.getEvent);
    app.route("/event/favorite").put(event.toggleFavorite);
    app.route("/categories").get(event.getCategories);
    app.route("/event/category/:category").get(event.getEventsOnCategories);
    app.route("/event/search").post(event.search);
    app.route("/event/delete").delete(event.deleteEvent);
    app.route("/event/addReview").post(event.addEventReview);
    app.route("/event/getReviews/:id").get(event.getReviews);
    app.route("/myEvents").get(event.getUserEvents);
    app.route("/events/location/:id").get(event.getLocationEvents);
    app.route("/group/events/:id").get(event.getGroupEvents);
    app.route("/event/exportList/:id").get(event.exportList);
    app.route("/events/attended").get(event.getAttendedEvents);
    app.route("/event/create").post(
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