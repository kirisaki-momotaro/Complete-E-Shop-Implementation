// Function to display items in the cart
function showCart() {
    const cartDisplay = document.getElementById("cart-display");

    // Fetch items from the session storage or any other storage mechanism you are using
    const cartItems = JSON.parse(sessionStorage.getItem('cart')) || [];

    cartDisplay.innerHTML = ''; // Clear previous content

    cartItems.forEach((item, index) => {
        const context = `
            <div class="cart-item">
                <p>${item.title}</p>
                <p>Quantity: ${item.quantity}</p>
                <p>Price: ${item.price}</p>
                <button onclick="removeFromCart(${index})">Remove</button>
            </div>
        `;
        cartDisplay.innerHTML += context;
    });
}

// Function to remove item from the cart
function removeFromCart(index) {
    const cartItems = JSON.parse(sessionStorage.getItem('cart')) || [];
    cartItems.splice(index, 1); // Remove item at the specified index
    sessionStorage.setItem('cart', JSON.stringify(cartItems));
    showCart(); // Update the cart display
}

// Call the showCart function to display the current items in the cart
showCart();
