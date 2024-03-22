"use strict";
const crypto = require('crypto');
const jwt = require('jsonwebtoken');
const db = require("../DB");


/**
 * Authenticate LuxID using authorization code.
 *
 * @param {Object} req - the request object
 * @param {Object} res - the response object
 * @return {Promise<void>} - does not return anything
 */
const authenticateLuxID = async (req, res) => {
    try {

        const state = req.body.state;

        const verifier = Singleton.getInstance().get(state);

        Singleton.getInstance().remove(state);


        let formData = new URLSearchParams();
        formData.append('grant_type', 'authorization_code');
        formData.append('client_id', 'lam_bts_1');
        formData.append('code_verifier', verifier);
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

        const token = responseData.id_token
        if (information !== null) {

            res.status(200).json({
                "information": token
            });
        }

    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};



/**
 * Generates a code verifier, state, and challenge for OAuth 2.0 authentication.
 *
 * @param {Object} req - The request object.
 * @param {Object} res - The response object.
 * @return {Object} The response object with the generated verifier, challenge, and state.
 */
const getCodeVerifier = async (req, res) => {
    try {
        const verifier = base64URLEncode(crypto.randomBytes(32));

        const state = hashFunction(verifier);

        Singleton.getInstance().insert(state, verifier);


        let challenge = await base64URLEncode(sha256(verifier));

        res.status(200).json({ verifier, challenge, state });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
};




/**
 * Encodes a string using base64 URL encoding.
 *
 * @param {string} str - The string to be encoded
 * @return {string} The base64 URL encoded string
 */
function base64URLEncode(str) {
    return str.toString('base64')
        .replace(/\+/g, '-')
        .replace(/\//g, '_')
        .replace(/=/g, '');
}

/**
 * Calculates the SHA-256 hash of a given buffer.
 *
 * @param {Buffer} buffer - The buffer to hash.
 * @return {Buffer} The SHA-256 hash of the input buffer.
 */
function sha256(buffer) {
    return crypto.createHash('sha256').update(buffer).digest();
}

/**
 * Create a SHA-256 hash of the input.
 *
 * @param {string} input - The input to be hashed
 * @return {string} The hashed output
 */
function hashFunction(input) {
    return crypto.createHash('sha256').update(input).digest('hex');
}

module.exports = {
    authenticateLuxID,
    getCodeVerifier
};




class Singleton {
    static instance;
    hashMap;

    /**
     * Initializes a new instance of the class.
     *
     * @param {type} paramName - description of parameter
     * @return {type} description of return value
     */
    constructor() {
        this.hashMap = new Map();
    }

    /**
     * Returns the instance of the Singleton class, creating it if it doesn't exist.
     *
     * @return {Singleton} The instance of the Singleton class
     */
    static getInstance() {
        if (!Singleton.instance) {
            Singleton.instance = new Singleton();
        }
        return Singleton.instance;
    }

    /**
     * A function to insert a key-value pair into the hash map.
     *
     * @param {type} key - the key to be inserted
     * @param {type} value - the value to be inserted
     * @return {type} 
     */
    insert(key, value) {
        this.hashMap.set(key, value);
    }

    /**
     * Retrieves the value associated with the specified key from the hash map.
     *
     * @param {any} key - The key to retrieve the value for.
     * @return {any} The value associated with the specified key, or undefined if the key does not exist in the hash map.
     */
    get(key) {
        return this.hashMap.get(key);
    }


    /**
     * Removes the specified key from the hash map.
     *
     * @param {type} key - The key to be removed from the hash map.
     * @return {undefined} This function does not return a value.
     */
    remove(key) {
        this.hashMap.delete(key);
    }
}