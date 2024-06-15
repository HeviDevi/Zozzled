// // Animation
for (let i = 0; i <= 6; i++) {
  let starShine = document.createElement('div');
  starShine.classList.add('star');
  let size = Math.random() * 50;
  starShine.style.fontSize = 10 + size + 'px';
  starShine.style.right = Math.random() * + innerWidth + 'px';
  starShine.style.top = Math.random() * + innerHeight + 'px';
  document.querySelector('.background').appendChild(starShine)
}

function animateStar() {
  let allStar = document.querySelectorAll('.star');
  let num = Math.floor(Math.random() * allStar.length);
  allStar[num].classList.toggle('animate');
}
setInterval(animateStar, 500);

// Start button script
const startButton = document.querySelector(".start-btn");

startButton.addEventListener("click", (event) => {
  event.preventDefault();
  window.location.href = "/drink-search";
});