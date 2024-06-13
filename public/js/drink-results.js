document.addEventListener("DOMContentLoaded", function () {
  const heartButtons = document.querySelectorAll(".heart-btn");

  heartButtons.forEach((button) => {
    button.addEventListener("click", function (event) {
      event.preventDefault();
      const heartIcon = this.querySelector("i");
  if (heartIcon.classList.contains("fa-regular")) {
        const drinkId = this.dataset.drinkId;
        fetch("/add-favorite", {
          method: "POST",
          body: JSON.stringify({ drink_id: drinkId }),
          headers: {
            "Content-Type": "application/json",
          },
        });
        heartIcon.classList.remove("fa-regular");
        heartIcon.classList.add("fa-solid");
        console.log("Favorite Added!");

  } else if (heartIcon.classList.contains("fa-solid")) {
        const drinkId = this.dataset.drinkId;
        fetch("/delete-favorite", {
          method: "DELETE",
          body: JSON.stringify({ drink_id: drinkId }),
          headers: {
            "Content-Type": "application/json",
          },
        });
        heartIcon.classList.remove("fa-solid");
        heartIcon.classList.add("fa-regular");
        console.log("Favorite Deleted!");
      }
    });
  });
});
