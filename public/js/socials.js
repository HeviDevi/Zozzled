//tweet function
function tweet(message) {
    const url = `https://twitter.com/intent/tweet?text=${encodeURIComponent(message)}`;
    window.open(url, "Tweet Window", "width=600, height=300");
}
//instagram function
function instagram() {
    window.open("https://www.instagram.com/", "Instagram Window", "width=600, height=300");
}

// Construct drink details message for the tweet
const drinkDetails = `Check out this amazing drink! Name: ${'{{name}}'}, Spirit: ${'{{spirit}}'}, Ingredients: ${'{{ingredients}'}`;

//on click of tweet button
document.getElementById('twitter').addEventListener('click', () => {
    tweet(drinkDetails);
});



//on click of instagram button
document.getElementById('instagram',).addEventListener('click', () => {
    instagram();
});