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
        //   if (!result) {
        //       return res.status(401).json({ error: 'Unauthorized: Invalid token' });
        //   }

        jwt.verify(token, 'Events4USecretKey', async (err, decoded) => {
            // If token is invalid, return an error
            if (err) {
                // If token is expired, delete the token and return an error else return an error that the token is invalid
                if (err.name === 'TokenExpiredError') {
                    const inputData = { id };
                    console.log(inputData);
                    db.deleteToken(inputData);
                    return res.status(401).json({ error: 'Unauthorized: Token expired' });
                } else {
                    try {
                        const information = jwt.decode(token);
                        const sub = information.sub;
                        const inputData = { sub };
                        const dbOutput = await db.checkIfLuxIdExists(inputData);
                        const { userId, exists } = JSON.parse(dbOutput.outputJSON).data;

                        if (exists === "true") {
                            req.body.userID = userId;
                        } else {
                            const { given_name, family_name, email } = information;
                            console.log(given_name, family_name, email, sub);
                            const inputData2 = { "firstName": given_name, "lastName": family_name, email, sub };
                            const dbOutput2 = await db.addUserAndMapping(inputData2);
                            const { userId } = JSON.parse(dbOutput2.outputJSON).data;
                            req.body.userID = userId;
                        }

                    } catch (error) {
                        console.error(error);
                        return res.status(403).json({ error: 'Forbidden: Invalid token' });
                    }

                }
            } else {
                // If token is valid, append the user ID to the request body and call the next function
                const { userID } = decoded;
                req.body.userID = userID;
            }
            next();

        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
}

module.exports = authenticateToken;