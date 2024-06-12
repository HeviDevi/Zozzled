window.addEventListener("DOMContentLoaded", () => {
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