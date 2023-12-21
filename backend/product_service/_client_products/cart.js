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
// Function to remove product from the products
function removeProduct(productName) {
    const products = JSON.parse(sessionStorage.getItem('products')) || {};
    delete products[productName]; // Remove product by key
    sessionStorage.setItem('products', JSON.stringify(products));
    showProducts(); // Update the products display
}

// Call the showProducts function to display the current products
showProducts();
