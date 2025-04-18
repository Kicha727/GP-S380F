package com.example.demo.controllers;

import com.example.demo.model.Comment;
import com.example.demo.model.Poll;
import com.example.demo.repository.CommentRepository;
import com.example.demo.repository.PollRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class PageController {

    @Autowired
    private PollRepository pollRepository;

    @Autowired
    private CommentRepository CommentRepository;

    @GetMapping("/")
    public String indexPage(Model model) {
        List<Poll> recentPolls = pollRepository.findAll();
        model.addAttribute("recentPolls", recentPolls);
        return "index";  // resolves to /WEB-INF/views/index.jsp
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

    @GetMapping("/comments")
    public String CommentPage(Model model) {
        List<Comment> comments = CommentRepository.findAll();
        model.addAttribute("comments", comments);
        return "comments";  // resolves to /WEB-INF/views/comments.jsp
    }
    // Add more mappings as you create pages
}
