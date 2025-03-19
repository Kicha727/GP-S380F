document.addEventListener("DOMContentLoaded", function () {
    const user = JSON.parse(localStorage.getItem("user"));

    if (!user) {
        alert("You must be logged in to view this page.");
        window.location.href = "login.html";
        return;
    }

    console.log("Loading user data from localStorage...");

    // ✅ Populate fields
    document.getElementById("studentId").value = user.id || "N/A";
    document.getElementById("studentName").value = user.name || "No Name Provided";
    document.getElementById("courseName").value = user.course || "No Course Assigned";
    document.getElementById("email").value = user.email || "N/A";
    document.getElementById("phone").value = user.phone || "";
    document.getElementById("academicYear").value = user.academicYear || "";
    document.getElementById("gender").value = user.gender || "";

    // ✅ Load Profile Picture
    if (user.profilePic && user.profilePic.startsWith("data:image")) {
        document.getElementById("profilePic").src = user.profilePic;
    } else {
        document.getElementById("profilePic").src = "/assets/images/default-avatar.png";
    }

    // ✅ Fetch Fresh Data from H2 in the Background
    console.log("Fetching latest user data from backend...");
    fetch(`http://localhost:8080/users/${user.id}`)
        .then(response => response.json())
        .then(freshUser => {
            console.log("Fetched user data:", freshUser);

            // ✅ Only update localStorage if data has changed
            if (JSON.stringify(freshUser) !== JSON.stringify(user)) {
                console.log("Updating localStorage with new user data...");
                localStorage.setItem("user", JSON.stringify(freshUser));

                // ✅ Update UI with New Data
                document.getElementById("studentId").value = freshUser.id || "N/A";
                document.getElementById("studentName").value = freshUser.name || "No Name Provided";
                document.getElementById("courseName").value = freshUser.course || "No Course Assigned";
                document.getElementById("email").value = freshUser.email || "N/A";
                document.getElementById("phone").value = freshUser.phone || "";
                document.getElementById("academicYear").value = freshUser.academicYear || "";
                document.getElementById("gender").value = freshUser.gender || "";

                // ✅ Update Profile Picture
                if (freshUser.profilePic && freshUser.profilePic.startsWith("data:image")) {
                    document.getElementById("profilePic").src = freshUser.profilePic;
                } else {
                    document.getElementById("profilePic").src = "/assets/images/default-avatar.png";
                }
            }
        })
        .catch(error => {
            console.error("Error fetching user data:", error);
        });

    // ✅ Handle Edit Button Click
    const editBtn = document.getElementById("editInfoBtn");
    editBtn.addEventListener("click", function () {
        const isEditing = editBtn.textContent === "Save";

        // ✅ Toggle Only Editable Fields (Course Name, Gender, Academic Year)
        document.getElementById("courseName").disabled = isEditing;
        document.getElementById("academicYear").disabled = isEditing;
        document.getElementById("gender").disabled = isEditing;

        // ✅ Change Button Text
        editBtn.textContent = isEditing ? "Edit" : "Save";

        if (isEditing) {
            const updatedUser = {
                id: user.id,
                course: document.getElementById("courseName").value,
                academicYear: document.getElementById("academicYear").value,
                gender: document.getElementById("gender").value
            };

            console.log("Sending Update Request:", updatedUser);

            fetch("http://localhost:8080/users/update", {
                method: "PUT",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(updatedUser)
            })
            .then(response => response.json())
            .then(data => {
                console.log("Update Successful:", data);
                alert("Profile updated successfully!");
                localStorage.setItem("user", JSON.stringify(data));
                window.location.reload();
            })
            .catch(error => {
                console.error("Error:", error);
                alert("Failed to update profile.");
            });
        }
    });

    // ✅ Ensure "Upload Photo" button triggers the file picker
    const uploadBtn = document.getElementById("uploadPhotoBtn");
    const fileInput = document.getElementById("profilePicUpload");

    uploadBtn.addEventListener("click", function () {
        fileInput.click();
    });

    // ✅ Fix: Store Image in `localStorage` Before Saving
    fileInput.addEventListener("change", function (event) {
        const file = event.target.files[0];
        if (!file) {
            console.log("No file selected.");
            return;
        }

        const reader = new FileReader();
        reader.onload = function (e) {
            const base64Image = e.target.result;

            // ✅ Store the Base64 image in `localStorage`
            localStorage.setItem("newProfilePic", base64Image);
            console.log("Image stored in localStorage successfully.");

            // ✅ Update Profile Picture Preview
            document.getElementById("profilePic").src = base64Image;
        };
        reader.readAsDataURL(file);
    });

    // ✅ Handle Save Profile Picture Button
    document.getElementById("savePhotoBtn").addEventListener("click", function () {
        const newProfilePic = localStorage.getItem("newProfilePic");

        if (!newProfilePic || newProfilePic === "null") {
            alert("Please upload an image before saving.");
            console.log("Error: No image found in localStorage.");
            return;
        }

        const updatedUser = {
            id: user.id,
            profilePic: newProfilePic
        };

        console.log("Sending Image Data to Backend:", updatedUser.profilePic.substring(0, 50) + "...");

        fetch("http://localhost:8080/users/updateProfilePic", {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(updatedUser)
        })
        .then(response => {
            if (!response.ok) {
                return response.text().then(errorMessage => {
                    throw new Error(errorMessage);
                });
            }
            return response.json();
        })
        .then(data => {
            alert("Profile picture updated successfully!");
            localStorage.setItem("user", JSON.stringify(data));
            document.getElementById("profilePic").src = newProfilePic;
        })
        .catch(error => {
            console.error("Error:", error.message);
            alert("Upload failed: " + error.message);
        });
    });
});
