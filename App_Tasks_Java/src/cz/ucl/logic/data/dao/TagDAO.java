package cz.ucl.logic.data.dao;

import cz.ucl.logic.app.entities.definition.Color;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class TagDAO {

    private int id;
    private String title;
    private Color color;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private UserDAO user;
    private List<TaskDAO> tasks;

    public TagDAO(){
        tasks = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public Color getColor() {
        return color;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public UserDAO getUser() {
        return user;
    }

    public List<TaskDAO> getTasks() {
        return tasks;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public void setUser(UserDAO user) {
        this.user = user;
    }

    public void setTasks(List<TaskDAO> tasks) {
        this.tasks = tasks;
    }
}
