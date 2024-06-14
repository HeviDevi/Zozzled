window.addEventListener("DOMContentLoaded", () => {
    const modal = document.getElementById("register");
    const modalTitle = document.getElementById("modalTitle");
    const loginForm = document.getElementById("loginForm");
    const registerForm = document.getElementById("registerForm");
    const showRegisterBtn = document.getElementById("showRegisterBtn");
    const guestBtn = document.getElementById("guestBtn");
    const loginRegisterLink = document.getElementById("loginRegisterLink");
    const loginError = document.getElementById('loginError');
    const registerError = document.getElementById('registerError');
    const loginSuccessMessage = document.getElementById('loginSuccessMessage'); // New element for success message

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
        const formData = new FormData(registerForm);

        fetch("/auth/register", {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(Object.fromEntries(formData)),
        })
        .then((response) => response.json())
        .then((result) => {
            if (result.error) {
                registerError.textContent = result.error;
                registerError.style.display = 'block';
            } else {
                console.log("User registered successfully");
                loginForm.style.display = "block";
                registerForm.style.display = "none";
                modalTitle.textContent = "Login";
                showRegisterBtn.textContent = "Register";
                loginSuccessMessage.textContent = 'Registration successful, please login.'; // Show success message
                loginSuccessMessage.style.display = 'block'; // Show success message
                registerError.style.display = 'none';
            }
        })
        .catch((error) => {
            console.error("Error:", error);
            registerError.textContent = 'An error occurred. Please try again.';
            registerError.style.display = 'block';
        });
    });

    loginForm.addEventListener("submit", (event) => {
        event.preventDefault();
        const formData = new FormData(loginForm);

        fetch("/auth/login", {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(Object.fromEntries(formData)),
        })
        .then((response) => response.json())
        .then((result) => {
            if (result.error) {
                loginError.textContent = result.error;
                loginError.style.display = 'block';
            } else {
                console.log("User logged in successfully");
                const myModalEl = document.querySelector(".modal");
                if (myModalEl) {
                    const modalInstance = bootstrap.Modal.getInstance(myModalEl);
                    modalInstance.hide();
                }
                loginError.style.display = 'none';
                window.location.reload(); // Reload the page to update the nav-bar
            }
        })
        .catch((error) => {
            console.error("Error:", error);
            loginError.textContent = 'An error occurred. Please try again.';
            loginError.style.display = 'block';
        });
    });
});