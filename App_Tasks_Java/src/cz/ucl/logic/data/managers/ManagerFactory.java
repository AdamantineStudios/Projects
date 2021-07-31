package cz.ucl.logic.data.managers;

import cz.ucl.logic.data.managers.definition.ICategoryManager;
import cz.ucl.logic.data.managers.definition.ITagManager;
import cz.ucl.logic.data.managers.definition.ITaskManager;
import cz.ucl.logic.data.managers.definition.IUserManager;
import cz.ucl.logic.data.mappers.MapperFactory;

public class ManagerFactory {

    ICategoryManager categoryManager;
    IUserManager userManager;
    ITaskManager taskManager;
    ITagManager tagManager;

    public ManagerFactory(MapperFactory mappers) {
        this.categoryManager = new CategoryManager(this, mappers);
        this.userManager = new UserManager(this, mappers);
        this.taskManager = new TaskManager(this, mappers);
        this.tagManager = new TagManager(this, mappers);
    }

    public IUserManager getUserManager() {
        return userManager;
    }

    public ICategoryManager getCategoryManager() {
        return categoryManager;
    }

    public ITagManager getTagManager() {
        return tagManager;
    }

    public ITaskManager getTaskManager() {
        return taskManager;
    }
}
