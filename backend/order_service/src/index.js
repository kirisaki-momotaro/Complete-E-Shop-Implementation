const express = require('express');
const app = express();
const port = 5050;

const path= require('path');
const page_path =__dirname

// Define a route that responds with 'Hello, World!'
app.get('/', (req, res) => {
  res.sendFile('${page_path}/products_main.html')
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});