const jwt = require('jsonwebtoken');
const db = require("../DB");

/**
 * Authenticates the token provided in the request headers. Only if the token is valid, the next function is called.
 *
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 * @param {Function} next - The next function to call
 * @return {Promise} A Promise that resolves when authentication is successful
 */
async function authenticateToken(req, res, next) {
      const token = req.header('Authorization');
  
      // If no token is provided, return an error
      if (!token) {
          return res.status(401).json({ error: 'No authorization provided. Expecting token!' });
      }
      try {
          const tokenExistsResult = await db.checkTokenExists(token);
          const { result, id } = JSON.parse(tokenExistsResult.outputJSON);
          // If token does not exist, return an error
          if (!result) {
              return res.status(401).json({ error: 'Unauthorized: Invalid token' });
          }

          jwt.verify(token,'Events4USecretKey', (err, decoded) => {
              // If token is invalid, return an error
              if (err) {
                // If token is expired, delete the token and return an error else return an error that the token is invalid
                  if (err.name === 'TokenExpiredError') {
                        const inputData = { id };
                        db.deleteToken(inputData);
                        return res.status(401).json({ error: 'Unauthorized: Token expired' });
                  } else {
                      return res.status(403).json({ error: 'Forbidden: Invalid token' });
                  }
              }

              // If token is valid, append the user ID to the request body and call the next function
              const { userID } = decoded;
              req.body.userID = userID;
              next();
          });
      } catch (error) {
          console.error(error);
          return res.status(500).json({ error: 'Internal Server Error' });
      }
  }
  
  module.exports = authenticateToken;