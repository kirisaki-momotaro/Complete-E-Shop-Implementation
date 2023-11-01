const express = require('express');
const app = express();
const port = 6000;

// Define a route that responds with 'Hello, World!'
app.get('/', (req, res) => {
  res.send('STUPID DOCKER!!!!!!!!!!!!!!!!!!!!');
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});