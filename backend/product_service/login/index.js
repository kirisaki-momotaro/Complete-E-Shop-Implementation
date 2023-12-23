document.addEventListener('DOMContentLoaded', function () {
    const loginSection = document.getElementById('login-interface');
    const registerSection = document.getElementById('register-interface');
    const registerBtn = document.getElementById('register-btn');
    const goBackBtn = document.getElementById('go-back-btn');

    registerBtn.addEventListener('click', function () {
        loginSection.classList.add('hidden');
        registerSection.classList.remove('hidden');
    });

    goBackBtn.addEventListener('click', function () {
        registerSection.classList.add('hidden');
        loginSection.classList.remove('hidden');
    });
});

function decodeJwt(jwtToken) {
    const base64Url = jwtToken.split('.')[1]; // Get the payload part of the JWT
    const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/'); // Replace Base64 URL encoding characters
    const jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
      return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join('')); // Decode Base64 and handle URI component encoding
  
    return JSON.parse(jsonPayload);
  }

async function Login(e){
    e.preventDefault();

    const login_username=document.getElementById('login-username').value;
    const login_password=document.getElementById('login-password').value;
    try{
        console.log(login_username)
        console.log(login_password);
        var myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/x-www-form-urlencoded");

        var urlencoded = new URLSearchParams();
        urlencoded.append("username", login_username);
        urlencoded.append("password", login_password);
        urlencoded.append("client_id", "client-front");
        urlencoded.append("client_secret", "BlJJqPSwExWV36yUFxjNoRkiW95JnlRg");
        urlencoded.append("grant_type", "password");

        var requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: urlencoded,
            redirect: 'follow'
        };

       const response= await fetch("http://localhost:8080/auth/realms/hmmyzon/protocol/openid-connect/token", requestOptions)
        if(response.ok)
        {
            const login=await response.json();
            const token=login.access_token

            const decodeToken =await decodeJwt(token);
            
            sessionStorage.setItem("username", decodeToken.preferred_username);
            sessionStorage.setItem("email", decodeToken.email);
            sessionStorage.setItem("refresh_token", decodeToken.azp);
            
            if(decodeToken.realm_access.roles[3]=='customer'){
                sessionStorage.setItem("role", decodeToken.realm_access.roles[3]);
            }else{
                sessionStorage.setItem("role", decodeToken.realm_access.roles[0]);
            }
            
            if(sessionStorage.getItem("role")=="customer"){
                window.location.href = "http://localhost:5101/products_client";
            }else{
                window.location.href = "http://localhost:5101/products_seller";
            }
            
            //localStorage.getItem("username");
            //localStorage.clearItem("email");
            //localStorage.clear();

            console.log(decodeToken)
            
        }else{
            const err = await response.json();
            console.log(err);
        }

    }catch(error) {
        console.log(error);
    }
    return false
}

async function Register(e){

    e.preventDefault()
    const getUsername=document.getElementById('new-username').value;
    const getPassword=document.getElementById('new-password').value;
    const getEmail=document.getElementById('new-email').value;
    const getRoles=document.getElementById('select-role').value;


    try{
        var myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/x-www-form-urlencoded");

        var urlencoded = new URLSearchParams();
        urlencoded.append("grant_type", "client_credentials");
        urlencoded.append("client_id", "admin-cli");
        urlencoded.append("client_secret", "yAE56YCPNKU2YWmE0MpnCr616Hb0ukee");

        var requestOptions = {
        method: 'POST',
        headers: myHeaders,
        body: urlencoded,
        redirect: 'follow'
        };
        //get token for access
        const access_token = await fetch("http://localhost:8080/auth/realms/master/protocol/openid-connect/token", requestOptions)
        
        if (access_token.ok) {
            const admin_access_token=await access_token.json();
            const token=admin_access_token.access_token
            //console.log(token)
            var myHeaders = new Headers();
            myHeaders.append("Content-Type", "application/json");
            myHeaders.append("Authorization", "Bearer "+token);

            var raw = JSON.stringify({
                "email": getEmail,
                "enabled": "true",
                "username": getUsername,
                "attributes": {
                    "client_id": "client-front"
                    
                },
                "groups": [
                    getRoles
                ],
                "credentials": [
                    {
                    "type": "password",
                    "value": getPassword,
                    "temporary": false
                    }
                ]
            });

            var registerOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw,
            redirect: 'follow'
            };

            const register_user=await fetch("http://localhost:8080/auth/admin/realms/hmmyzon/users", registerOptions)
            if(register_user.ok){
                alert("Registration successful");
                const user = await register_user.json();
                window.location.reload();
            }else{
                const err = await register_user.json();
                console.log(err);
            }
                    
        }else{
            const err = await admin_access_token.json();
        }


    }catch(error) {
        console.log(error);
    }


    return false;
} 


