package com.example.gps380f.controller;

import com.example.gps380f.model.Comment;
import com.example.gps380f.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommentController {
    
    private final CommentService commentService;
    
    @Autowired
    public CommentController(CommentService commentService) {
        this.commentService = commentService;
    }
    

    @GetMapping("/comments")
    public String showCommentsPage(Model model) {
        return "comments";
    }
    

    @GetMapping("/api/comments")
    @ResponseBody
    public List<Comment> getAllComments() {
        return commentService.getAllComments();
    }
    

    @PostMapping("/api/comments")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> saveComment(@RequestParam String name, @RequestParam String comment) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            Comment newComment = new Comment(name, comment);
            commentService.saveComment(newComment);
            
            response.put("success", true);
            response.put("message", "Comment saved");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Error when saving comment: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
}
