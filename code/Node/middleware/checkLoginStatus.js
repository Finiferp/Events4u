const jwt = require('jsonwebtoken');
const db = require("../DB");

/**
 * Check the login status of the user based on the provided token. The user still has access to the website
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @param {Function} next - The next middleware function
 */
async function checkLoginStatus(req, res, next) {
      let activeUser = -1;    // -1 means not logged in
      const token = req.header(`Authorization`);
      // If no token is provided, activeUser remains -1
      if (token) {
            try {
                  const tokenExistsResult = await db.checkTokenExists(token);
                  const { result, id } = JSON.parse(tokenExistsResult.outputJSON);
                  // If token exists, verify the token
                  // if (result) {
                  jwt.verify(token, 'Events4USecretKey', (err, decoded) => {
                        // If token is invalid, delete the token else set activeUser to the userID
                        if (err) {
                              if (err.name === 'TokenExpiredError') {
                                    const inputData = { id };
                                    db.deleteToken(inputData);
                              } else {

                              }
                        } else {
                              const { userID } = decoded;
                              activeUser = userID;
                        }
                  });
                  // }
            } catch (error) {
                  console.error(error);
            }
      }
      // append activeUser to the request body and call the next function
      if (activeUser === -1) {
            try {
                  if (token !== null) {
                        const information = jwt.decode(token);
                        const sub = information.sub;
                        const inputData = { sub };
                        const dbOutput = await db.checkIfLuxIdExists(inputData);
                        const { userId } = JSON.parse(dbOutput.outputJSON).data;
                        activeUser = userId;
                  }
            } catch (error) {
                  console.error(error);
            }
      }

      req.body.activeUser = activeUser;
      next();
}

module.exports = checkLoginStatus;