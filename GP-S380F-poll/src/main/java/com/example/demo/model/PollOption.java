package com.example.demo.model;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "poll_options")
public class PollOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String optionText;
    private int voteCount;

    @ManyToOne
    @JoinColumn(name = "poll_id")
    private Poll poll;

    @ManyToMany
    @JoinTable(
        name = "user_votes",
        joinColumns = @JoinColumn(name = "option_id"),
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> voters = new ArrayList<>();

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOptionText() {
        return optionText;
    }

    public void setOptionText(String optionText) {
        this.optionText = optionText;
    }

    public int getVoteCount() {
        return voteCount;
    }

    public void setVoteCount(int voteCount) {
        this.voteCount = voteCount;
    }

    public Poll getPoll() {
        return poll;
    }

    public void setPoll(Poll poll) {
        this.poll = poll;
    }

    public List<User> getVoters() {
        return voters;
    }

    public void setVoters(List<User> voters) {
        this.voters = voters;
    }
    
    // Helper method to add voter
    public void addVoter(User user) {
        voters.add(user);
        voteCount++;
    }
    
    // Helper method to remove voter
    public void removeVoter(User user) {
        if (voters.remove(user)) {
            voteCount--;
        }
    }
} 