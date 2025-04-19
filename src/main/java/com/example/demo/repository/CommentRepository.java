package com.example.demo.repository;

import com.example.demo.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> findByPollIdOrderByCreatedAtDesc(Long pollId);
    
    @Modifying
    @Transactional
    @Query("DELETE FROM Comment c WHERE c.poll.id = ?1")
    void deleteByPollId(Long pollId);
} 