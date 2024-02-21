"use strict"

module.exports = function (app) {
    const event = require("../controllers/eventController.js");

    app.route("/event/create").post(event.createAsset);
}