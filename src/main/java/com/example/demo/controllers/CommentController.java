package com.example.demo.controllers;

import com.example.demo.model.*;
import com.example.demo.repository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
@RequestMapping("/comments")
public class CommentController {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/{Id}")
    public String viewComments(@PathVariable Long Id, Model model, HttpSession session) {
        Optional<Comment> commentOpt = commentRepository.findById(Id);

        if (commentOpt.isEmpty()) {
            return "redirect:/";
        }

        Comment comment = commentOpt.get();
        model.addAttribute("comment", comment);

        // Get comments for the lec
        Optional<Comment> comments = commentRepository.findById(Id);
        model.addAttribute("comments", comments);

        return "comments";
    }

    @PostMapping("/addComment")
    public String addComment(@RequestParam Long Id, String content, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        Optional<User> userOpt = userRepository.findById(userId);

/*
        Comment comment = commentRepository.createComment(Id, currentUser.getId(), content);

        if (comment != null) {
            redirectAttributes.addFlashAttribute("success", "Comment added successfully");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to add comment");
        }
*/
        return "redirect:/comments/" + Id;
    }

    @PostMapping("/delete/{id}")
    public String deleteComment(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        /*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = userService.findByUsername(auth.getName());
*/
        Optional<Comment> comment = commentRepository.findById(id);

        if (comment.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Comment not found");
            return "redirect:/polls";
        }

        /*boolean isTeacher = auth.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_TEACHER"));

        boolean isAuthor = currentUser.getId().equals(comment.getUser().getId());

        if (!isTeacher && !isAuthor) {
            redirectAttributes.addFlashAttribute("error", "You don't have permission to delete this comment");
            return "redirect:/comments/" + comment.getPoll().getId();
        }
*/
        Long pollId = comment.get().getPoll().getId();
        //commentRepository.deleteComment(id);
        redirectAttributes.addFlashAttribute("success", "Comment deleted successfully");

        return "redirect:/comments/" + pollId;
    }
}
