const mysql = require('mysql2/promise');
require('dotenv').config();

// Database connection options
const DBConnectOpts = {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    charset: 'utf8mb4',
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
};

// Create a connection pool
const pool = mysql.createPool(DBConnectOpts);

/**
 * Asynchronously executes the given SQL query with the provided values and returns the resulting row.
 *
 * @param {string} sql - The SQL query to be executed
 * @param {Array} values - The values to be used in the SQL query
 * @return {Object} The resulting row from the executed SQL query
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


const getEvents = async (JSON) => {
    const sql = 'CALL sp_getEvents(?, @output)';
    const values = [JSON];
    return await executeQuery(sql, values);
}

const getEvent = async (JSON) => {
  const sql = 'CALL sp_getEvent(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const toggleFavorite = async (JSON) => {
  const sql = 'CALL sp_toggleFavorite(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getCategories = async () => {
  const sql = 'CALL sp_getCategories(@output)';
  return await executeQuery(sql);
}

const getEventsOnCategories = async (JSON) => {
  const sql = 'CALL sp_getEventsOnCategories(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const createEvent = async (JSON) => {
  const sql = 'CALL sp_createEvent(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getLocations = async () => {
  const sql = 'CALL sp_getLocations(@output)';
  return await executeQuery(sql);
}

const addLocation = async (JSON) => {
  const sql = 'CALL sp_createLocation(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const updateEvent = async (JSON) => {
  const sql = 'CALL sp_updateEvent(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const deleteEvent = async (JSON) => {
  const sql = 'CALL sp_deleteEvent(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const addEventReview = async (JSON) => {
  const sql = 'CALL sp_addReview(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getReviews = async (JSON) => {
  const sql = 'CALL sp_getReviews(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getUserEvents = async (JSON) => {
  const sql = 'CALL sp_getUserEvents(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getLocationEvents = async (JSON) => {
  const sql = 'CALL sp_getLocationEvents(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const createGroup = async (JSON) => {
  const sql = 'CALL sp_createGroup(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getGroups = async (JSON) => {
  const sql = 'CALL sp_getGroups(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const updateGroup = async (JSON) => {
  const sql = 'CALL sp_updateGroup(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getGroup = async (JSON) => {
  const sql = 'CALL sp_getGroup(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getGroupUsers = async (JSON) => {
  const sql = 'CALL sp_getGroupUsers(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getUsers = async () => {
  const sql = 'CALL sp_getUsers(@output)';
  return await executeQuery(sql);
}

const addUserToGroup = async (JSON) => {
  const sql = 'CALL sp_addUserToGroup(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const removeUserFromGroup = async (JSON) => {
  const sql = 'CALL sp_removeUserFromGroup(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getUserGroups = async (JSON) => {
  const sql = 'CALL sp_getUserGroups(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getGroupEvents = async (JSON) => {
  const sql = 'CALL sp_getGroupEvents(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const toggleAsAttending = async (JSON) => {
  const sql = 'CALL sp_toggleAsAttending(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const toggleAsInterested = async (JSON) => {
  const sql = 'CALL sp_toggleAsInterested(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getList = async (JSON) => {
  const sql = 'CALL sp_exportList(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getAttendedEvents = async (JSON) => {
  const sql = 'CALL sp_getAttendedEvents(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getReminders = async () => {
  const sql = 'CALL sp_reminderData(@output)';
  return await executeQuery(sql);
}

const updateMailer = async (JSON) => {
  const sql = 'CALL sp_updateMailer(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
} 

const register = async (JSON) => {
  const sql = 'CALL sp_register(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const login = async (JSON) => {
  const sql = 'CALL sp_login(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getSalt = async (JSON) => {
  const sql = 'CALL sp_getSalt(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const checkTokenExists = async (JSON) => {
  const sql = 'CALL sp_checkToken(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
} 

const checkAdminStatus = async (JSON) => {
  const sql = 'CALL sp_checkIfAdmin(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const deleteToken = async (JSON) => {
  const sql = 'CALL sp_deleteToken(?)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const getTokens = async () => {
  const sql = 'CALL sp_getTokens(@output)';
  return await executeQuery(sql);
}

const getUserFavorites = async (JSON) => {
  const sql = 'CALL sp_getUserFavorites(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

const checkIfUserExists = async (JSON) => {
  const sql = 'CALL sp_checkIfUserExists(?, @output)';
  const values = [JSON];
  return await executeQuery(sql, values);
}

module.exports = {
    getEvents,
    getEvent,
    toggleFavorite,
    getCategories,
    getEventsOnCategories,
    createEvent,
    getLocations,
    addLocation,
    updateEvent,
    deleteEvent,
    addEventReview,
    getReviews,
    getUserEvents,
    getLocationEvents,
    createGroup,
    getGroups,
    updateGroup,
    getGroup,
    getGroupUsers,
    getUsers,
    addUserToGroup,
    removeUserFromGroup,
    getUserGroups,
    getGroupEvents,
    toggleAsAttending,
    toggleAsInterested,
    getList,
    getAttendedEvents,
    getReminders,
    updateMailer,
    register,
    login,
    getSalt,
    checkTokenExists,
    checkAdminStatus,
    deleteToken,
    getTokens,
    getUserFavorites,
    checkIfUserExists
}