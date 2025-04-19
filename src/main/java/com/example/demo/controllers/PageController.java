package com.example.demo.controllers;

import com.example.demo.model.LectureMaterial;
import com.example.demo.model.Poll;
import com.example.demo.model.User;
import com.example.demo.repository.LectureMaterialRepository;
import com.example.demo.repository.PollRepository;
import com.example.demo.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
public class PageController {

    @Autowired
    private PollRepository pollRepository;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private LectureMaterialRepository lectureMaterialRepository;

    @GetMapping("/")
    public String indexPage(Model model, HttpSession session) {
        List<Poll> recentPolls = pollRepository.findAll();
        model.addAttribute("recentPolls", recentPolls);
        
        // Get userinfo 
        Long userId = (Long) session.getAttribute("userId");
        if (userId != null) {
            Optional<User> userOpt = userRepository.findById(userId);
            if (userOpt.isPresent()) {
                User user = userOpt.get();
                model.addAttribute("user", user);
                
                // Get all lecture materials
                List<LectureMaterial> lectures = lectureMaterialRepository.findAll();
                
                // Create dates for each lecture
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                lectures.forEach(lecture -> {
                    if (lecture.getCreatedAt() != null) {
                        session.setAttribute("lecture_" + lecture.getId() + "_date", 
                                           lecture.getCreatedAt().format(formatter));
                    } else {
                        session.setAttribute("lecture_" + lecture.getId() + "_date", "N/A");
                    }
                });
                
                model.addAttribute("lectures", lectures);
            }
        }
        
        return "index";  // maps to /WEB-INF/views/index.jsp
        
    }

    @GetMapping("/personal-info")
    public String personalInfoPage(HttpSession session) {
        // Check if user is authenticated
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        
        return "personal-info"; // maps to /WEB-INF/views/personal-info.jsp
    }

    // Add mapping for poll list page
    @GetMapping("/all-polls")
    public String allPollsPage(Model model) {
        List<Poll> polls = pollRepository.findAll();
        model.addAttribute("polls", polls);
        return "polls";  // resolves to /WEB-INF/views/polls.jsp
    }
    
    /*@GetMapping("/comment-page")
    public String CommentPage(Model model) {
        List<Poll> polls = pollRepository.findAll();
        model.addAttribute("comment", comment);
        return "comment-page";  // resolves to /WEB-INF/views/comment-page.jsp
    }*/

    
    // Add more mappings as you create pages
}
