// tweet function
function tweet(drinkDetails) {
    const tweetText = `Check out this amazing drink! Name: ${drinkDetails.name}, Spirit: ${drinkDetails.spirit}, Ingredients: ${drinkDetails.ingredients}`;
    const tweetUrl = `https://twitter.com/intent/tweet?text=${encodeURIComponent(tweetText)}`;
    window.open(tweetUrl, "Tweet Window", "width=600, height=300");
}

//instagram function
function instagram() {
    window.open("https://www.instagram.com/", "Instagram Window", "width=600, height=300");
}

//on click of tweet button
document.getElementById('twitter').addEventListener('click', () => {
    tweet(drinkDetails);
});



//on click of instagram button
document.getElementById('instagram',).addEventListener('click', () => {
    instagram();
});