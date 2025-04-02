package com.example.demo.controllers;

import com.example.demo.model.User;
import com.example.demo.model.UserDTO;
import com.example.demo.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "*") 
@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    // GET: Fetch all users
    @GetMapping
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // GET: Fetch current user information from session
    @GetMapping("/current")
    public ResponseEntity<?> getCurrentUser(HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        
        if (userId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("No user is currently logged in");
        }
        
        User user = userRepository.findById(userId).orElse(null);
        
        if (user == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
        }
        
        UserDTO userDTO = new UserDTO(
            user.getId(),
            user.getName(),
            user.getEmail(),
            user.getPhone(),
            user.getProfilePic(),
            user.getCourse(),
            user.getAcademicYear(),
            user.getGender()
        );
        
        return ResponseEntity.ok(userDTO);
    }

    // POST: Register a new user
    @PostMapping("/register")
    public User registerUser(@RequestBody User user) {
        return userRepository.save(user);
    }

   @PostMapping("/login")
    public ResponseEntity<?> loginUser(@RequestBody User loginRequest, HttpSession session) {
        User user = userRepository.findByEmail(loginRequest.getEmail());

        if (user == null || !user.getPassword().equals(loginRequest.getPassword())) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid email or password");
        }

        // Store user information in session
        session.setAttribute("userId", user.getId());
        session.setAttribute("userName", user.getName());
        session.setAttribute("userEmail", user.getEmail());
        session.setAttribute("userRole", user.getRole().toString());

        UserDTO userDTO = new UserDTO(
            user.getId(),
            user.getName(),
            user.getEmail(),
            user.getPhone(),
            user.getProfilePic(),
            user.getCourse(),
            user.getAcademicYear(),
            user.getGender()
        );

        return ResponseEntity.ok(userDTO);
    }

    @PutMapping("/update")
    public ResponseEntity<?> updateUser(@RequestBody User updatedUser) {
        User user = userRepository.findById(updatedUser.getId()).orElse(null);

        if (user == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
        }

        //  Allow updates for Course Name, Academic Year, and Gender
        user.setCourse(updatedUser.getCourse());
        user.setAcademicYear(updatedUser.getAcademicYear());
        user.setGender(updatedUser.getGender());

        userRepository.save(user);

        UserDTO userDTO = new UserDTO(
            user.getId(),
            user.getName(),
            user.getEmail(),
            user.getPhone(),
            user.getProfilePic(),
            user.getCourse(),
            user.getAcademicYear(),
            user.getGender()
        );
    
        return ResponseEntity.ok(userDTO);
    }

    @PutMapping("/updateProfilePic")
public ResponseEntity<?> updateProfilePic(@RequestBody Map<String, Object> requestData) {
    try {
        Long userId = Long.valueOf(requestData.get("id").toString());
        String profilePic = (String) requestData.get("profilePic");

        // ✅ Debugging: Print Received Data
        System.out.println("Received Profile Picture Data for User ID: " + userId);
        if (profilePic != null && !profilePic.isEmpty()) {
            System.out.println("Profile Picture Data (Base64): " + profilePic.substring(0, 50) + "...");
        } else {
            System.out.println("No Profile Picture Received!");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid profile picture data.");
        }

        // ✅ Find User in Database
        User user = userRepository.findById(userId).orElse(null);
        if (user == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
        }

        // ✅ Save Profile Picture to Database
        user.setProfilePic(profilePic);
        userRepository.save(user);

        // ✅ Return Updated User Info
        return ResponseEntity.ok(new UserDTO(
            user.getId(),
            user.getName(),
            user.getEmail(),
            user.getPhone(),
            user.getProfilePic(),
            user.getCourse(),
            user.getAcademicYear(),
            user.getGender()
        ));

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred while updating the profile picture.");
        }
    }
}