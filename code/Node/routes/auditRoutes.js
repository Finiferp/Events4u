"use strict";

module.exports = (app) => {
    const audit = require("../controllers/auditController.js");

    app.route("/audit/belongs").get(audit.getBelongsAudit);
    app.route("/audit/category").get(audit.getCategoryAudit);
    app.route("/audit/event").get(audit.getEventAudit);
    app.route("/audit/favorite").get(audit.getFavoriteAudit);
    app.route("/audit/group").get(audit.getGroupAudit);
    app.route("/audit/location").get(audit.getLocationAudit);
    app.route("/audit/partOf").get(audit.getPartOfAudit);
    app.route("/audit/review").get(audit.getReviewAudit);
    app.route("/audit/user").get(audit.getUserAudit);
    app.route("/audit/view").get(audit.getViewAudit);
}