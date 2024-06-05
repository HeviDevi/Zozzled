// Modal 
window.addEventListener('DOMContentLoaded', () => {
    var myModal = new bootstrap.Modal(document.getElementById('register'));
    myModal.show();
});

// Search Button script
const searchButton = document.querySelector('.search-btn');

searchButton.addEventListener('click', (event) => {
    event.preventDefault();
    window.location.href = '/drink-results';
});
