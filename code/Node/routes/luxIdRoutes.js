"use strict";


/**
 * Exports a function that sets up routes for LuxID-related endpoints.
 *
 * @param {Object} app - The Express application object
 * @return {void}
 */
module.exports = function (app) {
    const luxId = require("../controllers/luxIdController.js");

    app.route("/luxId/authenticate").post(luxId.authenticateLuxID);
    app.route("/luxId/codeVerifier").get(luxId.getCodeVerifier);

};