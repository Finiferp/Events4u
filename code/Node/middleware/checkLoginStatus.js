const jwt = require('jsonwebtoken');
const db = require("../DB");

async function checkLoginStatus(req, res, next) {
      let activeUser = -1;    // -1 means not logged in
      const token = req.header(`Authorization`);
      if (token) {
            try {
                  const tokenExistsResult = await db.checkTokenExists(token);
                  const { result, id } = JSON.parse(tokenExistsResult.outputJSON);
                  if (result) {
                        jwt.verify(token, 'Events4USecretKey', (err, decoded) => {
                              if (err) {
                                    if (err.name === 'TokenExpiredError') {
                                          const inputData = { id };
                                          db.deleteToken(inputData);
                                    }
                              } else {
                                    const { userID } = decoded;
                                    activeUser = userID;
                              }
                        });
                  }
            } catch (error) {
                  console.error(error);
            }
      }
      req.body.activeUser = activeUser;
      next();
}

module.exports = checkLoginStatus;