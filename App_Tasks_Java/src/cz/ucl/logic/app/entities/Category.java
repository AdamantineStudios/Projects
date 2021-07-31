package cz.ucl.logic.app.entities;

import cz.ucl.logic.app.entities.definition.Color;
import cz.ucl.logic.app.entities.definition.ICategory;
import cz.ucl.logic.app.entities.definition.ITask;
import cz.ucl.logic.app.entities.definition.IUser;

import java.time.LocalDateTime;
import java.util.List;


public class Category implements ICategory {
    private int id = 0;
    private String title;
    private Color color;
    private IUser user;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private List<ITask> tasks;

    public Category(String title){
        this.title = title;
    }
    public Category(String title, Color color, IUser user) {
        this.id = id++;
        this.user = user;
        this.title = title;
        this.color = color;
    }

    public Category(IUser userLoggedIn,String title, Color color) {
        this.user = userLoggedIn;
        this.title = title;
        this.color = color;
    }

    public Category(IUser userLoggedIn,String title) {
        this.user = userLoggedIn;
        this.title = title;
    }

    public Category(IUser userLoggedIn) {
        this.user = userLoggedIn;
    }

    public Category(IUser userLoggedIn, int id, String title, Color color, LocalDateTime createdAt, LocalDateTime now) {
        this.user = userLoggedIn;
        this.id = id;
        this.title = title;
        this.color = color;
        this.createdAt = createdAt;
        this.updatedAt = now;
    }

    @Override
    public int getId() {
        return id;
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
    public IUser getUser() {
        return user;
    }


    @Override
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    @Override
    public LocalDateTime getUpdatedAt() {
        return createdAt;
    }

    @Override
    public ITask[] getTasks() {
        return user.getTasks();
    }

    @Override
    public ITask getTask(int i) {
        return user.getTask(i);
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
