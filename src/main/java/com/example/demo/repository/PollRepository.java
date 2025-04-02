package com.example.demo.repository;

import com.example.demo.model.Poll;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PollRepository extends JpaRepository<Poll, Long> {
    // Add custom query methods if needed
} 