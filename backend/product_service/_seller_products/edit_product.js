
if(sessionStorage.getItem('username')==null){
  alert("You must be logged in first"); 
  window.location.href = "http://localhost:5101/login";

}
if(sessionStorage.getItem('role')!="seller"){
  alert("You must be a seller to access this page"); 
  sessionStorage.clear();
  window.location.href = "http://localhost:5101/login";

}
// Function to fetch product details and fill the form
function fillFormWithProductDetails() {
    
    const product_to_change = JSON.parse(sessionStorage.getItem('product_to_change')) || {};

    // Fill the form fields with the old poduct values
    document.getElementById("title").value = product_to_change.title;
    document.getElementById("price").value = product_to_change.price;
    document.getElementById("quantity").value = product_to_change.quantity;
}


async function updateProduct() {
    // Fetch values from the form
    const product_to_change = JSON.parse(sessionStorage.getItem('product_to_change')) || {};
    
    var title = document.getElementById("title").value;
    var price = document.getElementById("price").value;
    var quantity = document.getElementById("quantity").value;

    try {
        var myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/x-www-form-urlencoded");
        
        var urlencoded = new URLSearchParams();
        urlencoded.append("title",title);
        urlencoded.append("price", price);
        urlencoded.append("quantity",quantity);
        
        var requestOptions = {
          method: 'PUT',
          headers: myHeaders,
          body: urlencoded,
          redirect: 'follow'
        };
        
    

          const response = await fetch("http://localhost:5101/edit_product/"+product_to_change.id, requestOptions)
    
        if (response.ok) {
            alert("Product Edited Successfully");

        } else {
        const err = await response.json();
        console.log(err);
        }
  } catch (e) {
    console.log(e);
  }
     


}
function cancel(){
    window.location.href = "http://localhost:5101/products_seller";

}
// Call the function to fill the form with product details hen the page is loaded
document.addEventListener("DOMContentLoaded", fillFormWithProductDetails);
