<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Inline CSS from sign-in.css -->
    <style>
        html, body {
            height: 100%;
        }

        .form-signin {
            max-width: 330px;
            padding: 1rem;
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">

<main class="form-signin w-100 m-auto">
    <form id="loginForm">
        <h1 class="h3 mb-3 fw-normal text-center">Please sign in</h1>

        <div class="form-floating">
            <input type="email" class="form-control" id="floatingEmail" placeholder="name@example.com" required>
            <label for="floatingEmail">Email address</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
            <label for="floatingPassword">Password</label>
        </div>

        <div class="d-flex justify-content-between align-items-center mt-3">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                    Remember me
                </label>
            </div>
            <a href="teacherLogin" class="text-decoration-none">Teacher Login</a>
        </div>

        <button class="btn btn-primary w-100 py-2 mt-3" type="submit">Sign in</button>
    </form>

    <p class="mt-3 text-center">Don't have an account? <a href="register">Register here</a></p>
</main>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Inline JavaScript from login.js -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("loginForm").addEventListener("submit", function (event) {
            event.preventDefault(); // Prevent page reload

            const email = document.getElementById("floatingEmail").value;
            const password = document.getElementById("floatingPassword").value;

            fetch("<%= request.getContextPath() %>/users/login", {
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
                    window.location.href = "<%= request.getContextPath() %>/";
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("Login failed. Check your credentials.");
                });
        });
    });
</script>

</body>
</html>
