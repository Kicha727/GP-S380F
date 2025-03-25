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

    // Add more mappings as you create pages
}
