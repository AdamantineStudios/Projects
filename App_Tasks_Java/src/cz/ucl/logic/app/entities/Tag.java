package cz.ucl.logic.app.entities;

import cz.ucl.logic.app.entities.definition.Color;
import cz.ucl.logic.app.entities.definition.ITag;
import cz.ucl.logic.app.entities.definition.ITask;
import cz.ucl.logic.app.entities.definition.IUser;

import java.time.LocalDateTime;
import java.util.Date;

public class Tag implements ITag {
    private int id;
    private String title;
    private Color color;
    private IUser user;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private ITask[] tasks;

    public Tag(IUser user,int id, String title, Color color,LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.user = user;
        this.id = id;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.tasks = tasks;
        this.title = title;
        this.color = color;
    }

    public Tag(IUser userLoggedIn, String title) {
        this.user = userLoggedIn;
        this.title = title;
    }

    public Tag(IUser userLoggedIn, String title, Color color) {
        this.user = userLoggedIn;
        this.title = title;
        this.color = color;
    }

    public ITask[] getTask() {
        return tasks;
    }

    @Override
    public int getId() {
        return id;
    }

    @Override
    public IUser getUser() {
        return user;
    }

    @Override
    public String getTitle() {
        return title;
    }

    @Override
    public Color getColor() {
        return color;
    }

    @Override
    public ITask[] getTasks() {
        return user.getTasks();
    }

    @Override
    public ITask getTask(int i) {
        return user.getTask(i);
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    @Override
    public void saveTask(int i, ITask task) {
    }

    @Override
    public void addTask(ITask task) {
    }

    @Override
    public int tasksCount() {
        return user.tasksCount();
    }
}
