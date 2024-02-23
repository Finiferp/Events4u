"use strict"

module.exports = function (app) {
    const event = require("../controllers/eventController.js");

    app.route("/event/all").get(event.getEvents);
    app.route("/event/:id").get(event.getEvent);
    app.route("/event/favorite").put(event.toggleFavorite);
    app.route("/categories").get(event.getCategories);
}