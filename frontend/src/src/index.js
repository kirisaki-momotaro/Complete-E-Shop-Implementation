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

async function Register(e){

    e.preventDefault()
    const getUsername=document.getElementById('new-username').value;
    const getPassword=document.getElementById('new-password').value;
    const getEmail=document.getElementById('new-email').value;
    const getRoles=document.getElementById('user-type').value;


    try{
        var myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/x-www-form-urlencoded");

        var urlencoded = new URLSearchParams();
        urlencoded.append("grant_type", "client_credentials");
        urlencoded.append("client_id", "admin-cli");
        urlencoded.append("client_secret", "ZF7wItADWdPcq22kT1L0s4R2Fn8D3D87");

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
            console.log(token)
        }else{
            const err = await admin_access_token.json();
        }



    }catch(error) {
        console.log(error);
    }


    return false;
} 


