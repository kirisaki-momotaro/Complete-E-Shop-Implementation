function addToCart(index, title, quantity, price, username) {   
    console.log(`Added to cart (index ${index}): ${title}`);
    console.log(`Quantity: ${quantity}`);
    console.log(`Price: ${price}`);
    console.log(`Username: ${username}`);
  }
//when browser load run the fetch
window.addEventListener("load", async () => {

    if(sessionStorage.getItem('username')==null){//check user is correctly logged is
        alert("You must be logged in first"); 
        window.location.href = "http://localhost:5101/login";
    
    }
    if(sessionStorage.getItem('role')!="seller"){
        alert("You must be a seller to access this page"); 
        sessionStorage.clear();
        window.location.href = "http://localhost:5101/login";

    }
    try {//ask server for main page
     
      const response = await fetch("http://localhost:5101/products/"+sessionStorage.getItem('username'), {
        method: "GET", // *GET, POST, PUT, DELETE, etc.
      });
  
      //communicate with server happens succesfully
      if (response.ok) {
        const products = await response.json();
  
      
        const productsDiv = document.getElementById("product-display");
      
        products.forEach((data,index) => {//fill page with products
          console.log(data.img);
          const context = `
          <div class="product">
            <p>${data.title}</p>           
            <p>${data.quantity}</p>
            <p>${data.price}</p>
            <p>${data.username}</p>
            <button class="delete-button" onclick="deleteProduct(${data.id})">Delete</button>
            <button class="edit-button" onclick="editProduct(${data.id}, '${data.title}', ${data.quantity}, ${data.price}, '${data.username}')">Edit</button>
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
  });



// Function to set the username in the user info section
function setUserInfo() {
    const usernameDisplay = document.getElementById("username-display");
    usernameDisplay.textContent = `Welcome, ${sessionStorage.getItem('username')} (${sessionStorage.getItem('role')})`;
}

// Function to handle logout
function logout() {
    // Perform logout actions, e.g., clear session, redirect to login page
    alert("Logout successful!"); // Replace with actual logout logic
    sessionStorage.clear();
    window.location.href = "http://localhost:5101/login";
}

function addNewProduct(){
  window.location.href = "http://localhost:5101/new_product";
}
async function deleteProduct(product_id){
  try {
    var requestOptions = {
      method: 'DELETE',
      redirect: 'follow'
    };
    
    const response=await fetch("http://localhost:5101/products/"+product_id, requestOptions)
    if (response.ok){
      alert("Product deleted successfully");

    }else{
      const err = await response.json();
      console.log(err);

    }
  } catch (e) {
    console.log(e);
    
  }

}
// Function to handle page change
function changePage() {
    const selectedPage = document.getElementById("pages").value;
    // Add logic to handle page change, e.g., load content for the selected page
    alert(`Navigating to ${selectedPage} page...`); // Replace with actual page navigation logic
}


async function deleteProduct(product_id) {
  try {
    var requestOptions = {
      method: 'DELETE',
      redirect: 'follow'
    };
    
    const response = await fetch(`http://localhost:5101/products/${product_id}`, requestOptions);
    
    if (response.ok) {
      //alert("Product deleted successfully");
      refreshProducts()
      
      // Refresh the product display after successful deletion
      showProducts();
    } else {
      const err = await response.json();
      console.log(err);
    }
  } catch (e) {
    console.log(e);
  }
}

// Function refresh display of products in case of change
async function refreshProducts() {
  try {
    const response = await fetch(`http://localhost:5101/products/${sessionStorage.getItem('username')}`, {
      method: "GET",
    });

    if (response.ok) {
      const products = await response.json();
      const productsDiv = document.getElementById("product-display");
      
      // Clear existing content
      productsDiv.innerHTML = '';

      products.forEach((data, index) => {
        const context = `
          <div class="product">
            <p>${data.title}</p>           
            <p>${data.quantity}</p>
            <p>${data.price}</p>
            <p>${data.username}</p>
            <button class="delete-button" onclick="deleteProduct(${data.id})">Delete</button>
            <button class="edit-button" onclick="editProduct(${data.id}, '${data.title}', ${data.quantity}, ${data.price})">Edit</button>
          </div>
        `;   
        productsDiv.innerHTML += context;
      });
    } else {
      const err = await response.json();
      console.log(err);
    }
  } catch (e) {
    console.log(e);
  }
}
function editProduct(id, title, quantity, price) {
  console.log(id);
  var product_to_change = {
    id:id,
    title:title,
    quantity: quantity,
    price: price
  };
  var product_to_changeJson = JSON.stringify(product_to_change);
  sessionStorage.setItem('product_to_change', product_to_changeJson);
  window.location.href = "http://localhost:5101/edit_product";
}




// Call the setuserInfo function to display the current user's information
setUserInfo();
showProducts();//load products
