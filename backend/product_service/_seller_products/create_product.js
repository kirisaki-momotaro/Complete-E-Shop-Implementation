if(sessionStorage.getItem('username')==null){
    alert("You must be logged in first"); 
    window.location.href = "http://localhost:5101/login";

}
if(sessionStorage.getItem('role')!="seller"){
    alert("You must be a seller to access this page"); 
    sessionStorage.clear();
    window.location.href = "http://localhost:5101/login";

}

// create_product.js
header('Content-Type: text/javascript');
async function createProduct(event) {
    event.preventDefault(); // Prevent the form from submitting the traditional way

    // Get form values
    const title = document.getElementById('title').value;
    const price = parseFloat(document.getElementById('price').value);
    const quantity = parseInt(document.getElementById('quantity').value);

    try {
        var myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/x-www-form-urlencoded");

        var urlencoded = new URLSearchParams();
        urlencoded.append("title", title);
        urlencoded.append("price", price);
        urlencoded.append("quantity", quantity);
        urlencoded.append("username", sessionStorage.getItem('username'));

        var requestOptions = {
        method: 'POST',
        headers: myHeaders,
        body: urlencoded,
        redirect: 'follow'
        };

        const response=await fetch("http://localhost:5101/products", requestOptions)
        if (response.ok) {
            alert("Successfuly created product");
            window.location.href = "http://localhost:5101/products_seller";

        }else{
            const err = await response.json();
            console.log(err);
        }
        
    } catch (error) {
        console.log(error);
    }

}

// Additional functions or logic can be added as needed
function goBack(){
    window.location.href = "http://localhost:5101/products_seller";
}