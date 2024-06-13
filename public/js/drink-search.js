// // Bitter/Sweet images
// document.getElementById('spiritSlider').addEventListener('input', function() {
//   const sliderValue = this.value;
//   const spiritImage = document.getElementById('spiritImage');

//   if(sliderValue == 0) {
//     spiritImage.src = '/assets/img/bitter.png';
//     spiritImage.style.display = 'block';
//   } else if (sliderValue == 2) {
//     spiritImage.src = '/assets/img/sweet.png';
//     spiritImage.style.display = 'block';
//   } else {
//     spiritImage.style.display = 'none';
//   }
// })

document.addEventListener('DOMContentLoaded', function() {
  const searchButton = document.getElementById('searchButton');
  const searchInput = document.getElementById('searchInput');
  const spiritFilter = document.getElementById('spiritFilter');

  if (searchButton && searchInput && spiritFilter) {
    searchButton.addEventListener('click', () => {
      const searchTerm = searchInput.value;
      const spiritType = spiritFilter.value;
      let query = '/search?term=' + encodeURIComponent(searchTerm);

      if (spiritType) {
        query += '&spirit=' + encodeURIComponent(spiritType);
      }

      // Redirect to the search route with the search term and spirit type as query parameters
      window.location.href = query;
    });
  }
});
