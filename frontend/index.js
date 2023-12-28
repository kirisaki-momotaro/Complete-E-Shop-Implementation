const express = require('express');
const cors = require('cors');
const port = 80;

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended:true}));


const path= require('path');
const client_page_path =path.join(__dirname,'/_client_products');
const seller_page_path =path.join(__dirname,'/_seller_products');
const orders_page_path =path.join(__dirname,'/orders_page');

const login_path =path.join(__dirname,'/login');
app.use(express.static(client_page_path));
app.use(express.static(seller_page_path));
app.use(express.static(orders_page_path));
app.use(express.static(login_path));


app.get('/orders_page', (req, res) => {  
    res.sendFile(orders_page_path+'/orders.html'); 
  });
  
  
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


      app.get('/', (req, res) => {

        res.sendFile(login_path+'/index.html');
        
      });
    

// Start the server
app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
  });