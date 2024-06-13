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
    for (let [key, value] of formData.entries())

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
          }
          else {
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
    for (let [key, value] of formData.entries());
  
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
        } 
        else {
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

