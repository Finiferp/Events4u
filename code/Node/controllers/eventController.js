"use strict"

const db = require("../DB");

const createAsset = async (req, res) => {
    try {
        const dbOutput = await db.spGetAssets();
        const { status_code, message, data } = dbOutput[0][0].result;

        res.status(status_code).json({
            message,
            data: data,
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
}

module.exports = {
    createAsset
};