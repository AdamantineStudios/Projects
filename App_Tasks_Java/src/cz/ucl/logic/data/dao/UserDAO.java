package cz.ucl.logic.data.dao;

import cz.ucl.logic.app.entities.User;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class UserDAO {
    private int id;
    private String email;
    private String username;
    private String password;
    private List<TaskDAO> tasks;
    private List<CategoryDAO> categories;
    private List<TagDAO> tags;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public UserDAO() {
        this.tasks = new ArrayList<>();
        this.categories = new ArrayList<>();
        this.tags = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public List<TaskDAO> getTasks() {
        return tasks;
    }

    public List<CategoryDAO> getCategories() {
        return categories;
    }

    public List<TagDAO> getTags() {
        return tags;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setTasks(List<TaskDAO> tasks) {
        this.tasks = tasks;
    }

    public void setCategories(List<CategoryDAO> categories) {
        this.categories = categories;
    }

    public void setTags(List<TagDAO> tags) {
        this.tags = tags;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}
