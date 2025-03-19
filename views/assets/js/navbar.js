document.addEventListener("DOMContentLoaded", function () {
    const user = localStorage.getItem("user"); // Check if user is logged in
    const navMenu = document.getElementById("navMenu");
    const authButton = document.getElementById("authButton");

    if (user) {
        //  User is logged in → Show full menu
        navMenu.innerHTML = `
            <li class="nav-item"><a class="nav-link active" href="index.html">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="course.html">Course Material</a></li>
            <li class="nav-item"><a class="nav-link" href="poll.html">Poll</a></li>
            <li class="nav-item"><a class="nav-link" href="personal-info.html">Personal Info</a></li>
            <li class="nav-item"><a class="nav-link" href="comments.html">Comments</a></li>
        `;
        authButton.textContent = "Logout";
        authButton.classList.add("btn-danger");
        authButton.addEventListener("click", function () {
            localStorage.removeItem("user"); // Remove user session
            window.location.href = "login.html"; // Redirect to login page
        });
    } else {
        // User is NOT logged in → Show limited menu
        navMenu.innerHTML = `
            <li class="nav-item"><a class="nav-link active" href="index.html">Home</a></li>
        `;
        authButton.textContent = "Login";
        authButton.classList.add("btn-success");
        authButton.addEventListener("click", function () {
            window.location.href = "login.html"; // Redirect to login page
        });
    }
});
