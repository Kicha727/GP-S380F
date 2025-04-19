<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
        html, body {
            height: 100%;
        }

        body {
            padding-top: 4.5rem;
            background-color: #f5f5f5;
        }

        .form-register {
            max-width: 400px;
            padding: 1rem;
            margin: 0 auto;
        }

        .form-register .form-floating input,
        .form-register .form-select {
            border-radius: 0;
            margin-bottom: -1px;
        }

        .form-register .form-floating:first-of-type input {
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .form-register .form-floating:last-of-type input,
        .form-register .form-floating:last-of-type select {
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
            margin-bottom: 10px;
        }

        button {
            border-radius: 6px;
        }
        
        .alert {
            margin-bottom: 15px;
        }
        
        #authButton {
            position: relative;
            z-index: 1050;
            margin-left: 10px;
            padding: 6px 12px;
            font-size: 16px;
            color: white !important;
            background-color: #198754 !important;
            border-color: #198754 !important;
        }
        #authButton:hover {
            background-color: #157347 !important;
            border-color: #146c43 !important;
        }
    </style>
</head>
<body class="text-center">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">MUHK</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse" aria-controls="navbarCollapse"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0" id="navMenu"></ul>
                <div class="d-flex">
                    <button id="authButton" class="btn btn-outline-success"></button>
                </div>
            </div>
        </div>
    </nav>

    <main>
        <form action="/register" method="post" class="form-register w-100 m-auto">
            <img class="mb-4" src="https://muhk.edu.hk/wp-content/uploads/2022/04/logo_symbol.png" alt="MUHK Logo" width="72" height="57">
            <h1 class="h3 mb-3 fw-normal">Create an Account</h1>
            
            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>
            </c:if>

            <div class="form-floating">
                <input type="text" class="form-control" id="name" name="name" placeholder="Full Name" required>
                <label for="name">Full Name</label>
            </div>
            <div class="form-floating">
                <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
                <label for="email">Email address</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                <label for="password">Password</label>
            </div>
            <div class="form-floating">
                <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone Number" required>
                <label for="phone">Phone Number</label>
            </div>
            <div class="form-floating">
                <input type="text" class="form-control" id="course" name="course" placeholder="Course" required>
                <label for="course">Course</label>
            </div>
            <div class="form-floating">
                <select class="form-select" id="academicYear" name="academicYear" required>
                    <option value="">Select Academic Year</option>
                    <option value="2023-2024">2023-2024</option>
                    <option value="2024-2025">2024-2025</option>
                    <option value="2025-2026">2025-2026</option>
                </select>
                <label for="academicYear">Academic Year</label>
            </div>
            <div class="form-floating">
                <select class="form-select" id="gender" name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
                <label for="gender">Gender</label>
            </div>

            <button class="btn btn-primary w-100 py-2 mt-2" type="submit">Register</button>

            <p class="mt-3">Already have an account? <a href="/login">Sign in here</a></p>
            <p class="mt-5 mb-3 text-body-secondary">&copy; 2025 MUHK Polling System</p>
        </form>
    </main>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Navigation and authentication
        document.addEventListener("DOMContentLoaded", function () {
            const navMenu = document.getElementById("navMenu");
            const authButton = document.getElementById("authButton");

            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/polls">Polls</a></li>
            `;
            authButton.textContent = "Login";
            authButton.classList.add("btn-success");
            authButton.addEventListener("click", function () {
                window.location.href = "/login";
            });
        });
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
