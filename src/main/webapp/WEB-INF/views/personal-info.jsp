<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Profile - MUHK</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Embedded CSS -->
    <style>
        :root {
            --primary-color: #2563eb;
            --secondary-color: #4338ca;
            --accent-color: #8b5cf6;
            --background-color: #f8fafc;
            --card-bg: #ffffff;
            --text-color: #1e293b;
            --text-muted: #64748b;
            --border-color: #e2e8f0;
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
        }

        html, body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            min-height: 100vh;
        }

        body {
            padding-top: 5rem;
        }

        .navbar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 0.8rem 1.5rem;
        }

        .navbar-brand {
            font-weight: 700;
            letter-spacing: 1px;
            font-size: 1.5rem;
        }

        .nav-link {
            font-weight: 500;
            padding: 0.5rem 1rem !important;
            position: relative;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            color: rgba(255, 255, 255, 0.9) !important;
        }

        .nav-link.active::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 30px;
            height: 3px;
            background-color: white;
            border-radius: 3px;
        }

        .profile-container {
            max-width: 1000px;
            margin: 2rem auto;
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            position: relative;
            display: inline-block;
        }

        .section-title::after {
            content: "";
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 40px;
            height: 3px;
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border-radius: 2px;
        }

        .card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            overflow: hidden;
            background-color: var(--card-bg);
            margin-bottom: 1.5rem;
        }

        .card:hover {
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transform: translateY(-5px);
        }

        .card-header {
            background: linear-gradient(to right, rgba(37, 99, 235, 0.1), rgba(139, 92, 246, 0.1));
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-header h3 {
            font-weight: 600;
            font-size: 1.25rem;
            color: var(--primary-color);
            margin: 0;
        }

        .card-body {
            padding: 1.5rem;
        }

        .profile-image-container {
            position: relative;
            width: 180px;
            height: 180px;
            margin: 0 auto 1.5rem;
        }

        .profile-image {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .profile-image:hover {
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .profile-badge {
            position: absolute;
            bottom: 0;
            right: 10px;
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            border: 3px solid white;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .profile-badge:hover {
            transform: scale(1.1);
        }

        .upload-buttons {
            display: flex;
            gap: 0.75rem;
            margin-top: 1rem;
        }

        .btn {
            padding: 0.6rem 1.2rem;
            font-weight: 500;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border: none;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, var(--accent-color), var(--secondary-color));
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(67, 56, 202, 0.3);
        }

        .btn-success {
            background: linear-gradient(135deg, #10b981, #059669);
            border: none;
        }

        .btn-success:hover {
            background: linear-gradient(135deg, #059669, #047857);
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(5, 150, 105, 0.3);
        }

        .btn-outline-secondary {
            color: var(--text-muted);
            border: 2px solid var(--border-color);
            background-color: transparent;
        }

        .btn-outline-secondary:hover {
            background-color: var(--border-color);
            color: var(--text-color);
        }

        .info-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 0.5rem;
            overflow: hidden;
        }

        .info-table th,
        .info-table td {
            padding: 1rem;
            border: 1px solid var(--border-color);
        }

        .info-table th {
            background-color: rgba(37, 99, 235, 0.05);
            font-weight: 600;
            width: 30%;
            color: var(--primary-color);
        }

        .info-table td {
            background-color: white;
        }

        .info-table input {
            width: 100%;
            border: none;
            background: transparent;
            padding: 0.5rem;
            font-family: 'Poppins', sans-serif;
            color: var(--text-color);
            transition: all 0.3s ease;
        }

        .info-table input:focus {
            outline: none;
            background-color: rgba(37, 99, 235, 0.05);
            border-radius: 0.25rem;
        }

        .info-table input:disabled {
            color: var(--text-muted);
            cursor: not-allowed;
        }

        /* Icon for input fields */
        .field-icon {
            color: var(--primary-color);
            margin-right: 0.5rem;
            width: 20px;
            text-align: center;
        }

        /* Status badge */
        .status-badge {
            display: inline-block;
            padding: 0.35rem 0.75rem;
            border-radius: 50rem;
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .status-active {
            background-color: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        /* Activity indicators */
        .activity-indicator {
            display: flex;
            align-items: center;
            margin-bottom: 0.75rem;
            padding: 0.75rem;
            border-radius: 0.5rem;
            background-color: var(--card-bg);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            flex-shrink: 0;
        }

        .activity-icon.polls {
            background-color: rgba(37, 99, 235, 0.1);
            color: var(--primary-color);
        }

        .activity-icon.comments {
            background-color: rgba(139, 92, 246, 0.1);
            color: var(--accent-color);
        }

        .activity-content {
            flex-grow: 1;
        }

        .activity-title {
            font-weight: 600;
            font-size: 1rem;
            margin-bottom: 0.25rem;
        }

        .activity-date {
            font-size: 0.85rem;
            color: var(--text-muted);
        }

        .edit-mode-highlight {
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% {
                background-color: rgba(37, 99, 235, 0);
            }
            50% {
                background-color: rgba(37, 99, 235, 0.05);
            }
            100% {
                background-color: rgba(37, 99, 235, 0);
            }
        }

        #authButton {
            position: relative;
            z-index: 1050;
            margin-left: 10px;
            padding: 0.5rem 1.5rem;
            font-size: 0.9rem;
            font-weight: 600;
            color: white !important;
            background: linear-gradient(135deg, #10b981, #059669) !important;
            border: none !important;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        #authButton.btn-danger {
            background: linear-gradient(135deg, #ef4444, #dc2626) !important;
        }

        #authButton:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(5, 150, 105, 0.3);
        }

        #authButton.btn-danger:hover {
            box-shadow: 0 4px 12px rgba(220, 38, 38, 0.3);
        }

        /* Loading animation */
        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.8);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            visibility: hidden;
            opacity: 0;
            transition: visibility 0s, opacity 0.3s linear;
        }

        .loading-overlay.show {
            visibility: visible;
            opacity: 1;
        }

        .loading-spinner {
            width: 50px;
            height: 50px;
            border: 5px solid rgba(37, 99, 235, 0.2);
            border-radius: 50%;
            border-top-color: var(--primary-color);
            animation: spin 1s ease-in-out infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* Toast notifications */
        .toast-container {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 9999;
        }

        .toast {
            opacity: 0;
            margin-bottom: 10px;
            transform: translateX(100%);
            transition: all 0.3s ease;
            min-width: 300px;
        }

        .toast.show {
            opacity: 1;
            transform: translateX(0);
        }

        .toast-success {
            background-color: rgba(16, 185, 129, 0.1);
            border-left: 4px solid #10b981;
        }

        .toast-error {
            background-color: rgba(239, 68, 68, 0.1);
            border-left: 4px solid #ef4444;
        }
    </style>
</head>
<body>
    <!-- Loading Overlay -->
    <div class="loading-overlay" id="loadingOverlay">
        <div class="loading-spinner"></div>
    </div>

    <!-- Toast Container -->
    <div class="toast-container" id="toastContainer"></div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">MUHK</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse" aria-controls="navbarCollapse"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0" id="navMenu"></ul>
                <div class="d-flex align-items-center">
                    <button id="authButton" class="btn"></button>
                </div>
            </div>
        </div>
    </nav>

    <!-- Profile Content -->
    <div class="container profile-container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/"><i class="fas fa-home me-1"></i>Home</a></li>
                        <li class="breadcrumb-item active"><i class="fas fa-user me-1"></i>Personal Profile</li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="row">
            <!-- Profile Picture & Status -->
            <div class="col-lg-4">
                <!-- Profile Picture Card -->
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-user-circle me-2"></i>Profile Picture</h3>
                    </div>
                    <div class="card-body text-center">
                        <div class="profile-image-container">
                            <img id="profilePic" class="profile-image" src="assets/images/default-avatar.png" alt="Profile Picture">
                            <div class="profile-badge" id="triggerUpload">
                                <i class="fas fa-camera"></i>
                            </div>
                        </div>
                        
                        <div class="status-badge status-active mb-3">
                            <i class="fas fa-check-circle me-1"></i> Active Student
                        </div>
                        
                        <input type="file" id="profilePicUpload" accept="image/*" class="d-none">
                        
                        <div class="upload-buttons">
                            <button id="uploadPhotoBtn" class="btn btn-primary w-100">
                                <i class="fas fa-upload me-2"></i>Choose Photo
                            </button>
                            <button id="savePhotoBtn" class="btn btn-success w-100">
                                <i class="fas fa-save me-2"></i>Save
                            </button>
                        </div>
                    </div>
                </div>
                
                <!-- Recent Activity Card -->
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-chart-line me-2"></i>Recent Activity</h3>
                    </div>
                    <div class="card-body">
                        <div class="activity-indicator">
                            <div class="activity-icon polls">
                                <i class="fas fa-poll"></i>
                            </div>
                            <div class="activity-content">
                                <div class="activity-title">Created a new poll</div>
                                <div class="activity-date">3 days ago</div>
                            </div>
                        </div>
                        
                        <div class="activity-indicator">
                            <div class="activity-icon comments">
                                <i class="fas fa-comment-alt"></i>
                            </div>
                            <div class="activity-content">
                                <div class="activity-title">Posted a new comment</div>
                                <div class="activity-date">1 week ago</div>
                            </div>
                        </div>
                        
                        <div class="text-center mt-3">
                            <a href="#" class="btn btn-outline-secondary">
                                <i class="fas fa-history me-2"></i>View All Activity
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- User Information -->
            <div class="col-lg-8">
                <!-- General Information Card -->
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-id-card me-2"></i>General Information</h3>
                        <button id="editInfoBtn" class="btn btn-primary">
                            <i class="fas fa-edit me-2"></i>Edit
                        </button>
                    </div>
                    <div class="card-body">
                        <table class="info-table">
                            <c:if test="${sessionScope.userId != null && sessionScope.userRole == 'TEACHER'}">
                            <tr>
                                <th><span class="field-icon"><i class="fas fa-id-badge"></i></span> Teacher ID</th>
                                <td><input type="text" id="studentId" disabled></td>
                            </tr>
                            </c:if>
                            <c:if test="${sessionScope.userId != null && sessionScope.userRole == 'STUDENT'}">
                            <tr>
                                <th><span class="field-icon"><i class="fas fa-id-badge"></i></span> Student ID</th>
                                <td><input type="text" id="studentId" disabled></td>
                            </tr>
                            </c:if>
                            <tr>
                                <th><span class="field-icon"><i class="fas fa-user"></i></span> Full Name</th>
                                <td><input type="text" id="studentName" disabled></td>
                            </tr>
                            <tr>
                                <th><span class="field-icon"><i class="fas fa-graduation-cap"></i></span> Course Name</th>
                                <td><input type="text" id="courseName" disabled></td>
                            </tr>
                            <tr>
                                <th><span class="field-icon"><i class="fas fa-calendar-alt"></i></span> Academic Year</th>
                                <td><input type="text" id="academicYear" disabled></td>
                            </tr>
                            <tr>
                                <th><span class="field-icon"><i class="fas fa-venus-mars"></i></span> Gender</th>
                                <td><input type="text" id="gender" disabled></td>
                            </tr>
                        </table>
                    </div>
                </div>
                
                <!-- Contact Information Card -->
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-address-book me-2"></i>Contact Information</h3>
                    </div>
                    <div class="card-body">
                        <table class="info-table">
                            <tr>
                                <th><span class="field-icon"><i class="fas fa-phone"></i></span> Phone</th>
                                <td><input type="tel" id="phone" disabled></td>
                            </tr>
                            <tr>
                                <th><span class="field-icon"><i class="fas fa-envelope"></i></span> Email</th>
                                <td><input type="email" id="email" disabled></td>
                            </tr>
                        </table>
                    </div>
                </div>
                
                <!-- Account Security Card -->
                <div class="card">
                    <div class="card-header">
                        <h3><i class="fas fa-shield-alt me-2"></i>Account Security</h3>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div>
                                <h5 class="mb-1">Password</h5>
                                <p class="text-muted mb-0">Last changed: 3 months ago</p>
                            </div>
                            <button class="btn btn-outline-secondary">
                                <i class="fas fa-key me-2"></i>Change Password
                            </button>
                        </div>
                        
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="mb-1">Two-Factor Authentication</h5>
                                <p class="text-muted mb-0">Add an extra layer of security</p>
                            </div>
                            <button class="btn btn-outline-secondary">
                                <i class="fas fa-lock me-2"></i>Enable
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript: Navbar + Profile Logic -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Navbar setup
        document.addEventListener("DOMContentLoaded", function () {
            const navMenu = document.getElementById("navMenu");
            const authButton = document.getElementById("authButton");
            const loadingOverlay = document.getElementById("loadingOverlay");
            let userData = null;
            
            // Show loading overlay
            function showLoading() {
                loadingOverlay.classList.add("show");
            }
            
            // Hide loading overlay
            function hideLoading() {
                loadingOverlay.classList.remove("show");
            }
            
            // Show toast notification
            function showToast(message, type = 'success') {
                const toastContainer = document.getElementById('toastContainer');
                const toast = document.createElement('div');
                toast.className = `toast ${type === 'success' ? 'toast-success' : 'toast-error'} p-3`;
                
                const icon = type === 'success' ? 'check-circle' : 'exclamation-circle';
                toast.innerHTML = `
                    <div class="d-flex align-items-center">
                        <i class="fas fa-${icon} me-2" style="font-size: 1.25rem;"></i>
                        <div>${message}</div>
                    </div>
                    <button type="button" class="btn-close ms-auto" aria-label="Close"></button>
                `;
                
                toastContainer.appendChild(toast);
                
                // Trigger reflow to enable transition
                toast.offsetHeight;
                
                toast.classList.add('show');
                
                // Add event listener to close button
                toast.querySelector('.btn-close').addEventListener('click', function() {
                    toast.classList.remove('show');
                    setTimeout(() => {
                        toast.remove();
                    }, 300);
                });
                
                // Auto hide after 5 seconds
                setTimeout(() => {
                    toast.classList.remove('show');
                    setTimeout(() => {
                        toast.remove();
                    }, 300);
                }, 5000);
            }
            
            showLoading();
            
            // Check session for user info
            fetch('/users/current')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Not authenticated');
                    }
                    return response.json();
                })
                .then(user => {
                    userData = user;
                    setupUI(userData);
                    loadUserData(userData);
                    hideLoading();
                })
                .catch(error => {
                    console.error('Authentication error:', error);
                    
                    // Fallback to localStorage if server check fails
                    const userFromStorage = localStorage.getItem("user");
                    if (userFromStorage) {
                        try {
                            userData = JSON.parse(userFromStorage);
                            setupUI(userData);
                            loadUserData(userData);
                        } catch (e) {
                            console.error('Error parsing user data:', e);
                            redirectToLogin();
                        }
                    } else {
                        redirectToLogin();
                    }
                    hideLoading();
                });
                
            function redirectToLogin() {
                showToast('You must be logged in to view this page.', 'error');
                setTimeout(() => {
                    window.location.href = "/login";
                }, 2000);
            }
                
            function setupUI(userData) {
                navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/"><i class="fas fa-home me-1"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/course"><i class="fas fa-book me-1"></i> Course Material</a></li>
                    <li class="nav-item"><a class="nav-link" href="/polls"><i class="fas fa-poll me-1"></i> Polls</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/personal-info"><i class="fas fa-user me-1"></i> Personal Info</a></li>
                    <li class="nav-item"><a class="nav-link" href="/comments"><i class="fas fa-comments me-1"></i> Comments</a></li>
                `;
                authButton.textContent = "Logout";
                authButton.classList.add("btn-danger");
                authButton.addEventListener("click", function () {
                    localStorage.removeItem("user");
                    window.location.href = "/logout";
                });
            }
            
            function loadUserData(userData) {
                // Populate Fields
                document.getElementById("studentId").value = userData.id || '';
                document.getElementById("studentName").value = userData.name || '';
                document.getElementById("courseName").value = userData.course || '';
                document.getElementById("academicYear").value = userData.academicYear || '';
                document.getElementById("gender").value = userData.gender || '';
                document.getElementById("phone").value = userData.phone || '';
                document.getElementById("email").value = userData.email || '';
                if (userData.profilePic && userData.profilePic.startsWith("data:image")) {
                    document.getElementById("profilePic").src = userData.profilePic;
                }
            }
            
            // Edit Profile functionality
            const editInfoBtn = document.getElementById("editInfoBtn");
            editInfoBtn.addEventListener("click", function() {
                const courseName = document.getElementById("courseName");
                const academicYear = document.getElementById("academicYear");
                const gender = document.getElementById("gender");
                
                if (courseName.disabled) {
                    // Enable editing
                    courseName.disabled = false;
                    academicYear.disabled = false;
                    gender.disabled = false;
                    editInfoBtn.innerHTML = '<i class="fas fa-save me-2"></i>Save';
                    
                    // Add visual indicator for editable fields
                    courseName.parentElement.classList.add('edit-mode-highlight');
                    academicYear.parentElement.classList.add('edit-mode-highlight');
                    gender.parentElement.classList.add('edit-mode-highlight');
                    
                    courseName.focus();
                    showToast('You can now edit your information. Click Save when done.', 'success');
                } else {
                    showLoading();
                    
                    // Prepare updated data
                    const updatedData = {
                        id: document.getElementById("studentId").value,
                        course: courseName.value,
                        academicYear: academicYear.value,
                        gender: gender.value
                    };
                    
                    // Send data to server
                    fetch('/users/update', {
                        method: 'PUT',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(updatedData)
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Failed to update profile');
                        }
                        return response.json();
                    })
                    .then(updatedUser => {
                        // Update local storage with new data
                        const storedUser = JSON.parse(localStorage.getItem("user") || "{}");
                        storedUser.course = updatedUser.course;
                        storedUser.academicYear = updatedUser.academicYear;
                        storedUser.gender = updatedUser.gender;
                        localStorage.setItem("user", JSON.stringify(storedUser));
                        
                        // Disable fields
                        courseName.disabled = true;
                        academicYear.disabled = true;
                        gender.disabled = true;
                        editInfoBtn.innerHTML = '<i class="fas fa-edit me-2"></i>Edit';
                        
                        // Remove visual indicator
                        courseName.parentElement.classList.remove('edit-mode-highlight');
                        academicYear.parentElement.classList.remove('edit-mode-highlight');
                        gender.parentElement.classList.remove('edit-mode-highlight');
                        
                        hideLoading();
                        showToast('Your information has been updated successfully!', 'success');
                    })
                    .catch(error => {
                        console.error('Error updating profile:', error);
                        hideLoading();
                        showToast('Failed to update your information. Please try again.', 'error');
                    });
                }
            });
            
            // Photo upload functionality
            const uploadPhotoBtn = document.getElementById("uploadPhotoBtn");
            const profilePicUpload = document.getElementById("profilePicUpload");
            const savePhotoBtn = document.getElementById("savePhotoBtn");
            const triggerUpload = document.getElementById("triggerUpload");
            
            uploadPhotoBtn.addEventListener("click", function() {
                profilePicUpload.click();
            });
            
            triggerUpload.addEventListener("click", function() {
                profilePicUpload.click();
            });
            
            profilePicUpload.addEventListener("change", function(e) {
                if (e.target.files && e.target.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        document.getElementById("profilePic").src = e.target.result;
                        showToast('Photo selected. Click Save to update your profile picture.', 'success');
                    }
                    reader.readAsDataURL(profilePicUpload.files[0]);
                }
            });
            
            savePhotoBtn.addEventListener("click", function() {
                const profilePicSrc = document.getElementById("profilePic").src;
                if (profilePicSrc !== "assets/images/default-avatar.png") {
                    showLoading();
                    
                    // Prepare data to send
                    const photoData = {
                        id: document.getElementById("studentId").value,
                        profilePic: profilePicSrc
                    };
                    
                    // Send data to server
                    fetch('/users/updateProfilePic', {
                        method: 'PUT',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(photoData)
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Failed to update profile picture');
                        }
                        return response.json();
                    })
                    .then(updatedUser => {
                        // Update local storage with new data
                        const storedUser = JSON.parse(localStorage.getItem("user") || "{}");
                        storedUser.profilePic = updatedUser.profilePic;
                        localStorage.setItem("user", JSON.stringify(storedUser));
                        
                        hideLoading();
                        showToast('Profile picture updated successfully!', 'success');
                    })
                    .catch(error => {
                        console.error('Error updating profile picture:', error);
                        hideLoading();
                        showToast('Failed to update your profile picture. Please try again.', 'error');
                    });
                } else {
                    showToast('Please select a profile picture first.', 'error');
                }
            });
        });
    </script>
</body>
</html>