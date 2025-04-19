package com.example.demo.model;

public class LectureDTO {
    private String code;
    private String name;

    public LectureDTO(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }
}

