package com.example.demo.controllers;

import com.example.demo.model.User;
import com.example.demo.model.UserRole;
import com.example.demo.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller

public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";  // Resolves to /WEB-INF/views/login.jsp
    }

    @GetMapping("/login_zh")
    public String showLoginFormZh() {
        return "login_zh";  // Resolves to /WEB-INF/views/login_zh.jsp
    }
    

    @PostMapping("/login")
    public String processLogin(@RequestParam String email, 
                              @RequestParam String password,
                              HttpSession session,
                              RedirectAttributes redirectAttributes,
                              @RequestParam(required = false) String language) {
        User user = userRepository.findByEmail(email);
        
        if (user == null || !user.getPassword().equals(password)) {
            redirectAttributes.addFlashAttribute("error", "Invalid email or password");
            return "redirect:/login"+ (language != null && language.equals("zh") ? "_zh" : "");
        }
        
        // Store user information in session
        session.setAttribute("userId", user.getId());
        session.setAttribute("userName", user.getName());
        session.setAttribute("userEmail", user.getEmail());
        session.setAttribute("userRole", user.getRole().toString());
        
        return "redirect:/"+ (language != null && language.equals("zh") ? "index_zh" : "");
    }

    
    
    @GetMapping("/register")
    public String showRegisterForm() {
        return "register";  // Resolves to /WEB-INF/views/register.jsp
    }
    
    @GetMapping("/register_zh")
    public String showRegisterFormZh() {
        return "register_zh";  // Resolves to /WEB-INF/views/register_zh.jsp
    }
    
    @PostMapping("/register")
    public String processRegistration(@RequestParam String name,
                                     @RequestParam String email,
                                     @RequestParam String password,
                                     @RequestParam String phone,
                                     @RequestParam String course,
                                     @RequestParam String academicYear,
                                     @RequestParam String gender,
                                     RedirectAttributes redirectAttributes) {
        
        // Check if user already exists
        if (userRepository.findByEmail(email) != null) {
            redirectAttributes.addFlashAttribute("error", "Email already registered");
            return "redirect:/register";
        }
        
        // Create new user
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setCourse(course);
        user.setAcademicYear(academicYear);
        user.setGender(gender);
        user.setRole(UserRole.STUDENT);  // Default role is student
        
        userRepository.save(user);
        
        redirectAttributes.addFlashAttribute("success", "Registration successful. Please login.");
        return "redirect:/login";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
} 