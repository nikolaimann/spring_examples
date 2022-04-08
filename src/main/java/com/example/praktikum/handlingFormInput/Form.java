package com.example.praktikum.handlingFormInput;

public class Form {

    Form(long id) {
        this.id = id;
    }

    public Form(long id, String content, String title) {
        this.id = id;
        this.content = content;
        this.title = title;
    }

    private long id;
    private String content;
    private String title;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}

