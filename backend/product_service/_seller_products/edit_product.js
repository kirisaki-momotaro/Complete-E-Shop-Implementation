// Function to fetch product details and fill the form
function fillFormWithProductDetails() {
    // For demonstration, let's assume you have product details in the following object
    const product_to_change = JSON.parse(sessionStorage.getItem('product_to_change')) || {};

    // Fill the form fields with the old product values
    document.getElementById("title").value = product_to_change.title;
    document.getElementById("price").value = product_to_change.price;
    document.getElementById("quantity").value = product_to_change.quantity;
}

// Add JavaScript functions for updating product
function updateProduct() {
    // Fetch values from the form
    var title = document.getElementById("title").value;
    var price = document.getElementById("price").value;
    var quantity = document.getElementById("quantity").value;

    // Perform the update operation (you may want to use AJAX to send this data to the server)
    // For demonstration purposes, we'll log the values to the console
    console.log("Updating Product: ", { title, price, quantity });

    // Redirect back to the products page or perform other actions as needed
    // window.location.href = "products.html";
}
function cancel(){
    window.location.href = "http://localhost:5101/products_seller";

}
// Call the function to fill the form with product details when the page is loaded
document.addEventListener("DOMContentLoaded", fillFormWithProductDetails);
