const mysql = require('mysql2/promise');
require('dotenv').config();

// Database connection options
const DBConnectOpts = {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    charset: 'utf8mb4',
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME_AUDDIT,
};

// Create a connection pool
const pool = mysql.createPool(DBConnectOpts);

/**
 * Asynchronously executes the given SQL query with the provided values, and returns the result.
 *
 * @param {string} sql - The SQL query to be executed
 * @param {Array} values - The values to be used in the SQL query
 * @return {Object} The result of the SQL query execution
 */
const executeQuery = async (sql, values) => {
    const conn = await pool.getConnection();

    try {
        conn.execute(sql, values);
        const row = await conn.query("Select @output as outputJSON");
       
        return row[0][0];
      } catch (err) {
        throw err;
      } finally {
        if (conn) conn.release();
      }
    
};

const getBelongsAudit = async () => {
    const sql = 'CALL sp_getBelongsAudit(@output)';
    return await executeQuery(sql);
}

const getCategoryAudit = async () => {
    const sql = 'CALL sp_getCategoryAudit(@output)';
    return await executeQuery(sql);
}

const getEventAudit = async () => {
    const sql = 'CALL sp_getEventAudit(@output)';
    return await executeQuery(sql);
}

const getFavoriteAudit = async () => {
    const sql = 'CALL sp_getFavoriteAudit(@output)';
    return await executeQuery(sql);
}

const getGroupAudit = async () => {
    const sql = 'CALL sp_getGroupAudit(@output)';
    return await executeQuery(sql);
}

const getLocationAudit = async () => {
    const sql = 'CALL sp_getLocationAudit(@output)';
    return await executeQuery(sql);
}

const getPartOfAudit = async () => {
    const sql = 'CALL sp_getPartOfAudit(@output)';
    return await executeQuery(sql);
}

const getReviewAudit = async () => {
    const sql = 'CALL sp_getReviewAudit(@output)';
    return await executeQuery(sql);
}


const getUserAudit = async () => {
    const sql = 'CALL sp_getUserAudit(@output)';
    return await executeQuery(sql);
}


const getInterestedAudit = async () => {
    const sql = 'CALL sp_getInterestedAudit(@output)';
    return await executeQuery(sql);
}

const getAttendsAudit = async () => {
    const sql = 'CALL sp_getAttendsAudit(@output)';
    return await executeQuery(sql);
}




module.exports = {
    getBelongsAudit,
    getCategoryAudit,
    getEventAudit,
    getFavoriteAudit,
    getGroupAudit,
    getLocationAudit,
    getPartOfAudit,
    getReviewAudit,
    getUserAudit,
    getInterestedAudit,
    getAttendsAudit
}