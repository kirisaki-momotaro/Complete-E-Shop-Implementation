function getProductsFromSessionStorage() {  
  var productsJson = sessionStorage.getItem('products');
  return JSON.parse(productsJson) || {};
}
function addToCart(id, title, price) {   
  
  var products = getProductsFromSessionStorage();

    if (products.hasOwnProperty(id)) { 
      products[id].quantity += 1;
      products[id].price += price;
    } else { 
      products[id] = {
        title:title,
        quantity: 1,
        price: price
      };
    }
    var productsJson = JSON.stringify(products);
    sessionStorage.setItem('products', productsJson);

  }
//when browser load run the fetch
window.addEventListener("load", async () => {

    if(sessionStorage.getItem('username')==null){
        alert("You must be logged in first"); 
        window.location.href = "http://localhost:5101/login";
    
    }
    if(sessionStorage.getItem('role')!="customer"){
      alert("You must be a client to access this page"); 
      sessionStorage.clear();
      window.location.href = "http://localhost:5101/login";

  }
    try {
     
      const response = await fetch("http://localhost:5101/products_all", {
        method: "GET", // *GET, POST, PUT, DELETE, etc.
      });
  
      //communicate with server happens succesfully
      if (response.ok) {
        const products = await response.json();
  
      
        const productsDiv = document.getElementById("product-display");
      
        products.forEach((data,index) => {
          console.log(data.img);
          const context = `
          <div class="product">
            <p>${data.title}</p>           
            <p>${data.quantity}</p>
            <p>${data.price}</p>
            <p>${data.username}</p>
            <button class="add-to-cart-button" onclick="addToCart(${data.id}, '${data.title}', ${data.price})">Add to Cart</button>
          </div>
          `;   
          productsDiv.innerHTML += context;
        });
      }
    } catch (e) {
      console.log(e);
    }
  });

  async function searchProducts() {   
    const searchTerm = document.getElementById("search-bar").value.toLowerCase();    
    try {
      var requestOptions = {
        method: 'GET',
        redirect: 'follow'
      };
      
      const response=await fetch("http://localhost:5101/search/"+searchTerm, requestOptions)
      if (response.ok) {    
        
        const products = await response.json();     
        const productsDiv = document.getElementById("product-display");
        productsDiv.innerHTML = '';         
        products.forEach((data,index) => {
          console.log(data.img);
          const context = `
          <div class="product">
            <p>${data.title}</p>           
            <p>${data.quantity}</p>
            <p>${data.price}</p>
            <p>${data.username}</p>
            <button class="add-to-cart-button" onclick="addToCart(${data.id}, '${data.title}', ${data.price})">Add to Cart</button>
          </div>
          `;   
          productsDiv.innerHTML += context;
        });
      }else{
          const err = await response.json();
          console.log(err);
      }

    } catch (e) {
      console.log(e);
    }
    
  }

// Function to set the username in the user info section
function setUserInfo() {
    const usernameDisplay = document.getElementById("username-display");
    usernameDisplay.textContent = `Welcome, ${sessionStorage.getItem('username')} (${sessionStorage.getItem('role')})`;
}
function viewCart() {
  window.location.href = "http://localhost:5101/cart";
}
// Function to handle logout
function logout() {
    // Perform logout actions, e.g., clear session, redirect to login page, etc.
    alert("Logout successful!"); // Replace with actual logout logic
    sessionStorage.clear();
    window.location.href = "http://localhost:5101/login";
}

// Function to handle page change
function changePage() {
    const selectedPage = document.getElementById("pages").value;
    // Add logic to handle page change, e.g., load content for the selected page
    alert(`Navigating to ${selectedPage} page...`); // Replace with actual page navigation logic
}

// Call the setUserInfo function to display the current user's information
setUserInfo();
showProducts();
