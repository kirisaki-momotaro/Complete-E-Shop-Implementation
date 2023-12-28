// Function to display products
function showProducts() {
    const productsDisplay = document.getElementById("cart-display");

    // Fetch products from the session storage or any other storage mechanism you are using
    const products = JSON.parse(sessionStorage.getItem('products')) || {};

    productsDisplay.innerHTML = ''; // Clear previous content

    // Iterate through each product in the products object
    for (const [productName, productInfo] of Object.entries(products)) {
        const context = `
            <div class="product-container">
                <p>${productInfo.title}</p>
                <p>Quantity: ${productInfo.quantity}</p>
                <p>Price: ${productInfo.price}</p>
                <button onclick="removeProduct('${productName}')">Remove</button>
            </div>
        `;
        productsDisplay.innerHTML += context;
    }
}
function goBack(){
    window.location.href = "http://localhost:5101/products_client";
}
async function submitOrder(){

    const order = {
        products: [],
        total_price: 0,
        status: "Pending",
        user: sessionStorage.getItem('username')
      };

   
    var totalPrice = 0;
    const products = JSON.parse(sessionStorage.getItem('products')) || {};
    for (const [productName, productInfo] of Object.entries(products)) {
        const productObject = {
          title: productInfo.title,
          amount: productInfo.quantity,
          id: productInfo.id
        };
        totalPrice+=productInfo.quantity*productInfo.price;
        order.products.push(productObject);
      }
      order.total_price = totalPrice;

      console.log(order);

      try {
        var myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");

        var raw = JSON.stringify(order);

        var requestOptions = {
        method: 'POST',
        headers: myHeaders,
        body: raw,
        redirect: 'follow'
        };

        const response=await fetch("http://localhost:5050/orders", requestOptions)
        if (response.ok) {    
        
            const order_resp = await response.json();  
            console.log(order_resp);   
            
          }else{
              const err = await response.json();
              console.log(err);
          }
        
      } catch (error) {
        console.log(error);
      }

}

// Function to remove product from the products
function removeProduct(productName) {
    const products = JSON.parse(sessionStorage.getItem('products')) || {};
    delete products[productName]; // Remove product by key
    sessionStorage.setItem('products', JSON.stringify(products));
    showProducts(); // Update the products display
}

// Call the showProducts function to display the current products
showProducts();
