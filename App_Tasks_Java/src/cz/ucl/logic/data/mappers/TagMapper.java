package cz.ucl.logic.data.mappers;

import cz.ucl.logic.app.entities.Tag;
import cz.ucl.logic.app.entities.definition.ITag;
import cz.ucl.logic.app.entities.definition.ITask;
import cz.ucl.logic.app.entities.definition.IUser;
import cz.ucl.logic.data.dao.TagDAO;
import cz.ucl.logic.data.dao.TaskDAO;
import cz.ucl.logic.data.dao.UserDAO;
import cz.ucl.logic.data.mappers.definition.ITagMapper;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TagMapper implements ITagMapper {
    MapperFactory factory;

    public TagMapper(MapperFactory factory) {
        this.factory = factory;
    }


    @Override
    public ITag mapFromDAOShallow(TagDAO dao) {
        IUser userEntity = factory.getUserMapper().mapFromDAOShallow(dao.getUser());
        ITag tagEntity = new Tag(userEntity, dao.getId(),dao.getTitle(),dao.getColor(),dao.getCreatedAt(),dao.getUpdatedAt());

        return tagEntity;
    }

    @Override
    public TagDAO mapToDAOShallow(ITag entity) {
        UserDAO userDAO = factory.getUserMapper().mapToDAOShallow(entity.getUser());
        TagDAO tagDAO = new TagDAO();

        tagDAO.setUser(userDAO);
        tagDAO.setId(entity.getId());
        tagDAO.setTitle(entity.getTitle());
        tagDAO.setColor(entity.getColor());
        tagDAO.setCreatedAt(entity.getCreatedAt());
        tagDAO.setUpdatedAt(entity.getUpdatedAt());
        return tagDAO;
    }

    @Override
    public ITag mapFromDAODeep(TagDAO dao) {
        ITag tagEntity = mapFromDAOShallow(dao);
        List<ITask> taskEntities = factory.getTaskMapper().mapFromDAOsShallow(dao.getTasks());
        for (ITask taskEntity : taskEntities){
            tagEntity.addTask(taskEntity);
        }
        return tagEntity;
    }

    @Override
    public TagDAO mapToDAODeep(ITag entity) {
        TagDAO tagDAO = mapToDAOShallow(entity);

        List<ITask> taskEntities = Arrays.asList(entity.getTasks());
        List<TaskDAO> taskDaos = factory.getTaskMapper().mapToDAOsShallow(taskEntities);
        for(TaskDAO taskDao : taskDaos){
            tagDAO.getTasks().add(taskDao);
        }
        return tagDAO;
    }

    @Override
    public List<ITag> mapFromDAOsShallow(List<TagDAO> daos) {
        List<ITag> tagEntities = new ArrayList<>();
        for (TagDAO dao : daos){
            tagEntities.add(mapFromDAOShallow(dao));
        }
        return tagEntities;
    }

    @Override
    public List<TagDAO> mapToDAOsShallow(List<ITag> entities) {
        List<TagDAO> tagDAOS = new ArrayList<>();
        for (ITag entity : entities){
            tagDAOS.add(mapToDAOShallow(entity));
        }
        return tagDAOS;
    }
}
