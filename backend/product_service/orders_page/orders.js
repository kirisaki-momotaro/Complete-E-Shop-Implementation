if(sessionStorage.getItem('username')==null){
  alert("You must be logged in first"); 
  window.location.href = "http://localhost:5101/login";

}
if(sessionStorage.getItem('role')!="customer"){
alert("You must be a client to access this page"); 
sessionStorage.clear();
window.location.href = "http://localhost:5101/login";

}
window.addEventListener("load", async () => {
  try {
    const response = await fetch("http://localhost:5050/orders/" + sessionStorage.getItem('username'), {
      method: "GET",
    });

    // Communicate with the server happens successfully
    if (response.ok) {
      const orders = await response.json();
      console.log(orders);

      const ordersDiv = document.getElementById("order-display");

      orders.forEach(data => {
        console.log(data.img);
        const context = `
          <h3>Order ID: ${data.id}</h3>
          <p>Total Price: ${data.total_price}</p>
          <p>Status: ${data.status}</p>
          <p>User: ${data.user}</p>   
      
          <h4>Products:</h4>
          <div class="product-list">
            ${data.products.map(product => `
              <div class="product">
                <p>${product.title}</p>           
                <p>Amount: ${product.amount}</p>               
                <p>Product ID: ${product.id}</p>
              </div>
            `).join('')}
          </div>     
        `;
        ordersDiv.innerHTML += context;
      });
    }
  } catch (e) {
    console.log(e);
  }
});

function goBack() {
  window.location.href = "http://localhost:5101/products_client";
}
