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
