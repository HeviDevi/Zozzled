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
      if (loginForm.style.display === "none") {
        loginForm.style.display = "block";
        registerForm.style.display = "none";
        modalTitle.textContent = "Login";
        showRegisterBtn.textContent = "Register";
      } else {
        loginForm.style.display = "none";
        registerForm.style.display = "block";
        modalTitle.textContent = "Register";
        showRegisterBtn.textContent = "Back to Login";
      }
    });
  }

  // Continue as Guest script to hide modal when clicked
  guestBtn.addEventListener("click", () => {
    const myModalEl = document.querySelector(".modal");
    const modalInstance = bootstrap.Modal.getInstance(myModalEl);
    modalInstance.hide();
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
          const myModalEl = document.querySelector(".modal");
          const modalInstance = bootstrap.Modal.getInstance(myModalEl);
          modalInstance.hide();
          window.location.href = "/drink-search";
        } else {
          console.error("Registration failed");
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  });

  // Login form submission
  loginForm.addEventListener("submit", (event) => {
    event.preventDefault();
    console.log("Login form submitted");
    const formData = new FormData(loginForm);
    for (let [key, value] of formData.entries()) {
      console.log(`${key}: ${value}`);
    }

    // Send form data to server via fetch
    fetch("/login", {
      method: "POST",
      body: new URLSearchParams(formData),
    })
      .then((response) => {
        if (response.ok) {
          console.log("User logged in successfully");
          const myModalEl = document.querySelector(".modal");
          const modalInstance = bootstrap.Modal.getInstance(myModalEl);
          modalInstance.hide();
          window.location.href = "/drink-search";
        } else {
          console.error("Login failed");
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  });
});

document.addEventListener('DOMContentLoaded', function() {
  const searchButton = document.getElementById('searchButton');
  const searchInput = document.getElementById('searchInput');
  const spiritFilter = document.getElementById('spiritFilter');
  const spiritSlider = document.getElementById('spiritSlider');

  searchButton.addEventListener('click', function() {
      const searchTerm = searchInput.value; // Get the value of the search input
      const spiritType = spiritFilter.value; // Get the value of the spirit filter
      const sliderValue = spiritSlider.value; // Get the value of the slider
      let query = '/search?term=' + encodeURIComponent(searchTerm);

      if (spiritType) {
          query += '&spirit=' + encodeURIComponent(spiritType); // Add spirit type to the query
      }

      // Add bitter and sweet preferences to the query based on slider value
      if (sliderValue === '0') {
          query += '&bitter=true';
      } else if (sliderValue === '2') {
          query += '&sweet=true';
      }

      // Redirect to the search route with the updated query parameters
      window.location.href = query;
  });
});
