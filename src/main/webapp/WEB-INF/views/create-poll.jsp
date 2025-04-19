<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Poll</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 75rem;
            padding-top: 4.5rem;
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
<body>
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

    <div class="container mt-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item"><a href="/polls">Polls</a></li>
                <li class="breadcrumb-item active">Create New Poll</li>
            </ol>
        </nav>
        
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h1 class="h3 mb-0">Create New Poll</h1>
            </div>
            <div class="card-body">
                <form action="/polls/create" method="post">
                    <div class="mb-3">
                        <label for="question" class="form-label">Poll Question</label>
                        <input type="text" class="form-control" id="question" name="question" 
                               placeholder="Enter your poll question" required>
                        <div class="form-text">Example: "When would you prefer to have the midterm exam?"</div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Poll Options</label>
                        <p class="form-text mb-2">You must provide exactly 4 options for your poll.</p>
                        
                        <div class="input-group mb-2">
                            <span class="input-group-text">1</span>
                            <input type="text" class="form-control" name="option1" 
                                   placeholder="Option 1" required>
                        </div>
                        
                        <div class="input-group mb-2">
                            <span class="input-group-text">2</span>
                            <input type="text" class="form-control" name="option2" 
                                   placeholder="Option 2" required>
                        </div>
                        
                        <div class="input-group mb-2">
                            <span class="input-group-text">3</span>
                            <input type="text" class="form-control" name="option3" 
                                   placeholder="Option 3" required>
                        </div>
                        
                        <div class="input-group mb-2">
                            <span class="input-group-text">4</span>
                            <input type="text" class="form-control" name="option4" 
                                   placeholder="Option 4" required>
                        </div>
                    </div>
                    
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <a href="/polls" class="btn btn-outline-secondary me-md-2">Cancel</a>
                        <button type="submit" class="btn btn-primary">Create Poll</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Navigation and authentication
        document.addEventListener("DOMContentLoaded", function () {
            const user = localStorage.getItem("user");
            const navMenu = document.getElementById("navMenu");
            const authButton = document.getElementById("authButton");

            if (user) {
                navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/course">Course Material</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/polls">Polls</a></li>
                    <li class="nav-item"><a class="nav-link" href="/personal-info">Personal Info</a></li>
                    <li class="nav-item"><a class="nav-link" href="/comments">Comments</a></li>
                `;
                authButton.textContent = "Logout";
                authButton.classList.add("btn-danger");
                authButton.addEventListener("click", function () {
                    localStorage.removeItem("user");
                    window.location.href = "/login";
                });
            } else {
                navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/polls">Polls</a></li>
                `;
                authButton.textContent = "Login";
                authButton.classList.add("btn-success");
                authButton.addEventListener("click", function () {
                    window.location.href = "/login";
                });
            }
        });
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 