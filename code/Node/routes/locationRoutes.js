"use strict";


/**
 * Exports a function that sets up routes for location-related endpoints.
 *
 * @param {Object} app - The Express application object
 * @return {void}
 */
module.exports = function (app) {
    const location = require("../controllers/locationController.js");

    app.route("/location/all").get(location.getLocations);
    app.route("/location/add").post(location.addLocation);

};