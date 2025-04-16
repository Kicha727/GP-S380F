// File: src/main/java/com/example/demo/service/CommentService.java
package com.example.demo.service;

import com.example.demo.model.Comment;
import com.example.demo.model.Poll;
import com.example.demo.model.User;
import com.example.demo.repository.CommentRepository;
import com.example.demo.repository.PollRepository;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;
    
    @Autowired
    private PollRepository pollRepository;
    
    @Autowired
    private UserRepository userRepository;

    public List<Comment> getCommentsByPollId(Long pollId) {
        return commentRepository.findByPollIdOrderByCreatedAtDesc(pollId);
    }

    public Comment getCommentById(Long id) {
        return commentRepository.findById(id).orElse(null);
    }

    public void deleteComment(Long id) {
        commentRepository.deleteById(id);
    }
    
    public Comment createComment(Long pollId, Long userId, String content) {
        Comment comment = new Comment();
        comment.setContent(content);
        
        Optional<Poll> poll = pollRepository.findById(pollId);
        Optional<User> user = userRepository.findById(userId);
        
        if (poll.isPresent() && user.isPresent()) {
            comment.setPoll(poll.get());
            comment.setUser(user.get());
            return commentRepository.save(comment);
        }
        
        return null;
    }
}
