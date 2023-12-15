// get the client
const mysql = require('mysql2/promise');


const connect = async () => {

    try {
        // create the connection to database
        const connection = await mysql.createConnection({
        host: 'localhost',//when using docker put continer_name instead of localhost
        port: 3310,
        user: 'admin',
        password: 'admin',
        database: 'products_db'

        
    });     
    console.log("finally connected to stupid database");
    return connection;   
    } catch (error) {
        console.log(error);
        throw new Error(error);
        
    }

}

const connection = connect();
module.exports = {connection};