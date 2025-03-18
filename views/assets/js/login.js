document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("loginForm").addEventListener("submit", function (event) {
        event.preventDefault(); // Prevent page reload

        const email = document.getElementById("floatingEmail").value;
        const password = document.getElementById("floatingPassword").value;

        fetch("http://localhost:8080/users/login", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ email, password })
        })
        .then(response => {
            if (!response.ok) {
                throw new Error("Invalid email or password.");
            }
            return response.json();
        })
        .then(data => {
            localStorage.setItem("user", JSON.stringify(data));

            window.location.href = "index.html"; // Redirect to home page
        })
        .catch(error => {
            console.error("Error:", error);
            alert("Login failed. Check your credentials.");
        });
    });
});