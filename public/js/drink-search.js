document.addEventListener('DOMContentLoaded', function () {
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



