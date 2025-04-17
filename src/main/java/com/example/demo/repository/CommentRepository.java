package com.example.demo.repository;

import com.example.demo.model.Comment;
import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> getAllComment();
    Optional<Comment> findById(Long Id);
    List<Comment> findByUser(User user);
}
