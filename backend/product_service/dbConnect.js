// get the client
const mysql = require('mysql2/promise');


const connect = async () => {

    try {
        // create the connection to database
        const connection = await mysql.createConnection({
        //host: 'localhost',//when using docker put continer_name instead of localhost
        //host: 'products_db',
        host: '172.17.0.1',
        port: 3310,
        user: 'admin',
        password: 'admin',
        database: 'products_db'

        
    });      
    console.log("finally connected to stupid database");

    const creatTable = `CREATE TABLE IF NOT EXISTS products(
        id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(255),
        price DECIMAL(10,2),
        quantity INT,
        username VARCHAR(255)
    )` ;
    
    const table = await connection.execute(creatTable);
    console.log(table);

    return connection;   
    } catch (error) {
        console.log(error);
        throw new Error(error);
        
    }

}

const connection = connect();
module.exports = {connection};