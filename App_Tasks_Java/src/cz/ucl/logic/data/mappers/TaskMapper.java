package cz.ucl.logic.data.mappers;

import cz.ucl.logic.app.entities.Task;
import cz.ucl.logic.app.entities.definition.ICategory;
import cz.ucl.logic.app.entities.definition.ITag;
import cz.ucl.logic.app.entities.definition.ITask;
import cz.ucl.logic.app.entities.definition.IUser;
import cz.ucl.logic.data.dao.CategoryDAO;
import cz.ucl.logic.data.dao.TagDAO;
import cz.ucl.logic.data.dao.TaskDAO;
import cz.ucl.logic.data.dao.UserDAO;
import cz.ucl.logic.data.mappers.definition.ITaskMapper;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TaskMapper implements ITaskMapper {
    MapperFactory factory;

    public TaskMapper(MapperFactory factory) {
        this.factory = factory;
    }

    @Override
    public ITask mapFromDAOShallow(TaskDAO dao) {
        IUser userEntity = factory.getUserMapper().mapFromDAOShallow(dao.getUser());
        ITask taskEntity = new Task(userEntity, dao.getId(),dao.getTitle(),dao.getColor(),dao.getCreatedAt(),dao.getUpdatedAt());
        return taskEntity;
    }

    @Override
    public TaskDAO mapToDAOShallow(ITask entity) {
        UserDAO userDAO = factory.getUserMapper().mapToDAOShallow(entity.getUser());
        TaskDAO taskDAO = new TaskDAO();

        taskDAO.setUser(userDAO);
        taskDAO.setId(entity.getId());
        taskDAO.setTitle(entity.getTitle());
        taskDAO.setCreatedAt(entity.getCreatedAt());
        taskDAO.setUpdatedAt(entity.getUpdatedAt());
        taskDAO.setNote(entity.getNote());
        taskDAO.setDeadline(entity.getDeadline());

        return taskDAO;
    }

    @Override
    public ITask mapFromDAODeep(TaskDAO dao) {
        ITask taskEntity = mapFromDAOShallow(dao);

        List<ITag> tagsEntities = factory.getTagMapper().mapFromDAOsShallow(dao.getTags());
        for (ITag tagEntity : tagsEntities){
            taskEntity.addTag(tagEntity);
        }
        return taskEntity;
    }

    @Override
    public TaskDAO mapToDAODeep(ITask entity) {
        TaskDAO taskDAO = mapToDAOShallow(entity);

        List<ITag> tagEntities = Arrays.asList(entity.getTags());
        List<TagDAO> tagDaos = factory.getTagMapper().mapToDAOsShallow(tagEntities);
        for (TagDAO tagDAO : tagDaos){
            taskDAO.getTags().add(tagDAO);
        }

        return taskDAO;
    }

    @Override
    public List<ITask> mapFromDAOsShallow(List<TaskDAO> daos) {
        List<ITask> taskEntities = new ArrayList<>();
        for (TaskDAO dao : daos) {
            taskEntities.add(mapFromDAOShallow(dao));
        }
        return taskEntities;
    }

    @Override
    public List<TaskDAO> mapToDAOsShallow(List<ITask> entities) {
        List<TaskDAO> taskDaos = new ArrayList<>();
        for (ITask entity : entities){
            taskDaos.add(mapToDAODeep(entity));
        }
        return taskDaos;
    }
}
