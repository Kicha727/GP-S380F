<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>個人資料</title>

    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

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
        <a class="navbar-brand" href="#">HKMU</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarCollapse" aria-controls="navbarCollapse"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-flex justify-content-between align-items-center" id="navbarCollapse">
            <ul class="navbar-nav" id="navMenu"></ul>
            <div class="d-flex align-items-center">
                <div class="dropdown me-2">
                    <button class="btn btn-outline-light dropdown-toggle" type="button" id="languageDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-globe"></i>   語言
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="languageDropdown">
                        <li><a class="dropdown-item" href="/personal-info">English</a></li>
                        <li><a class="dropdown-item active" href="/personal-info_zh">中文</a></li>
                    </ul>
                </div>
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
                        <h3 class="mb-0">個人頭像</h3>
                    </div>
                    <div class="card-body text-center">
                        <img id="profilePic" class="profile_img" src="assets/images/default-avatar.png" alt="个人头像">
                    </div>
                </div>
                <br>
                <div class="card shadow-sm">
                    <div class="card-header text-center">
                        <h3 class="mb-0">更新個人照片</h3>
                    </div>
                    <div class="card-body text-center">
                        <input type="file" id="profilePicUpload" accept="image/*" class="d-none">
                        <button id="uploadPhotoBtn" class="btn btn-primary w-100">上傳照片</button>
                        <button id="savePhotoBtn" class="btn btn-success w-100 mt-2">保存</button>
                    </div>
                </div>
            </div>

            <!-- User Info -->
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h3 class="mb-0">基本資料</h3>
                        <button id="editInfoBtn" class="btn btn-primary">編輯</button>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">

                            <c:if test="${sessionScope.userId != null && sessionScope.userRole == 'TEACHER'}">
                            <tr><th>教師編號</th><td><input type="text" id="studentId" disabled></td></tr>
                            </c:if>
                            <c:if test="${sessionScope.userId != null && sessionScope.userRole == 'STUDENT'}">
                            <tr><th>學生編號</th><td><input type="text" id="studentId" disabled></td></tr>
                            </c:if>
                            <tr><th>姓名</th><td><input type="text" id="studentName" disabled></td></tr>
                            <tr><th>課程名稱</th><td><input type="text" id="courseName" disabled></td></tr>
                            <tr><th>學年</th><td><input type="text" id="academicYear" disabled></td></tr>
                            <tr><th>性別</th><td><input type="text" id="gender" disabled></td></tr>
                            <tr><th>電話</th><td><input type="tel" id="phone" disabled></td></tr>
                            <tr><th>電郵</th><td><input type="email" id="email" disabled></td></tr>
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
                    alert("您必須登錄才能查看此頁面。");
                    window.location.href = "/login_zh";
                }
            });
            
        function setupUI(userData) {
            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link" href="/index_zh">首頁</a></li>
                <li class="nav-item"><a class="nav-link" href="/lectures_zh">課程資料</a></li>
                <li class="nav-item"><a class="nav-link" href="/polls/zh">投票</a></li>
                <li class="nav-item"><a class="nav-link active" href="/personal-info_zh">個人資料</a></li>
                <li class="nav-item"><a class="nav-link" href="/comments_zh">評論</a></li>
            `;
            authButton.textContent = "登出";
            authButton.classList.add("btn-danger");
            authButton.addEventListener("click", function () {
                localStorage.removeItem("user");
                window.location.href = "/logout_zh";
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
                editInfoBtn.textContent = "保存";
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
                    editInfoBtn.textContent = "編輯";
                    
                    alert("您的資料已更新！");
                })
                .catch(error => {
                    console.error('Error updating profile:', error);
                    alert("更新資料失敗。請重試。");
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
                    
                    alert("頭像更新成功！");
                })
                .catch(error => {
                    console.error('Error updating profile picture:', error);
                    alert("更新頭像失敗。請重試。");
                });
            }
        });
    });
</script>
</body>
</html> 