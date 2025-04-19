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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" rel="stylesheet">

    <!-- Embedded profile.css + navbar-fixed.css -->
    <style>
        html, body {
            height: 100vh;
            overflow: hidden;
            margin: 0;
            padding: 0;
            min-height: 75rem;
            padding-top: 4.5rem;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .profile_img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
        }
        table input {
            width: 100%;
            border: none;
            background: transparent;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        #editInfoBtn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
        }
        #editInfoBtn:hover {
            background-color: #0056b3;
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

<!-- Dynamic Navbar -->
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

<!-- Profile Content -->
<section style="margin-top: 80px;">
    <div class="container">
        <div class="row">
            <!-- Profile Picture -->
            <div class="col-lg-4">
                <div class="card shadow-sm">
                    <div class="card-header text-center">
                        <h3 class="mb-0">Profile Picture</h3>
                    </div>
                    <div class="card-body text-center">
                        <img id="profilePic" class="profile_img" src="assets/images/default-avatar.png" alt="Profile Picture">
                    </div>
                </div>
                <br>
                <div class="card shadow-sm">
                    <div class="card-header text-center">
                        <h3 class="mb-0">Update Personal Photo</h3>
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
                        <h3 class="mb-0">General Information</h3>
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
    // Navbar setup
    document.addEventListener("DOMContentLoaded", function () {
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
                    userData = JSON.parse(userFromStorage);
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
                <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/course">Course Material</a></li>
                <li class="nav-item"><a class="nav-link" href="/polls">Polls</a></li>
                <li class="nav-item"><a class="nav-link active" href="/personal-info">Personal Info</a></li>
                <li class="nav-item"><a class="nav-link" href="/comments">Comments</a></li>
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
