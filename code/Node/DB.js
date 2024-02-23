const mysql = require('mysql2/promise');
require('dotenv').config();

const DBConnectOpts = {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    charset: 'utf8mb4',
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
};
const pool = mysql.createPool(DBConnectOpts);

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

const getCategories = async (JSON) => {
  const sql = 'CALL sp_getCategories(@output)';
  return await executeQuery(sql);
}

module.exports = {
    getEvents,
    getEvent,
    toggleFavorite,
    getCategories
}