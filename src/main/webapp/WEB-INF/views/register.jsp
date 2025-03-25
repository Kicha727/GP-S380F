<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Inline CSS from register.css -->
    <style>
        html,
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            background-color: #f8f9fa;
        }

        .form-register .form-floating:focus-within {
            z-index: 2;
        }

        .form-register {
            max-width: 330px;
            padding: 1rem;
        }

        .form-register .form-floating input {
            border-radius: 0;
        }

        .form-register .form-floating:nth-of-type(1) input {
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .form-register .form-floating:last-of-type input {
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
            margin-bottom: 10px;
        }

        .form-floating {
            margin-bottom: -1px;
        }

        button {
            border-radius: 6px;
        }
    </style>
</head>
<body>
<main>
    <form id="registerForm" class="form-register w-100 m-auto">
        <h1 class="h3 mb-3 fw-normal text-center">Create an Account</h1>

        <div class="form-floating">
            <input type="text" class="form-control" id="floatingName" placeholder="Full Name" required>
            <label for="floatingName">Full Name</label>
        </div>
        <div class="form-floating">
            <input type="email" class="form-control" id="floatingEmail" placeholder="name@example.com" required>
            <label for="floatingEmail">Email address</label>
        </div>
        <div class="form-floating">
            <input type="tel" class="form-control" id="floatingPhone" placeholder="Phone Number" required>
            <label for="floatingPhone">Phone Number</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
            <label for="floatingPassword">Password</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingConfirmPassword" placeholder="Confirm Password" required>
            <label for="floatingConfirmPassword">Confirm Password</label>
        </div>

        <button class="btn btn-primary w-100 py-2 mt-2" type="submit">Register</button>

        <p class="mt-3 text-center">Already have an account?
            <a href="<%= request.getContextPath() %>/login">Sign in here</a>
        </p>
    </form>
</main>

<!-- JavaScript from register.js -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("registerForm").addEventListener("submit", function (event) {
            event.preventDefault(); // Prevents page reload

            const name = document.getElementById("floatingName").value;
            const email = document.getElementById("floatingEmail").value;
            const phone = document.getElementById("floatingPhone").value;
            const password = document.getElementById("floatingPassword").value;
            const confirmPassword = document.getElementById("floatingConfirmPassword").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match! Please enter the same password.");
                return;
            }

            const userData = {
                name: name,
                email: email,
                phone: phone,
                password: password
            };

            fetch("<%= request.getContextPath() %>/users/register", {
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
                    window.location.href = "<%= request.getContextPath() %>/login";
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("Registration failed. Please try again.");
                });
        });
    });
</script>
</body>
</html>
