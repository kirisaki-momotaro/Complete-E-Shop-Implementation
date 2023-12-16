const express = require('express');
const cors = require('cors');
const port = 5050;

const {connection} =require('./dbConnect')
const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended: true}));


const path= require('path');
const page_path =__dirname

app.get("/health",(req, res) => {
  res.send("im fine i guess");
});

//create an order
app.post("/orders", async (req, res) => {
  const order = req.body;
  try {
    const db = await connection;

    //store to database
    // const jsonDataString = JSON.stringify(order);
    const results = await db.execute(
      "INSERT INTO orders (products, status, total_price) VALUES (?, ?, ?)",
      [order.products, order.status, order.total_price]
    );

    /*send to kafka
      const msg = {
        id: results[0].insertId,
        products: order.products
      }

      await kafka.kafkaProducer(msg)*/

    res.send(results);
  } catch (e) {
    console.log(e);
    res.status(500).send({ error: "Internal Server Error" });
  }
});

// Define a route that responds with 'Hello, World!'
app.get('/', (req, res) => {
  res.sendFile('${page_path}/products_main.html')
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});