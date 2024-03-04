"use strict";

module.exports = function (app) {
    const user = require("../controllers/userController.js");

    app.route("/group/create").post(user.createGroup);
    app.route("/myGroups").get(user.getGroups);
    app.route("/group/update").post(user.updateGroup);
    app.route("/group/:id").get(user.getGroup);
    app.route("/group/users/:id").get(user.getGroupUsers);
    app.route("/users").get(user.getUsers);
    app.route("/group/user/add").post(user.addUserToGroup);
    app.route("/group/user/delete").delete(user.deleteUserFromGroup);

}