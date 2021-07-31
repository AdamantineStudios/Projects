package cz.ucl.logic.data.dao;


import cz.ucl.logic.app.entities.definition.Color;
import cz.ucl.logic.app.entities.definition.ICategory;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TaskDAO {
    private int id;
    private String title;
    private String note;
    private UserDAO user;
    private CategoryDAO category;
    private List<TagDAO> tags;
    private boolean isDone;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private Date deadline;
    private Color color;

    public TaskDAO(){
        tags = new ArrayList<>();
    }

    public Color getColor() {
        return color;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getNote() {
        return note;
    }

    public UserDAO getUser() {
        return user;
    }

    public CategoryDAO getCategory() {
        return category;
    }

    public List<TagDAO> getTags() {
        return tags;
    }

    public boolean isDone() {
        return isDone;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public void setUser(UserDAO userId) {
        this.user = userId;
    }

    public void setCategory(CategoryDAO category) {
        this.category = category;
    }

    public void setTags(List<TagDAO> tags) {
        this.tags = tags;
    }

    public void setDone(boolean done) {
        isDone = done;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public void setColor(Color color) {
        this.color = color;
    }
}
