document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("registerForm").addEventListener("submit", function (event) {
        event.preventDefault(); // Prevents page reload

      // Get user inputs
      const name = document.getElementById("floatingName").value;
      const email = document.getElementById("floatingEmail").value;
      const phone = document.getElementById("floatingPhone").value;
      const password = document.getElementById("floatingPassword").value;
      const confirmPassword = document.getElementById("floatingConfirmPassword").value;
      
      // Check if passwords match before sending data
      if (password !== confirmPassword) {
          alert("Passwords do not match! Please enter the same password.");
          return;
      }

      // Create user data object
      const userData = {
        name: name,
        email: email,
        phone: phone,
        password: password  
    };

        fetch("http://localhost:8080/users/register", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(userData)
        })
        .then(response => {
            if (!response.ok) {
                throw new Error("Failed to register user.");
            }
            return response.json();
        })
        .then(data => {
            alert("User registered successfully!");
            window.location.href = "login.html"; // Redirect after success
        })
        .catch(error => {
            console.error("Error:", error);
            alert("Registration failed. Please try again.");
        });
    });
});