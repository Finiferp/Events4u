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
    const connection = await pool.getConnection();
    try {
        const [results] = await connection.execute(sql, values);
        return results;
    } finally {
        connection.release();
    }
};
