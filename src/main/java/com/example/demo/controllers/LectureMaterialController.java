package com.example.demo.controllers;

import com.example.demo.model.LectureComment;
import com.example.demo.model.LectureMaterial;
import com.example.demo.model.User;
import com.example.demo.repository.LectureCommentRepository;
import com.example.demo.repository.LectureMaterialRepository;
import com.example.demo.repository.UserRepository;
import jakarta.annotation.security.RolesAllowed;
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
import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Controller
public class LectureMaterialController {

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
        LectureMaterial lecture = lecturerepo.findById(id).orElseThrow();
        List<LectureComment> comments = lectureCommentRepo.findByLectureMaterial(lecture);

        model.addAttribute("lectures", lecture);
        model.addAttribute("comments", comments);
        model.addAttribute("newComment", new LectureComment());
        return "lectureDetail"; // Make this JSP page
    }
    @PostMapping("/lectures/{id}/comment")
    public String postComment(@PathVariable Long id,
                              @RequestParam("content") String content,
                              Principal principal) {
        LectureMaterial lecture = lecturerepo.findById(id).orElseThrow();
        String email = principal.getName();
        System.out.println("User logged in: " + email);
        User user = userRepo.findByEmail(email).orElseThrow();
        LectureComment comment = new LectureComment();
        comment.setContent(content);
        comment.setUser(user);
        comment.setLectureMaterial(lecture);
        comment.setCreatedAt(java.time.LocalDateTime.now());

        lectureCommentRepo.save(comment);
        return "redirect:/lectures/" + id;
    }

    @GetMapping("/upload")
    @RolesAllowed("TEACHER")
    public String showUploadForm() {
        return "uploadLecture"; // JSP: /WEB-INF/views/uploadLecture.jsp
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
}
