package com.example.demo.repository;

import com.example.demo.model.PollOption;
import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PollOptionRepository extends JpaRepository<PollOption, Long> {
    List<PollOption> findByPollId(Long pollId);
    PollOption findByPollIdAndVotersContaining(Long pollId, User user);
} 