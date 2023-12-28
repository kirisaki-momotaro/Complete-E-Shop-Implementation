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

app.get("/orders", async (req, res) => {
  try {
    //get db
    const db = await connection;

    const results = await db.execute("SELECT * FROM orders");
    res.send(results[0]);
  } catch (error) {
    console.error("Error fetching orders:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});
app.get("/orders/:user", async (req, res) => {
  try {
    const user = req.params.user;
    //get db
    const db = await connection;

    const results = await db.query("SELECT * FROM orders WHERE `user` = ?", [user]);
    res.send(results[0]);
  } catch (error) {
    console.error("Error fetching orders:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});
const kafka = require("./kafka");
//create an order
app.post("/orders", async (req, res) => {
  const order = req.body;
  try {
    const db = await connection;

    //store to database
    // const jsonDataString = JSON.stringify(order);
    const results = await db.execute(
      "INSERT INTO orders (products, status, total_price, user) VALUES (?, ?, ?, ?)",
      [order.products, order.status, order.total_price, order.user]
    );

    //send to kafka
      const msg = {
        id: results[0].insertId,
        products: order.products
      }

      await kafka.kafkaProducer(msg)

    res.send(results);
  } catch (e) {
    console.log(e);
    res.status(500).send({ error: "Internal Server Error" });
  }
});


app.get('/', (req, res) => {
  res.send("im fine i guess");
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});