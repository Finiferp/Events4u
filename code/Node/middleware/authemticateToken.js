const jwt = require('jsonwebtoken');
const db = require("../DB");

async function authenticateToken(req, res, next) {
      const token = req.header('Authorization');
  
      if (!token) {
          return res.status(401).json({ error: 'No authorization provided. Expecting token!' });
      }
      try {
          const tokenExistsResult = await db.checkTokenExists(token);
          const { result } = JSON.parse(tokenExistsResult.outputJSON);
          if (!result) {
              return res.status(401).json({ error: 'Unauthorized: Invalid token' });
          }

          jwt.verify(token,'Events4USecretKey', (err, decoded) => {
              if (err) {
                  if (err.name === 'TokenExpiredError') {
                        //TODO delete TOKEN
                        return res.status(401).json({ error: 'Unauthorized: Token expired' });
                  } else {
                      return res.status(403).json({ error: 'Forbidden: Invalid token' });
                  }
              }
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