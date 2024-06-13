document.addEventListener('DOMContentLoaded', function() {
  const searchButton = document.getElementById('searchButton');
  const searchInput = document.getElementById('searchInput');
  const spiritFilter = document.getElementById('spiritFilter');
  const spiritSlider = document.getElementById('spiritSlider');

  if (searchButton && searchInput && spiritFilter && spiritSlider) {
      searchButton.addEventListener('click', async (event) => {
          event.preventDefault(); // Prevent default form submission

          const searchTerm = searchInput.value;
          const spiritType = spiritFilter.value;
          const sliderValue = spiritSlider.value;

          // Determine bitter and sweet based on slider value
          const bitter = sliderValue == 0;
          const sweet = sliderValue == 2;

          let query = '/search?term=' + encodeURIComponent(searchTerm);

          if (spiritType) {
              query += '&spirit=' + encodeURIComponent(spiritType);
          }

          // Append bitter and sweet filters if applicable
          if (bitter) {
              query += '&bitter=true';
          }

          if (sweet) {
              query += '&sweet=true';
          }

          try {
              // Redirect to the constructed query URL
              window.location.href = query;

          } catch (error) {
              console.error('Error redirecting:', error);
          }
      });
  }
});



// // Bitter/Sweet Slider Images
// const bitterImagePath = "/assets/img/bitter.png";
// const sweetImagePath = "/assets/img/sweet.png";

// function createImage(src, size) {
//     const img = document.createElement('img');
//     img.src = src;
//     img.classList.add('slider-img');
//     img.style.width = size + 'px';
//     img.style.right = Math.random() * window.innerWidth + 'px';
//     img.style.bottom = Math.random() * window.innerHeight + 'px';
//     return img;
// }

// function updateImages(src, count) {
//     const imageContainer = document.getElementById('imageContainer');
//     imageContainer.innerHTML = '';
//     for (let i = 0; i < count; i++) {
//         const size = Math.random() * 50 + 50;
//         const img = createImage(src, size);
//         imageContainer.appendChild(img);
//     }
// }

// document.getElementById('spiritSlider').addEventListener('input', function() {
//     const value = this.value;
//     if (value == 0) {
//         updateImages(bitterImagePath, 5);
//     } else if (value == 2) {
//         updateImages(sweetImagePath, 5);
//     } else {
//         document.getElementById('imageContainer').innerHTML = '';
//     }
// });

// function animateImages() {
//     const allImages = document.querySelectorAll('.slider-img');
//     if (allImages.length > 0) {
//         const num = Math.floor(Math.random() * allImages.length);
//         allImages[num].classList.add('fade');
//     }
// }

// setInterval(animateImages, 1000);