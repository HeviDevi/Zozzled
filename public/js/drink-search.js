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

    // Continue as Guest script
    document.getElementById('guestBtn').addEventListener('click', () => {
        const myModalEl = document.querySelector('.modal');
        const modal = bootstrap.Modal.getInstance(myModalEl);
        modal.hide();
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

// // Search Button script
// document.getElementById('searchButton').addEventListener('click', function() {
//     var searchTerm = document.getElementById('searchInput').value;
//     // Redirect to the search route with the search term as a query parameter
//     window.location.href = '/users/search?term=' + encodeURIComponent(searchTerm);
// });

