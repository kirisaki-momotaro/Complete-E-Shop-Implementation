const express = require('express');
const mongoose = require('mongoose');
const app = express();
const cors = require("cors");
const port = 5101;
const { connection } = require("./databaseConnect");

const path= require('path');
const page_path =path.join(__dirname,'/src');
const login_path =path.join(__dirname,'/login');
app.use(express.static(page_path));
app.use(express.static(login_path));
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


// Define a route that responds with 'Hello, World!'
app.get('/products', (req, res) => {

  res.sendFile(page_path+'/products_main.html');
  
});

app.get('/login', (req, res) => {

  res.sendFile(login_path+'/index.html');
  
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});