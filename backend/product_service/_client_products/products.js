function addToCart(index, title, quantity, price, username) {
    // Example: Add the selected product to the cart (replace this with your actual logic)
    console.log(`Added to cart (index ${index}): ${title}`);
    console.log(`Quantity: ${quantity}`);
    console.log(`Price: ${price}`);
    console.log(`Username: ${username}`);
  }
//when browser load run the fetch
window.addEventListener("load", async () => {

    if(sessionStorage.getItem('username')==null){
        alert("You must be logged in first"); 
        window.location.href = "http://localhost:5101/login";
    
    }
    if(sessionStorage.getItem('role')!="customer"){
      alert("You must be a customer to access this page"); 
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
            <button class="add-to-cart-button" onclick="addToCart(${index}, '${data.title}', ${data.quantity}, ${data.price}, '${data.username}')">Add to Cart</button>
          </div>
          `;   
          productsDiv.innerHTML += context;
        });
      }
    } catch (e) {
      console.log(e);
    }
  });



// Function to set the username in the user info section
function setUserInfo() {
    const usernameDisplay = document.getElementById("username-display");
    usernameDisplay.textContent = `Welcome, ${sessionStorage.getItem('username')} (${sessionStorage.getItem('role')})`;
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
