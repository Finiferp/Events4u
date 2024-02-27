"use strict";


module.exports = function (app) {
    const location = require("../controllers/locationController.js");

    app.route("/location/all").get(location.getLocations);
    app.route("/location/add").post(location.addLocation);

};