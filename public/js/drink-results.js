document.addEventListener("DOMContentLoaded", function () {
  const heartButtons = document.querySelectorAll(".heart-btn");

  heartButtons.forEach((button) => {
    button.addEventListener("click", function (event) {
      event.preventDefault();
      const heartIcon = this.querySelector("i");
      const drinkId = this.dataset.drinkId;

      if (heartIcon.classList.contains("fa-regular")) {
        fetch("/add-favorite", {
          method: "POST",
          body: JSON.stringify({ drink_id: drinkId }),
          headers: {
            "Content-Type": "application/json",
          },
        })
          .then((response) => {
            if (response.ok) {
              heartIcon.classList.remove("fa-regular");
              heartIcon.classList.add("fa-solid");
              console.log("Favorite Added!");
            } else {
              console.error("Error adding favorite");
            }
          })
          .catch((error) => {
            console.error("Error:", error);
          });
      } else if (heartIcon.classList.contains("fa-solid")) {
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
