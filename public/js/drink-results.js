

document.addEventListener('DOMContentLoaded', function() {
    const heartButtons = document.querySelectorAll('.heart-btn');
  
    heartButtons.forEach(button => {
      button.addEventListener('click', function(event) {
        event.preventDefault();
        const heartIcon = this.querySelector('i');
        if (heartIcon.classList.contains('fa-regular')) {
          heartIcon.classList.remove('fa-regular');
          heartIcon.classList.add('fa-solid');
        } else {
          heartIcon.classList.remove('fa-solid');
          heartIcon.classList.add('fa-regular');
        }

        const drinkId = this.dataset.drinkId;
        fetch('/add-favorite', {
          method: 'POST',
          body: JSON.stringify({ drink_id: drinkId }),
          headers: {
            'Content-Type': 'application/json'
          }
        }).then(response => {
          if (response.ok) {
            console.log('Favorite added successfully');
          } else {
            console.error('Failed to add favorite');
          }
        });
      });
    });
  });