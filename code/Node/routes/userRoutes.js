"use strict";

module.exports = function (app) {
    const user = require("../controllers/userController.js");
    const authenticateToken = require("../middleware/authemticateToken.js");
    const checkLoginStatus = require("../middleware/checkLoginStatus.js");

    app.route("/group/create").post(authenticateToken, user.createGroup);
    app.route("/myGroups").get(authenticateToken, user.getGroups);
    app.route("/group/update").post(user.updateGroup);
    app.route("/group/:id").get(authenticateToken, user.getGroup);
    app.route("/group/users/:id").get(user.getGroupUsers);
    app.route("/users").get(user.getUsers);
    app.route("/group/user/add").post(user.addUserToGroup);
    app.route("/group/user/delete").delete(user.deleteUserFromGroup);
    app.route("/event/interested").put(authenticateToken, user.toggleAsInterested);
    app.route("/event/attending").put(authenticateToken, user.toggleAsAttending);
    app.route("/user/register").post(user.register);
    app.route("/user/login").post(user.login);
    app.route("/user/loginStatus").get(checkLoginStatus, user.checkLoginStatus);
    app.route("/user/adminStatus").get(checkLoginStatus, user.checkAdminStatus);
};