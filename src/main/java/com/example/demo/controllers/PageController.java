package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/")
    public String indexPage() {
        return "index";  // resolves to /WEB-INF/views/index.jsp
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";  // resolves to /WEB-INF/views/login.jsp
    }

    @GetMapping("/register")
    public String registerPage() {
        return "register";  // resolves to /WEB-INF/views/register.jsp
    }

    @GetMapping("/personal-info")
    public String personalInfoPage() {
        return "personal-info"; // maps to /WEB-INF/views/personal-info.jsp
    }

    // Add more mappings as you create pages
}
