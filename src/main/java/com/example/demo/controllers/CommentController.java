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
        Poll poll = pollService.getPollById(pollId);
        if (poll == null) {
            return "redirect:/polls";
        }
        
        List<Comment> comments = commentService.getCommentsByPollId(pollId);
        model.addAttribute("poll", poll);
        model.addAttribute("comments", comments);
        model.addAttribute("newComment", new Comment());
        return "comments";
    }
    
    @PostMapping("/add")
    @PreAuthorize("hasAnyRole('STUDENT', 'TEACHER')")
    public String addComment(@RequestParam Long pollId, 
                            @RequestParam String content,
                            RedirectAttributes redirectAttributes) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = userService.findByUsername(auth.getName());
        
        if (currentUser == null) {
            redirectAttributes.addFlashAttribute("error", "您必須登入才能新增評論");
            return "redirect:/comments/" + pollId;
        }
        
        Comment comment = commentService.createComment(pollId, currentUser.getId(), content);
        
        if (comment != null) {
            redirectAttributes.addFlashAttribute("success", "評論新增成功");
        } else {
            redirectAttributes.addFlashAttribute("error", "評論新增失敗");
        }
        
        return "redirect:/comments/" + pollId;
    }
    
    @PostMapping("/edit/{id}")
    @PreAuthorize("hasAnyRole('STUDENT', 'TEACHER')")
    public String editComment(@PathVariable Long id, 
                             @RequestParam String content,
                             RedirectAttributes redirectAttributes) {
        Comment comment = commentService.getCommentById(id);
        
        if (comment == null) {
            redirectAttributes.addFlashAttribute("error", "找不到評論");
            return "redirect:/polls";
        }
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = userService.findByUsername(auth.getName());
        
        // 確保只有評論的作者才能編輯評論
        if (!comment.getUser().getId().equals(currentUser.getId())) {
            redirectAttributes.addFlashAttribute("error", "您沒有權限編輯此評論");
            return "redirect:/comments/" + comment.getPoll().getId();
        }
        
        commentService.updateComment(id, content);
        redirectAttributes.addFlashAttribute("success", "評論編輯成功");
        
        return "redirect:/comments/" + comment.getPoll().getId();
    }
    
    @PostMapping("/delete/{id}")
    @PreAuthorize("hasAnyRole('STUDENT', 'TEACHER')")
    public String deleteComment(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        Comment comment = commentService.getCommentById(id);
        
        if (comment == null) {
            redirectAttributes.addFlashAttribute("error", "找不到評論");
            return "redirect:/polls";
        }
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = userService.findByUsername(auth.getName());
        
        // 確保只有評論的作者才能刪除評論
        if (!comment.getUser().getId().equals(currentUser.getId())) {
            redirectAttributes.addFlashAttribute("error", "您沒有權限刪除此評論");
            return "redirect:/comments/" + comment.getPoll().getId();
        }
        
        Long pollId = comment.getPoll().getId();
        commentService.deleteComment(id);
        redirectAttributes.addFlashAttribute("success", "評論刪除成功");
        
        return "redirect:/comments/" + pollId;
    }
}
