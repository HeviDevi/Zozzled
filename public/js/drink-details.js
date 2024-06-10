document.addEventListener('DOMContentLoaded', function() {
    const heartButtons = document.querySelectorAll('.favorite-btn');
  
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
      });
    });
  });