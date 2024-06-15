// Tweet function
function tweet(drinkDetails, websiteName) {
    const tweetText = `Check out this amazing drink I found on ${websiteName}! Name: ${drinkDetails.name}, Spirit: ${drinkDetails.spirit}, Ingredients: ${drinkDetails.ingredients}, https://zozzled-lk94.onrender.com/`;
    const tweetUrl = `https://twitter.com/intent/tweet?text=${encodeURIComponent(tweetText)}`;
    window.open(tweetUrl, "Tweet Window", "width=600, height=300");
}

// Instagram function
function instagram() {
    window.open("https://www.instagram.com/", "Instagram Window", "width=600, height=300");
}

// Event listeners
document.addEventListener('DOMContentLoaded', function () {
    // Tweet button click event
    const twitterButton = document.getElementById('twitter');
    if (twitterButton) {
        twitterButton.addEventListener('click', function () {
            const drinkName = document.querySelector('.card-title').textContent.trim();
            const spiritType = document.querySelector('.card-text:nth-of-type(2)').textContent.replace('Spirit Type:', '').trim();
            const ingredients = document.querySelector('.card-text:nth-of-type(4)').textContent.replace('Ingredients:', '').trim();

            // Adjust websiteName to your actual website name
            const websiteName = "Zozzled"; // Replace with your website name

            tweet({ name: drinkName, spirit: spiritType, ingredients: ingredients }, websiteName);
        });
    }

    // Instagram button click event
    const instagramButton = document.getElementById('instagram');
    if (instagramButton) {
        instagramButton.addEventListener('click', function () {
            instagram();
        });
    }
});
