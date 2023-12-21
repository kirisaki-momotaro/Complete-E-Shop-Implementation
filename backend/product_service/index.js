const express = require('express');
const cors = require('cors');
const port = 5101;

const {connection} =require('./dbConnect')
const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended:true}));
    

const path= require('path');
const client_page_path =path.join(__dirname,'/_client_products');
const seller_page_path =path.join(__dirname,'/_seller_products');

const login_path =path.join(__dirname,'/login');
app.use(express.static(client_page_path));
app.use(express.static(seller_page_path));

app.use(express.static(login_path));

app.get("/health",(req, res) => {
  res.send("ok");
});


// Define a route that responds with 'Hello, World!'
app.get('/products_client', (req, res) => {  
  res.sendFile(client_page_path+'/customer_products_main.html'); 
});
app.get('/cart', (req, res) => {  
  res.sendFile(client_page_path+'/cart_page.html'); 
});

app.get('/products_seller', (req, res) => {  
res.sendFile(seller_page_path+'/seller_products_main.html'); 
});

app.get('/new_product', (req, res) => {  
  res.sendFile(seller_page_path+'/create_product_page.html'); 
  });
  
  app.get('/edit_product', (req, res) => {  
    res.sendFile(seller_page_path+'/edit_product.html'); 
    });
    

app.get('/products_all',async (req, res) => {

  try {
    //get db
    const db = await connection;
    const results = await db.execute("SELECT * FROM products");
    res.send(results[0]);
  } catch (error) {
    console.error("Error fetching products:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
  
});

app.delete('/products/:productId', async (req, res) => {
  const productId = req.params.productId;

  try {
    const db = await connection;
    const result = await db.execute(`DELETE FROM products WHERE id = ?`, [productId]);
    res.send(result);
    
  } catch (error) {
    console.error(error);
    res.status(500).send(error.message);
  }
});

app.get("/products/:username", async (req, res) => {
  try {
    const username = req.params.username;
    //get db
    const db = await connection;

    const results = await db.query("SELECT * FROM products WHERE `username` = ?", [
      username,
    ]);
    res.send(results[0]);
  } catch (error) {
    console.error("Error fetching products:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
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