package com.example.demo.repository;

import com.example.demo.model.LectureMaterial;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LectureMaterialRepository extends JpaRepository<LectureMaterial, Long> {
    @Query(value = "SELECT LECTURECODE, LECTURENAME FROM LECTUREINFO WHERE USERID = ?1", nativeQuery = true)
    List<Object[]> findLecturesByUserId(int userId);
}
