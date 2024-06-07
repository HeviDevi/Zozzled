window.addEventListener("DOMContentLoaded", () => {
  const modal = document.getElementById("register");
  const modalTitle = document.getElementById("modalTitle");
  const loginForm = document.getElementById("loginForm");
  const registerForm = document.getElementById("registerForm");
  const showRegisterBtn = document.getElementById("showRegisterBtn");
  const guestBtn = document.getElementById("guestBtn");

  if (modal) {
    const myModal = new bootstrap.Modal(modal);
    myModal.show();
  }

  if (showRegisterBtn) {
    showRegisterBtn.addEventListener("click", (event) => {
      event.preventDefault();
      console.log("Register button clicked");
      if (loginForm) loginForm.style.display = "none";
      if (registerForm) registerForm.style.display = "block";
      if (modalTitle) modalTitle.textContent = "Register";
    });
  }

  // Continue as Guest script to hide modal when clicked
  guestBtn.addEventListener("click", () => {
    const myModalEl = document.querySelector(".modal");
    const modal = bootstrap.Modal.getInstance(myModalEl);
    modal.hide();
  });

  window.addEventListener("click", (event) => {
    if (event.target === modal) {
      if (modal) modal.style.display = "none";
      if (loginForm) loginForm.style.display = "block";
      if (registerForm) registerForm.style.display = "none";
      if (modalTitle) modalTitle.textContent = "Login";
    }
  });

  // Debug form submission
  registerForm.addEventListener("submit", (event) => {
    event.preventDefault();
    console.log("Register form submitted");
    const formData = new FormData(registerForm);
    for (let [key, value] of formData.entries()) {
      console.log(`${key}: ${value}`);
    }

    // Send form data to server via fetch
    fetch("/register", {
      method: "POST",
      body: new URLSearchParams(formData),
    })
      .then((response) => {
        if (response.ok) {
          console.log("User registered successfully");
          window.location.href = "/drink-search";
        } else {
          console.error("Registration failed");
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  });
});

// Search Button script
const searchButton = document.querySelector(".search-btn");
if (searchButton) {
  searchButton.addEventListener("click", (event) => {
    event.preventDefault();
    window.location.href = "/drink-results";
  });
}
