package com.example.demo.controllers;

import com.example.demo.model.LectureMaterial;
import com.example.demo.repository.LectureMaterialRepository;
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
import java.util.List;
import java.util.Optional;

@Controller
public class LectureMaterialController {

    @Autowired
    private LectureMaterialRepository lecturerepo;

    @GetMapping
    public String lectureMaterial(Model model) {
        List<LectureMaterial> lectureMaterials = lecturerepo.findAll();
        model.addAttribute("lectureMaterials", lectureMaterials);
        return "lecturelist";
    }

    @GetMapping("/upload")
    @RolesAllowed("TEACHER")
    public String showUploadForm() {
        return "uploadLecture"; // JSP: /WEB-INF/views/uploadLecture.jsp
    }

    @PostMapping("/upload")
    @RolesAllowed("TEACHER")
    public String handleUpload(@RequestParam("title") String title, @RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) throws IOException {
        LectureMaterial lectureMaterial = new LectureMaterial();
        lectureMaterial.setTitle(title);
        lectureMaterial.setFileName(file.getOriginalFilename());
        lectureMaterial.setFileData(file.getBytes());

        lecturerepo.save(lectureMaterial);
        redirectAttributes.addFlashAttribute("message", "LectureMaterial uploaded successfully!");
        return "redirect:/lecture/upload";
    }

    @GetMapping("/download{id}")
    public ResponseEntity<byte[]> downloadFile(@PathVariable Long id) {
        Optional<LectureMaterial> optional = lecturerepo.findById(id);
        if (optional.isPresent()) {
            LectureMaterial material = optional.get();
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + material.getFileName() + "\"")
                    .body(material.getFileData());
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
