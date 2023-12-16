const express = require('express');
const cors = require('cors');
const port = 5101;

const {connection} =require('./dbConnect')
const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended:true}));
    

const path= require('path');
const page_path =path.join(__dirname,'/src');
const login_path =path.join(__dirname,'/login');
app.use(express.static(page_path));
app.use(express.static(login_path));

app.get("/health",(req, res) => {
  res.send("ok");
});


// Define a route that responds with 'Hello, World!'
app.get('/products', (req, res) => {

  res.sendFile(page_path+'/products_main.html');
  
});

app.post('/products',async (req, res) => {
  const data = req.body;
  //console.log(data);
  try {

    const db=await connection;
    const store= await db.execute(`INSERT INTO products (title, price, quantity, username) VALUES (?,?,?,?)`,
      [data.title,data.price,data.quantity,data.username])
    console.log(store)
    res.send(store)
  } catch (error) {
    res.status(500).send(error.message) 
    
  }


  
});

app.get('/login', (req, res) => {

  res.sendFile(login_path+'/index.html');
  
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});