package cz.ucl.logic.app.entities;

import cz.ucl.logic.app.entities.definition.ITask;
import cz.ucl.logic.app.entities.definition.ITaskOwner;

public class TaskOwner implements ITaskOwner {
    @Override
    public ITask[] getTasks() {
        return new ITask[0];
    }

    @Override
    public ITask getTask(int i) {
        return null;
    }

    @Override
    public void saveTask(int i, ITask task) {

    }

    @Override
    public void addTask(ITask task) {

    }

    @Override
    public int tasksCount() {
        return 0;
    }
}
