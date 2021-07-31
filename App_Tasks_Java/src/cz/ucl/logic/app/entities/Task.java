package cz.ucl.logic.app.entities;

import cz.ucl.logic.app.entities.definition.*;

import java.time.LocalDateTime;
import java.util.Date;

public class Task implements ITask{
    private int id;
    private String title;
    private String note;
    private IUser user;
    private ICategory category;
    private boolean isDone;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private Date deadline;
    private Color color;
    private ITag tag;

    public Task(String title, String note, ICategory category, Date deadline) {
        this.title = title;
        this.note = note;
        this.category = category;
        this.deadline = deadline;
    }

    public Task(IUser userEntity, int id, String title, Color color, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.user = userEntity;
        this.id = id;
        this.title = title;
        this.color = color;
        this.color = color;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;

    }

    public Task(IUser userLoggedIn, String title) {
        this.user = userLoggedIn;
        this.title = title;
    }

    public Task(IUser userLoggedIn, String title, String note) {
        this.user = userLoggedIn;
        this.title = title;
        this.note = note;
    }

    public Task(IUser userLoggedIn, String title, String note, ICategory category) {
        this.user = userLoggedIn;
        this.title = title;
        this.note = note;
        this.category = category;
    }


    public Color getColor() {
        return color;
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
    public String getNote() {
        return note;
    }

    @Override
    public IUser getUser() {
        return user;
    }

    @Override
    public boolean isDone() {
        return isDone;
    }

    @Override
    public ICategory getCategory() {
        return category;
    }

    @Override
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    @Override
    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }
    public Date getDeadline(){
        return deadline;
    }

    @Override
    public ITag[] getTags() {
        return user.getTags();
    }

    @Override
    public ITag getTag(int i) {
        return user.getTag(i);
    }

    @Override
    public void saveTag(int i, ITag tag) {
    }

    @Override
    public void addTag(ITag tag) {
    }

    @Override
    public int tagsCount() {
        return user.tagsCount();
    }

    @Override
    public void complete() {
        this.isDone = true;

    }

    @Override
    public void reopen() {
    }

    public void setColor(Color color) {
        this.color = color;
    }
}
