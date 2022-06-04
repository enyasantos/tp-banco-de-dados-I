var Pool = require('pg').Pool;
require('dotenv').config();

const connection = new Pool({
    user: process.env.DB_PASS,
    password: process.env.DB_USER,
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    database: process.env.DB_NAME,
})

connection.connect((err, client, release) => {
    if (err) {
      return console.error('❌ Error acquiring client', err.stack)
    }

    console.log('👍 Database connection successful')
})

module.exports = connection

