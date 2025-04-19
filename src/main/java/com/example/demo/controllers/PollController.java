package com.example.demo.controllers;

import com.example.demo.model.*;
import com.example.demo.repository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/polls")
public class PollController {

    @Autowired
    private PollRepository pollRepository;

    @Autowired
    private PollOptionRepository pollOptionRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private UserRepository userRepository;

    // Display poll page with poll details
    @GetMapping("/{id}")
    public String viewPoll(@PathVariable Long id, Model model, HttpSession session) {
        Optional<Poll> pollOpt = pollRepository.findById(id);
        
        if (pollOpt.isEmpty()) {
            return "redirect:/";
        }
        
        Poll poll = pollOpt.get();
        model.addAttribute("poll", poll);
        
        // Get comments for the poll
        List<Comment> comments = commentRepository.findByPollIdOrderByCreatedAtDesc(id);
        model.addAttribute("comments", comments);
        
        // Get current user's vote if they are logged in
        Long userId = (Long) session.getAttribute("userId");
        if (userId != null) {
            Optional<User> userOpt = userRepository.findById(userId);
            if (userOpt.isPresent()) {
                User user = userOpt.get();
                model.addAttribute("user", user);
                
                // Find which option the user has voted for, if any
                PollOption userVote = pollOptionRepository.findByPollIdAndVotersContaining(id, user);
                if (userVote != null) {
                    model.addAttribute("userVote", userVote.getId());
                }
                
                // Check if user is a teacher (for delete functionality)
                model.addAttribute("isTeacher", user.isTeacher());
            }
        }
        
        return "poll";
    }
    
    // Vote on a poll
    @PostMapping("/{pollId}/vote")
    public String vote(@PathVariable Long pollId, @RequestParam Long optionId, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        
        Optional<User> userOpt = userRepository.findById(userId);
        Optional<Poll> pollOpt = pollRepository.findById(pollId);
        Optional<PollOption> optionOpt = pollOptionRepository.findById(optionId);
        
        if (userOpt.isPresent() && pollOpt.isPresent() && optionOpt.isPresent()) {
            User user = userOpt.get();
            PollOption newOption = optionOpt.get();
            
            // Check if user already voted for another option
            PollOption previousVote = pollOptionRepository.findByPollIdAndVotersContaining(pollId, user);
            if (previousVote != null && !previousVote.getId().equals(optionId)) {
                // Remove vote from previous option
                previousVote.removeVoter(user);
                pollOptionRepository.save(previousVote);
            }
            
            // Add vote to new option if it's different from previous
            if (previousVote == null || !previousVote.getId().equals(optionId)) {
                newOption.addVoter(user);
                pollOptionRepository.save(newOption);
            }
        }
        
        return "redirect:/polls/" + pollId;
    }
    
    // Add a comment to a poll
    @PostMapping("/{pollId}/comment")
    public String addComment(@PathVariable Long pollId, @RequestParam String content, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        
        Optional<User> userOpt = userRepository.findById(userId);
        Optional<Poll> pollOpt = pollRepository.findById(pollId);
        
        if (userOpt.isPresent() && pollOpt.isPresent() && content != null && !content.trim().isEmpty()) {
            User user = userOpt.get();
            Poll poll = pollOpt.get();
            
            Comment comment = new Comment();
            comment.setContent(content);
            comment.setUser(user);
            comment.setPoll(poll);
            
            commentRepository.save(comment);
        }
        
        return "redirect:/polls/" + pollId;
    }
    
    // For teachers only: Create a new poll
    @GetMapping("/create")
    public String createPollForm(HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        
        Optional<User> userOpt = userRepository.findById(userId);
        if (userOpt.isEmpty() || !userOpt.get().isTeacher()) {
            return "redirect:/";
        }
        
        return "create-poll";
    }
    
    // Process poll creation
    @PostMapping("/create")
    public String createPoll(@RequestParam String question, 
                            @RequestParam String option1,
                            @RequestParam String option2,
                            @RequestParam String option3,
                            @RequestParam String option4,
                            HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        
        Optional<User> userOpt = userRepository.findById(userId);
        if (userOpt.isEmpty() || !userOpt.get().isTeacher()) {
            return "redirect:/";
        }
        
        // Create new poll
        Poll poll = new Poll();
        poll.setQuestion(question);
        
        // Add options
        PollOption opt1 = new PollOption();
        opt1.setOptionText(option1);
        poll.addOption(opt1);
        
        PollOption opt2 = new PollOption();
        opt2.setOptionText(option2);
        poll.addOption(opt2);
        
        PollOption opt3 = new PollOption();
        opt3.setOptionText(option3);
        poll.addOption(opt3);
        
        PollOption opt4 = new PollOption();
        opt4.setOptionText(option4);
        poll.addOption(opt4);
        
        pollRepository.save(poll);
        
        return "redirect:/polls/" + poll.getId();
    }
    
    // List all polls
    @GetMapping("")
    public String listPolls(Model model) {
        List<Poll> polls = pollRepository.findAll();
        model.addAttribute("polls", polls);
        return "polls";
    }
    
    // Delete a poll (for teachers only)
    @PostMapping("/{pollId}/delete")
    public String deletePoll(@PathVariable Long pollId, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        
        Optional<User> userOpt = userRepository.findById(userId);
        if (userOpt.isEmpty() || !userOpt.get().isTeacher()) {
            return "redirect:/polls";
        }
        
        // Delete the poll and associated comments
        try {
            // First delete associated comments to avoid foreign key constraint errors
            commentRepository.deleteByPollId(pollId);
            
            // Then delete the poll (this should cascade delete poll options)
            pollRepository.deleteById(pollId);
        } catch (Exception e) {
            // Log error or show a message
            System.err.println("Error deleting poll: " + e.getMessage());
        }
        
        return "redirect:/polls";
    }
} 