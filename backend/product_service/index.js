const kafka = require('./kafka');
const express = require('express');
const cors = require('cors');
const port = 5101;

const {connection} =require('./dbConnect')
const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended:true}));
    



app.get("/health",(req, res) => {
  res.send("ok");
});

  
    app.put('/edit_product/:productId', async (req, res) => {
      const productId = req.params.productId;
      const { title, price, quantity } = req.body;

      
      try {
        const db = await connection;
        const results = await db.execute(`UPDATE products SET title = ?, price = ?,quantity = ? WHERE id = ?`,[title, price, quantity, productId]);     
        res.send(results[0]);

        
      } catch (error) {
        console.error("Error updating product:", error);
        res.status(500).json({ error: "Internal Server Error" });
      }
      

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

app.get("/search/:searchTerm", async (req, res) => {
  try {
    const searchTerm = req.params.searchTerm;
    //get db
    const db = await connection;
    const query = `
      SELECT *
      FROM products
      WHERE title LIKE ? OR username LIKE ?
    `;
    const values = [`%${searchTerm}%`, `%${searchTerm}%`];

    const results = await db.query(query, values);
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


// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});