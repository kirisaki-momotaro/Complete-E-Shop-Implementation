const mysql = require("mysql2/promise");

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
  
const connect = async () => {
    await sleep(10000);
  try {
    // Create a connection to the MySQL server
    const connection = await mysql.createConnection({
      host: "172.17.0.1",
      port: 3308,
      user: "admin",
      password: "admin",
      database: "order_db",
    });

    console.log("Connected to MySQL database");

    // Create a table
    const createTableQuery = `
        CREATE TABLE IF NOT EXISTS orders (
            id INT AUTO_INCREMENT PRIMARY KEY,
            products JSON,
            status VARCHAR(255),
            total_price DECIMAL(10, 2),
            user VARCHAR(255)
        )
        `;

    const table = await connection.query(createTableQuery);
    console.log(table);

    return connection;
  } catch (e) {
    console.error("Error connecting to MySQL:", e);
    throw new Error(e);
  }
};

const connection = connect();

module.exports = { connection };