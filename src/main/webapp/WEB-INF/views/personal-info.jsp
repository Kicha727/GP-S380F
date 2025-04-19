<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>

    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
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
            min-height: 75rem;
            padding-top: 4.5rem;
        }

        /* Navbar Styles */
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

        /* Auth Button Styles */
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

        #authButton:hover {
            background: linear-gradient(135deg, #059669, #047857) !important;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(5, 150, 105, 0.3);
        }

        #authButton.btn-danger {
            background: linear-gradient(135deg, #ef4444, #dc2626) !important;
        }

        #authButton.btn-danger:hover {
            background: linear-gradient(135deg, #dc2626, #b91c1c) !important;
            box-shadow: 0 4px 12px rgba(220, 38, 38, 0.3);
        }

        /* Rest of the styling */
        .card {
            border: none;
            border-radius: 0.8rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            overflow: hidden;
            background-color: var(--card-bg);
            margin-bottom: 1.5rem;
        }

        .card:hover {
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transform: translateY(-3px);
        }

        .card-header {
            background: linear-gradient(to right, rgba(37, 99, 235, 0.1), rgba(139, 92, 246, 0.1));
            padding: 1rem;
            border-bottom: 1px solid var(--border-color);
            font-weight: 600;
            color: var(--primary-color);
        }

        .card-header h3 {
            margin: 0;
            font-size: 1.2rem;
        }

        .profile_img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .profile_img:hover {
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .table {
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 0.5rem;
            overflow: hidden;
        }

        .table th {
            background-color: rgba(37, 99, 235, 0.05);
            font-weight: 600;
            width: 30%;
            color: var(--primary-color);
            border-color: var(--border-color);
        }

        .table td {
            background-color: white;
            border-color: var(--border-color);
        }

        table input {
            width: 100%;
            border: none;
            background: transparent;
            padding: 0.5rem;
            font-family: inherit;
            color: var(--text-color);
        }

        table input:focus {
            outline: none;
            background-color: rgba(37, 99, 235, 0.05);
            border-radius: 0.25rem;
        }

        table input:disabled {
            color: var(--text-muted);
            cursor: not-allowed;
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

        #editInfoBtn {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        #editInfoBtn:hover {
            background: linear-gradient(135deg, var(--accent-color), var(--secondary-color));
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(67, 56, 202, 0.3);
        }
    </style>
</head>
<body>

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
<section style="margin-top: 60px;">
    <div class="container">
        <div class="row">
            <!-- Profile Picture -->
            <div class="col-lg-4">
                <div class="card shadow-sm">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h3>Profile Picture</h3>
                    </div>
                    <div class="card-body text-center">
                        <img id="profilePic" class="profile_img" src="assets/images/default-avatar.png" alt="Profile Picture">
                    </div>
                </div>
                <br>
                <div class="card shadow-sm">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h3>Update Personal Photo</h3>
                    </div>
                    <div class="card-body text-center">
                        <input type="file" id="profilePicUpload" accept="image/*" class="d-none">
                        <button id="uploadPhotoBtn" class="btn btn-primary w-100">Upload Photo</button>
                        <button id="savePhotoBtn" class="btn btn-success w-100 mt-2">Save</button>
                    </div>
                </div>
            </div>

            <!-- User Info -->
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h3>General Information</h3>
                        <button id="editInfoBtn" class="btn btn-primary">Edit</button>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">

                            <c:if test="${sessionScope.userId != null && sessionScope.userRole == 'TEACHER'}">
                                <tr><th>Teacher ID</th><td><input type="text" id="studentId" disabled></td></tr>
                            </c:if>
                            <c:if test="${sessionScope.userId != null && sessionScope.userRole == 'STUDENT'}">
                                <tr><th>Student ID</th><td><input type="text" id="studentId" disabled></td></tr>
                            </c:if>
                            <tr><th>Name</th><td><input type="text" id="studentName" disabled></td></tr>
                            <tr><th>Course Name</th><td><input type="text" id="courseName" disabled></td></tr>
                            <tr><th>Academic Year</th><td><input type="text" id="academicYear" disabled></td></tr>
                            <tr><th>Gender</th><td><input type="text" id="gender" disabled></td></tr>
                            <tr><th>Phone</th><td><input type="tel" id="phone" disabled></td></tr>
                            <tr><th>Email</th><td><input type="email" id="email" disabled></td></tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- JavaScript: Navbar + Profile Logic -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Navbar setup similar to index.jsp
    document.addEventListener("DOMContentLoaded", function () {
        const userId = '<%= session.getAttribute("userId") %>';
        const navMenu = document.getElementById("navMenu");
        const authButton = document.getElementById("authButton");
        let userData = null;

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
            })
            .catch(error => {
                console.error('Authentication error:', error);

                // Fallback to localStorage if server check fails
                const userFromStorage = localStorage.getItem("user");
                if (userFromStorage) {
                    try {
                        // Try to parse user data if available
                        userData = JSON.parse(userFromStorage);
                    } catch (e) {
                        // If not a JSON object, just use it as a flag
                        userData = { authenticated: true };
                    }
                    setupUI(userData);
                    loadUserData(userData);
                } else {
                    // Redirect if not logged in
                    alert("You must be logged in to view this page.");
                    window.location.href = "/login";
                }
            });

        function setupUI(userData) {
            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link" href="/"><i class="fas fa-home me-1"></i> Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/lectures"><i class="fas fa-book me-1"></i> Course Materials</a></li>
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
            // Populate Fields if userData has properties
            if (userData.id) {
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
            } else {
                // If no data available, try to fetch from server
                fetch('/users/current')
                    .then(response => response.json())
                    .then(data => {
                        if (data && data.id) {
                            document.getElementById("studentId").value = data.id || '';
                            document.getElementById("studentName").value = data.name || '';
                            document.getElementById("courseName").value = data.course || '';
                            document.getElementById("academicYear").value = data.academicYear || '';
                            document.getElementById("gender").value = data.gender || '';
                            document.getElementById("phone").value = data.phone || '';
                            document.getElementById("email").value = data.email || '';
                            if (data.profilePic && data.profilePic.startsWith("data:image")) {
                                document.getElementById("profilePic").src = data.profilePic;
                            }
                        }
                    })
                    .catch(err => console.error("Error fetching user data:", err));
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
                editInfoBtn.textContent = "Save";
                courseName.focus();
            } else {
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
                        editInfoBtn.textContent = "Edit";

                        alert("Your information has been updated!");
                    })
                    .catch(error => {
                        console.error('Error updating profile:', error);
                        alert("Failed to update your information. Please try again.");
                    });
            }
        });

        // Photo upload functionality
        const uploadPhotoBtn = document.getElementById("uploadPhotoBtn");
        const profilePicUpload = document.getElementById("profilePicUpload");
        const savePhotoBtn = document.getElementById("savePhotoBtn");

        uploadPhotoBtn.addEventListener("click", function() {
            profilePicUpload.click();
        });

        profilePicUpload.addEventListener("change", function(e) {
            if (e.target.files && e.target.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById("profilePic").src = e.target.result;
                }
                reader.readAsDataURL(profilePicUpload.files[0]);
            }
        });

        savePhotoBtn.addEventListener("click", function() {
            const profilePicSrc = document.getElementById("profilePic").src;
            if (profilePicSrc !== "assets/images/default-avatar.png") {
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

                        alert("Profile picture updated successfully!");
                    })
                    .catch(error => {
                        console.error('Error updating profile picture:', error);
                        alert("Failed to update your profile picture. Please try again.");
                    });
            }
        });
    });
</script>
</body>
</html>