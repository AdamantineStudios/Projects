package cz.ucl.logic.app.entities;

import cz.ucl.logic.app.entities.definition.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class User extends TaskOwner implements IUser {
    private int id;
    private String email;
    private String username;
    private String password;
    private List<ITask> tasks;
    private List<ITag> tags;
    private List<ICategory> categories;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private static int latestId=0;


    //region Constructors
    public User(int id,String email, String username, String password, LocalDateTime createdAt, LocalDateTime updatedAt){
        this.id=id;
        latestId++;
        this.email=email;
        this.username=username;
        this.password=password;
        this.categories=new ArrayList<ICategory>();
        this.tags=new ArrayList<ITag>();
        this.tasks=new ArrayList<ITask>();
    }

    public User(int id,String email, String username, String password){
        this(id, email, username,password, LocalDateTime.now(), LocalDateTime.now());}

    public User(String email, String username, String password){
        this(latestId++,email, username,password, LocalDateTime.now(), LocalDateTime.now());
    }
    //endregion

    // region User
    @Override
    public int getId() {
        return id;
    }

    @Override
    public String getEmail() {
        return email;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public String getPassword() {
        return password;
    }
    //endregion


    //region Categories
    @Override
    public ICategory[] getCategories() {
        return categories.toArray(new ICategory[categories.size()]);
    }

    @Override
    public ICategory getCategory(int i) {
        return categories.get(i);
    }

    @Override
    public void addCategory(ICategory category) {
        categories.add(category);
    }
    @Override
    public int categoriesCount() {
        return categories.size();
    }

    @Override
    public void saveCategory(int i, ICategory category) {
        categories.set(i, category);
    }
    //endregion


    @Override
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    @Override
    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    //region Tag
    @Override
    public ITag[] getTags() {
        return tags.toArray(new ITag[tags.size()]);
    }

    @Override
    public ITag getTag(int i) {
        return tags.get(i);
    }

    @Override
    public void addTag(ITag tag) {
        tags.add(tag);
    }

    @Override
    public void saveTag(int i, ITag tag) {
        tags.set(i, tag);
    }
    @Override
    public int tagsCount() {
        return tags.size();
    }
}
