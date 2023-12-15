const express = require('express');
const cors = require('cors');
const port = 5050;

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended: true}));


const path= require('path');
const page_path =__dirname

app.get("/health",(req, res) => {
  res.send("im fine i guess");
});
// Define a route that responds with 'Hello, World!'
app.get('/', (req, res) => {
  res.sendFile('${page_path}/products_main.html')
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});