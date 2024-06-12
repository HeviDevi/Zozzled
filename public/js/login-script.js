window.addEventListener("DOMContentLoaded", () => {
    const modal = document.getElementById("register");
    const modalTitle = document.getElementById("modalTitle");
    const loginForm = document.getElementById("loginForm");
    const registerForm = document.getElementById("registerForm");
    const showRegisterBtn = document.getElementById("showRegisterBtn");
    const guestBtn = document.getElementById("guestBtn");
    const loginRegisterLink = document.getElementById("loginRegisterLink");

    // Show modal when login/register link is clicked
    if (loginRegisterLink) {
    loginRegisterLink.addEventListener("click", (event) => {
        event.preventDefault();
        const myModal = new bootstrap.Modal(modal);
        myModal.show();
    });
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

    if (guestBtn) {
    guestBtn.addEventListener("click", () => {
        const myModalEl = document.querySelector(".modal");
        if (myModalEl) {
        const modalInstance = bootstrap.Modal.getInstance(myModalEl);
        modalInstance.hide();
        }
    });
    }

    window.addEventListener("click", (event) => {
    if (event.target === modal) {
        if (modal) modal.style.display = "none";
        if (loginForm) loginForm.style.display = "block";
        if (registerForm) registerForm.style.display = "none";
        if (modalTitle) modalTitle.textContent = "Login";
    }
    });

    registerForm.addEventListener("submit", (event) => {
    event.preventDefault();
    console.log("Register form submitted");
    const formData = new FormData(registerForm);

    fetch("/auth/register", {
        method: "POST",
        body: new URLSearchParams(formData),
    })
        .then((response) => {
        if (response.ok) {
            console.log("User registered successfully");
            const myModalEl = document.querySelector(".modal");
            if (myModalEl) {
            const modalInstance = bootstrap.Modal.getInstance(myModalEl);
            modalInstance.hide();
            }
        } else {
            console.error("Registration failed");
        }
        })
        .catch((error) => {
        console.error("Error:", error);
        });
    });

    loginForm.addEventListener("submit", (event) => {
    event.preventDefault();
    console.log("Login form submitted");
    const formData = new FormData(loginForm);

    fetch("/auth/login", {
        method: "POST",
        body: new URLSearchParams(formData),
    })
        .then((response) => {
        if (response.ok) {
            console.log("User logged in successfully");
            const myModalEl = document.querySelector(".modal");
            if (myModalEl) {
            const modalInstance = bootstrap.Modal.getInstance(myModalEl);
            modalInstance.hide();
            }
            window.location.reload(); // Reload the page to update the nav-bar
        } else {
            console.error("Login failed");
        }
        })
        .catch((error) => {
        console.error("Error:", error);
        });
    });
});