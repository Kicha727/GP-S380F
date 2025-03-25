<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>

    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarCollapse" aria-controls="navbarCollapse"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-flex justify-content-between align-items-center" id="navbarCollapse">
            <ul class="navbar-nav" id="navMenu"></ul>
            <button id="authButton" class="btn btn-outline-success"></button>
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
                            <tr><th>Student ID</th><td><input type="text" id="studentId" disabled></td></tr>
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
<script>
    // Navbar setup
    document.addEventListener("DOMContentLoaded", function () {
        const user = JSON.parse(localStorage.getItem("user"));
        const navMenu = document.getElementById("navMenu");
        const authButton = document.getElementById("authButton");

        if (user) {
            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/course">Course Material</a></li>
                <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/poll">Poll</a></li>
                <li class="nav-item"><a class="nav-link active" href="<%= request.getContextPath() %>/personal-info">Personal Info</a></li>
                <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/comments">Comments</a></li>
            `;
            authButton.textContent = "Logout";
            authButton.classList.add("btn-danger");
            authButton.onclick = () => {
                localStorage.removeItem("user");
                window.location.href = "<%= request.getContextPath() %>/login";
            };
        } else {
            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/">Home</a></li>
            `;
            authButton.textContent = "Login";
            authButton.classList.add("btn-success");
            authButton.onclick = () => {
                window.location.href = "<%= request.getContextPath() %>/login";
            };
        }

        // Personal Info Page Logic
        if (!user) {
            alert("You must be logged in to view this page.");
            window.location.href = "<%= request.getContextPath() %>/login";
            return;
        }

        // Populate Fields
        const setField = (id, val) => document.getElementById(id).value = val || '';
        setField("studentId", user.id);
        setField("studentName", user.name);
        setField("courseName", user.course);
        setField("academicYear", user.academicYear);
        setField("gender", user.gender);
        setField("phone", user.phone);
        setField("email", user.email);
        if (user.profilePic?.startsWith("data:image")) {
            document.getElementById("profilePic").src = user.profilePic;
        }

        // Edit Button
        const editBtn = document.getElementById("editInfoBtn");
        editBtn.addEventListener("click", () => {
            const editing = editBtn.textContent === "Save";
            ["courseName", "academicYear", "gender"].forEach(id => {
                document.getElementById(id).disabled = editing;
            });
            editBtn.textContent = editing ? "Edit" : "Save";

            if (editing) {
                fetch("<%= request.getContextPath() %>/users/update", {
                    method: "PUT",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({
                        id: user.id,
                        course: document.getElementById("courseName").value,
                        academicYear: document.getElementById("academicYear").value,
                        gender: document.getElementById("gender").value
                    })
                })
                    .then(res => res.json())
                    .then(data => {
                        alert("Profile updated!");
                        localStorage.setItem("user", JSON.stringify(data));
                        location.reload();
                    })
                    .catch(() => alert("Failed to update."));
            }
        });

        // Upload Picture
        const fileInput = document.getElementById("profilePicUpload");
        document.getElementById("uploadPhotoBtn").onclick = () => fileInput.click();

        fileInput.addEventListener("change", event => {
            const file = event.target.files[0];
            if (!file) return;
            const reader = new FileReader();
            reader.onload = e => {
                const base64 = e.target.result;
                localStorage.setItem("newProfilePic", base64);
                document.getElementById("profilePic").src = base64;
            };
            reader.readAsDataURL(file);
        });

        // Save Picture
        document.getElementById("savePhotoBtn").addEventListener("click", () => {
            const base64 = localStorage.getItem("newProfilePic");
            if (!base64) return alert("Upload an image first.");
            fetch("<%= request.getContextPath() %>/users/updateProfilePic", {
                method: "PUT",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ id: user.id, profilePic: base64 })
            })
                .then(res => res.json())
                .then(data => {
                    alert("Profile picture updated!");
                    localStorage.setItem("user", JSON.stringify(data));
                })
                .catch(() => alert("Failed to upload image."));
        });
    });
</script>

</body>
</html>
