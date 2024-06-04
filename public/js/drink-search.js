// Search Button script
const searchButton = document.querySelector('.search-btn');

searchButton.addEventListener('click', (event) => {
    event.preventDefault();
    window.location.href = '/drink-results';
});
