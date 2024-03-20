"use strict";
const crypto = require('crypto');
const jwt = require('jsonwebtoken');
const db = require("../DB");



const authenticateLuxID = async (req, res) => {
    try {

        // console.log(req.body);
        let formData = new URLSearchParams();
        formData.append('grant_type', 'authorization_code');
        formData.append('client_id', 'lam_bts_1');
        formData.append('code_verifier', req.body.verifier);
        formData.append('code', req.body.code);
        formData.append('redirect_uri', 'http://localhost:8081');



        const response = await fetch('https://login-uat.luxid.lu/mga/sps/oauth/oauth20/token', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: formData
        });

        const responseData = await response.json();

        const information = jwt.decode(responseData.id_token);
        if (information !== null) {
            const { given_name, family_name, email } = information;
            const password = given_name + family_name + email;

            const inputData = { 'email': email };
            const dbOutput = await db.checkIfUserExists(inputData);

            const { status_code, message } = JSON.parse(dbOutput.outputJSON);

            let login = false;

            if (status_code === 200) {
                login = true;
            } else if (status_code === 404) {
                login = false;
            }

            res.status(200).json({
                'firstName': given_name,
                'lastName': family_name,
                email,
                login,
                password
            });
        }


    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

const getCodeVerifier = async (req, res) => {
    try {
        const verifier = base64URLEncode(crypto.randomBytes(32));

        let challenge = await base64URLEncode(sha256(verifier));

        res.status(200).json({ verifier, challenge });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};

function base64URLEncode(str) {
    return str.toString('base64')
        .replace(/\+/g, '-')
        .replace(/\//g, '_')
        .replace(/=/g, '');
}

function sha256(buffer) {
    return crypto.createHash('sha256').update(buffer).digest();
}

module.exports = {
    authenticateLuxID,
    getCodeVerifier
};
