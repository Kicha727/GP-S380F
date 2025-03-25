package com.example.demo.model;

public class UserDTO {
    private Long id;
    private String name;
    private String email;
    private String phone;
    private String profilePic; 
    private String course;
    private String academicYear;
    private String gender;

    public UserDTO(Long id, String name, String email, String phone) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
    }

    public UserDTO(Long id, String name, String email, String phone,String profilePic, String course, String academicYear, String gender) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.profilePic = profilePic;
        this.course = (course != null) ? course : "Not Assigned";
        this.academicYear = (academicYear != null) ? academicYear : "Unknown";
        this.gender = (gender != null) ? gender : "Not Provided";
    }

    // Getters
    public Long getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getProfilePic() { return profilePic; }
    public String getCourse() { return course; }
    public String getAcademicYear() { return academicYear; }
    public String getGender() { return gender; }
}