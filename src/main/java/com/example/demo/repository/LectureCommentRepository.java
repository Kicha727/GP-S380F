package com.example.demo.repository;

import com.example.demo.model.LectureComment;
import com.example.demo.model.LectureMaterial;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LectureCommentRepository extends JpaRepository<LectureComment, Long> {
    List<LectureComment> findByLectureMaterial(LectureMaterial lectureMaterial);
}
