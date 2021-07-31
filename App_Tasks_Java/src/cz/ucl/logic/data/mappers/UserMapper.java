package cz.ucl.logic.data.mappers;

import cz.ucl.logic.app.entities.Task;
import cz.ucl.logic.app.entities.User;
import cz.ucl.logic.app.entities.definition.ICategory;
import cz.ucl.logic.app.entities.definition.ITag;
import cz.ucl.logic.app.entities.definition.ITask;
import cz.ucl.logic.app.entities.definition.IUser;
import cz.ucl.logic.data.dao.CategoryDAO;
import cz.ucl.logic.data.dao.TagDAO;
import cz.ucl.logic.data.dao.TaskDAO;
import cz.ucl.logic.data.dao.UserDAO;
import cz.ucl.logic.data.mappers.definition.IUserMapper;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class UserMapper implements IUserMapper {

    MapperFactory factory;

    public UserMapper(MapperFactory factory) {
        this.factory = factory;
    }

    @Override
    public IUser mapFromDAOShallow(UserDAO dao) {
        IUser userEntity = new User(dao.getId(),dao.getEmail(),dao.getUsername(),dao.getPassword(), dao.getCreatedAt(),dao.getUpdatedAt());
        return userEntity;
    }

    @Override
    public UserDAO mapToDAOShallow(IUser entity) {
        UserDAO userDao = new UserDAO();

        userDao.setId(entity.getId());
        userDao.setUsername(entity.getUsername());
        userDao.setEmail(entity.getEmail());
        userDao.setPassword(entity.getPassword());
        userDao.setCreatedAt(entity.getCreatedAt());
        userDao.setUpdatedAt(entity.getUpdatedAt());
        return userDao;
    }

    @Override
    public IUser mapFromDAODeep(UserDAO dao) {
        IUser userEntity = mapFromDAOShallow(dao);

        List<ICategory> categoriesEntities = factory.getCategoryMapper().mapFromDAOsShallow(dao.getCategories());
        for (ICategory categoryEntity : categoriesEntities){
            userEntity.addCategory(categoryEntity);
        }

        List<ITag> tagsEntities = factory.getTagMapper().mapFromDAOsShallow(dao.getTags());
        for (ITag tagEntity : tagsEntities) {
            userEntity.addTag(tagEntity);
        }

        List<ITask> taskEntities = factory.getTaskMapper().mapFromDAOsShallow(dao.getTasks());
        for (ITask taskEntity : taskEntities){
            userEntity.addTask(taskEntity);
        }
        return userEntity;
    }

    @Override
    public UserDAO mapToDAODeep(IUser entity) {
        UserDAO userDao = mapToDAOShallow(entity);

        List<ICategory> categoryEntities = Arrays.asList(entity.getCategories());
        List<CategoryDAO> categoryDaos = factory.getCategoryMapper().mapToDAOsSHallow(categoryEntities);
        for (CategoryDAO categoryDAO : categoryDaos){
            userDao.getCategories().add(categoryDAO);
        }
        List<ITag> tagEntities = Arrays.asList(entity.getTags());
        System.out.println(tagEntities);
        List<TagDAO> tagDaos = factory.getTagMapper().mapToDAOsShallow(tagEntities);
        System.out.println(tagDaos);
        for (TagDAO tagDAO : tagDaos){
            userDao.getTags().add(tagDAO);
        }

        List<ITask> taskEntities = Arrays.asList(entity.getTasks());
        List<TaskDAO> taskDaos = factory.getTaskMapper().mapToDAOsShallow(taskEntities);
        for (TaskDAO taskDao : taskDaos) {
            userDao.getTasks().add(taskDao);
        }

        return userDao;
    }

    @Override
    public List<IUser> mapFromDAOsShallow(List<UserDAO> daos) {
        List<IUser> userEntities = new ArrayList<>();
        for (UserDAO dao : daos){
            userEntities.add(mapFromDAOShallow(dao));
        }

        return userEntities;
    }

    @Override
    public List<UserDAO> mapToDAOsShallow(List<IUser> entities) {
        List<UserDAO> userDaos = new ArrayList<>();
        for (IUser entity : entities){
            userDaos.add(mapToDAOShallow(entity));
        }
        return userDaos;
    }
}
