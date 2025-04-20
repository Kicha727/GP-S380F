package com.example.demo.controllers;

import com.example.demo.model.LectureComment;
import com.example.demo.model.LectureDTO;
import com.example.demo.model.LectureMaterial;
import com.example.demo.model.User;
import com.example.demo.repository.LectureCommentRepository;
import com.example.demo.repository.LectureMaterialRepository;
import com.example.demo.repository.UserRepository;
import jakarta.annotation.security.RolesAllowed;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.io.IOException;
import java.util.*;

@Controller
public class MaterialController {

    @Autowired
    private LectureMaterialRepository lecturerepo;

    @Autowired
    private LectureCommentRepository lectureCommentRepo;

    @Autowired
    private UserRepository userRepo;

    @GetMapping("/lectures")
    public String lectureMaterial(Model model) {
        List<LectureMaterial> lectureMaterials = lecturerepo.findAll();
        model.addAttribute("lectureMaterials", lectureMaterials);
        return "lecturelist";
    }
    @GetMapping("/lectures/{id}")
    public String viewLectureDetail(@PathVariable Long id, Model model) {
        Optional<LectureMaterial> lectureOpt = lecturerepo.findById(id);
        if (!lectureOpt.isPresent()) {
            model.addAttribute("error", "Lecture not found!");
            return "errorPage";  // A custom error page you can create
        }
        LectureMaterial lecture = lectureOpt.get();
        List<LectureComment> comments = lectureCommentRepo.findByLectureMaterial(lecture);
        model.addAttribute("comments", comments);
        model.addAttribute("newComment", new LectureComment());
        return "lectureDetail";
    }

    @PostMapping("/lectures/{id}/comment")
    public String postComment(@PathVariable Long id,
                              @RequestParam("content") String content,
                              HttpSession session,
                              RedirectAttributes redirectAttributes) {

        // Retrieve the user details from the session
        String email = (String) session.getAttribute("userEmail");

        if (email == null) {
            redirectAttributes.addFlashAttribute("message", "You must be logged in to comment.");
            return "redirect:/login";
        }

        String userName = (String) session.getAttribute("userName");  // Getting the userName from session
        User user = userRepo.findByEmail(email);  // Retrieve user from DB based on email

        if (user == null) {
            redirectAttributes.addFlashAttribute("message", "User not found.");
            return "redirect:/login";
        }

        LectureMaterial lecture = lecturerepo.findById(id).orElseThrow();

        // Create and save the comment
        LectureComment comment = new LectureComment();
        comment.setContent(content);
        comment.setUser(user);  // Set the User object (not just the username)
        comment.setLectureMaterial(lecture);
        comment.setCreatedAt(java.time.LocalDateTime.now());

        lectureCommentRepo.save(comment);

        return "redirect:/lectures/" + id;  // Redirect to the lecture details page
    }

    @GetMapping("/upload")
    @RolesAllowed("TEACHER")
    public String showUploadForm(HttpSession session, RedirectAttributes redirectAttributes) {
        String role = (String) session.getAttribute("userRole");

        if (role == null || (!role.equals("TEACHER") && !role.equals("ADMIN"))) {
            redirectAttributes.addFlashAttribute("message", "You do not have permission to upload materials.");
            return "redirect:/";
        }

        return "uploadLecture"; // uploadLecture.jsp
    }

    @PostMapping("/upload")
    @RolesAllowed("TEACHER")
    public String handleUpload(@RequestParam("title") String title,
                               @RequestParam("file") MultipartFile file,
                               RedirectAttributes redirectAttributes) throws IOException {

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload.");
            return "redirect:/upload";
        }

        // Check if uploaded file is a PDF
        if (!"application/pdf".equalsIgnoreCase(file.getContentType())) {
            redirectAttributes.addFlashAttribute("message", "Only PDF files are allowed.");
            return "redirect:/upload";
        }

        LectureMaterial lectureMaterial = new LectureMaterial();
        lectureMaterial.setTitle(title);
        lectureMaterial.setFileName(file.getOriginalFilename());
        lectureMaterial.setFileData(file.getBytes());

        lecturerepo.save(lectureMaterial);
        redirectAttributes.addFlashAttribute("message", "LectureMaterial uploaded successfully!");
        return "redirect:/upload";
    }
    @PostMapping("/lectures/{id}/delete")
    @RolesAllowed("TEACHER")
    public String deleteLecture(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        Optional<LectureMaterial> lectureOpt = lecturerepo.findById(id);
        if (lectureOpt.isPresent()) {
            // Manually delete all associated comments first
            List<LectureComment> comments = lectureCommentRepo.findByLectureMaterialId(id);
            if (!comments.isEmpty()) {
                lectureCommentRepo.deleteAll(comments);  // Delete all comments associated with the lecture
            }

            // Then delete the lecture material
            lecturerepo.deleteById(id);
            redirectAttributes.addFlashAttribute("message", "Lecture deleted successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Lecture not found.");
        }
        return "redirect:/lectures";
    }


    @GetMapping("/download/{id}")
    public ResponseEntity<byte[]> downloadFile(@PathVariable Long id) {
        Optional<LectureMaterial> optional = lecturerepo.findById(id);
        if (optional.isPresent()) {
            LectureMaterial material = optional.get();
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + material.getFileName() + "\"")
                    .header(HttpHeaders.CONTENT_TYPE, "application/pdf") // assuming PDFs only
                    .body(material.getFileData());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/getLectures")
    public ResponseEntity<List<LectureDTO>> getLectures(@RequestParam("userID") int userID) {
        List<Object[]> results = lecturerepo.findLecturesByUserId(userID);

        List<LectureDTO> lectures = new ArrayList<>();
        for (Object[] row : results) {
            String code = (String) row[0];
            String name = (String) row[1];
            lectures.add(new LectureDTO(code, name));
        }

        return ResponseEntity.ok(lectures);
    }

}
