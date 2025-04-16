// File: src/main/java/com/example/demo/controller/CommentController.java
package com.example.demo.controller;

import com.example.demo.model.Comment;
import com.example.demo.model.Poll;
import com.example.demo.model.User;
import com.example.demo.service.CommentService;
import com.example.demo.service.PollService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/comments")
public class CommentController {

    @Autowired
    private CommentService commentService;
    
    @Autowired
    private PollService pollService;
    
    @Autowired
    private UserService userService;

    @GetMapping("/{pollId}")
    @PreAuthorize("hasAnyRole('STUDENT', 'TEACHER')")
    public String viewComments(@PathVariable Long pollId, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = userService.findByUsername(auth.getName());
        
        Poll poll = pollService.getPollById(pollId);
        if (poll == null) {
            return "redirect:/polls";
        }
        
        List<Comment> comments = commentService.getCommentsByPollId(pollId);
        
        // Filter comments based on user role
        boolean isTeacher = auth.getAuthorities().stream()
            .anyMatch(a -> a.getAuthority().equals("ROLE_TEACHER"));
            
        if (!isTeacher) {
            // If student, only show their own comments
            comments = comments.stream()
                .filter(c -> c.getUser().getId().equals(currentUser.getId()))
                .collect(Collectors.toList());
        }
        
        model.addAttribute("poll", poll);
        model.addAttribute("comments", comments);
        model.addAttribute("newComment", new Comment());
        model.addAttribute("isTeacher", isTeacher);
        return "comments";
    }
    
    @PostMapping("/add")
    @PreAuthorize("hasRole('STUDENT')")
    public String addComment(@RequestParam Long pollId, 
                            @RequestParam String content,
                            RedirectAttributes redirectAttributes) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = userService.findByUsername(auth.getName());
        
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "You must be logged in to add a comment");
            return "redirect:/comments/" + pollId;
        }
        
        Comment comment = commentService.createComment(pollId, currentUser.getId(), content);
        
        if (comment != null) {
            redirectAttributes.addFlashAttribute("success", "Comment added successfully");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to add comment");
        }
        
        return "redirect:/comments/" + pollId;
    }
    
    @PostMapping("/delete/{id}")
    @PreAuthorize("hasRole('TEACHER')")
    public String deleteComment(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        Comment comment = commentService.getCommentById(id);
        
        if (comment == null) {
            redirectAttributes.addFlashAttribute("error", "Comment not found");
            return "redirect:/polls";
        }
        
        Long pollId = comment.getPoll().getId();
        commentService.deleteComment(id);
        redirectAttributes.addFlashAttribute("success", "Comment deleted successfully");
        
        return "redirect:/comments/" + pollId;
    }
}
