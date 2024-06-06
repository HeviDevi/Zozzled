// Modal 
window.addEventListener('DOMContentLoaded', () => {
    var myModal = new bootstrap.Modal(document.getElementById('register'));
    myModal.show();

    const modal = document.getElementById('register');
    const modalTitle = document.getElementById('modalTitle');
    const loginForm = document.getElementById('loginForm');
    const registerForm = document.getElementById('registerForm');
    const showRegisterBtn = document.getElementById('showRegisterBtn');
    const guestBtn = document.getElementById('guestBtn');

    showRegisterBtn.addEventListener('click', () => {
        loginForm.style.display = 'none';
        registerForm.style.display = 'block';
        modalTitle.textContent = 'Register';
    });

    guestBtn.addEventListener('click', () => {
        window.location.href = '/dashboard';
    });

    document.querySelector('.btn-close').addEventListener('click', () => {
        modal.style.display = 'none';
        loginForm.style.display = 'block';
        registerForm.style.display = 'none';
        modalTitle.textContent = 'Login';
    });

    window.addEventListener('click', (event) => {
        if (event.target == modal) {
            modal.style.display = 'none';
            loginForm.style.display = 'block';
            registerForm.style.display = 'none';
            modalTitle.textContent = 'Login';
        }
    });
});

  // Search Button script
const searchButton = document.querySelector('.search-btn');

searchButton.addEventListener('click', (event) => {
    event.preventDefault();
    window.location.href = '/drink-results';
});

// Continue as Guest script
document.getElementById('guestBtn').addEventListener('click', () => {
    const myModalEl = document.querySelector('.modal');
    const modal = bootstrap.Modal.getInstance(myModalEl);
    modal.hide();
});