package com.example.demo.repository;

import com.example.demo.model.Comment;
import com.example.demo.model.Poll;
import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> findByPollIdOrderByCreatedAtDesc(Long pollId);
    List<Comment> findByUserOrderByCreatedAtDesc(User user);
}
