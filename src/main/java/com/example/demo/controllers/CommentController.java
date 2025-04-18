package com.example.demo.controllers;
import com.example.demo.model.*;
import com.example.demo.repository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/comments")
public class CommentController {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    public String viewComments(@PathVariable Long Id, Model model, HttpSession session) {
        Optional<Comment> commentOpt = commentRepository.findById(Id);
        if (commentOpt.isEmpty()) {
            return "redirect:/";
        }
        Comment comment = commentOpt.get();
        model.addAttribute("comment", comment);

        List<Comment> comments = commentRepository.findByPollIdOrderByCreatedAtDesc(Id);
        model.addAttribute("comments", comments);

        return "comments";
    }


    @PostMapping("/addComment")
    public String addComment(@RequestParam Long Id, @RequestParam String content, HttpSession session, RedirectAttributes redirectAttributes) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        Optional<User> userOpt = userRepository.findById(userId);
        if (!userOpt.isPresent()) {
            redirectAttributes.addFlashAttribute("error", "找不到用戶");
            return "redirect:/register";
        }

        Comment comment = new Comment();
        comment.setContent(String.valueOf(userOpt));
        comment.setContent(String.valueOf(userId));
        comment.setCreatedAt(LocalDateTime.now());
        comment.setContent(content);


        if (comment != null) {
            redirectAttributes.addFlashAttribute("success", "Add Comment successfully");
            if (userId!=null) {
                return String.valueOf(commentRepository.save(comment));
            }
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to add Comment");
        }
        return "redirect:/comments";
    }


    @PostMapping("/delete/{id}")
    public String deleteComment(@PathVariable Long id, HttpSession session, RedirectAttributes redirectAttributes) {
        // Find the comment
        Optional<Comment> commentOpt = commentRepository.findById(id);
        if (commentOpt.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Comment not found");
            return "redirect:/comments";
        }

        Comment comment = commentOpt.get();

        // Check if user is logged in
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        // Find the current user
        Optional<User> userOpt = userRepository.findById(userId);
        if (userOpt.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "User not found");
            return "redirect:/register";
        }

        User currentUser = userOpt.get();

        // Check if the user is a teacher or the comment author
        boolean isTeacher = UserRole.TEACHER.equals(currentUser.getRole());
        boolean isAuthor = currentUser.getId().equals(comment.getUser().getId());

        if (!isTeacher && !isAuthor) {
            redirectAttributes.addFlashAttribute("error", "You don't have permission to delete this comment");
            return "redirect:/comments/" + comment.getPoll();  // Assuming Comment has a pollId field
        }

        // Delete the comment
        commentRepository.delete(comment);
        redirectAttributes.addFlashAttribute("success", "Comment deleted successfully");

        // Redirect to the poll page
        return "redirect:/comments/" + comment.getPoll();
    }
}