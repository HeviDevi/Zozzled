document.addEventListener('DOMContentLoaded', function() {
    const submitButtonEl = document.querySelector('#submitButton');
 
    submitButtonEl.addEventListener('click' , function(event) {
        event.preventDefault();
        const rating = document.querySelector('#rating').value;
        const comment = document.querySelector('#comment').value;
        const drink_id = submitButtonEl.dataset.drinkId;
        const drinkName = submitButtonEl.dataset.drink_name;

        fetch('/add-rating', {
            method: 'POST',
            body: JSON.stringify({ rating, comment, drink_id, drinkName }),
            headers: {
                'Content-Type': 'application/json',
            },
        }) 
        
})
})