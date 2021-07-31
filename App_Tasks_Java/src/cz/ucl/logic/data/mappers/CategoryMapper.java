package cz.ucl.logic.data.mappers;

import cz.ucl.logic.app.entities.Category;
import cz.ucl.logic.app.entities.definition.ICategory;
import cz.ucl.logic.app.entities.definition.ITag;
import cz.ucl.logic.app.entities.definition.ITask;
import cz.ucl.logic.app.entities.definition.IUser;
import cz.ucl.logic.data.dao.CategoryDAO;
import cz.ucl.logic.data.dao.TaskDAO;
import cz.ucl.logic.data.dao.UserDAO;
import cz.ucl.logic.data.mappers.definition.ICategoryMapper;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CategoryMapper implements ICategoryMapper {
    MapperFactory factory;

    public CategoryMapper(MapperFactory factory) {
        this.factory = factory;
    }


    @Override
    public ICategory mapFromDAOShallow(CategoryDAO dao) {
        IUser userEntity = factory.getUserMapper().mapFromDAOShallow(dao.getUser());
        ICategory categoryEntity = new Category(userEntity,dao.getId(),dao.getTitle(),dao.getColor(),dao.getCreatedAt(), LocalDateTime.now());
        return categoryEntity;
    }

    @Override
    public CategoryDAO mapToDAOShallow(ICategory entity) {
        UserDAO userDAO = factory.getUserMapper().mapToDAOShallow(entity.getUser());
        CategoryDAO categoryDAO = new CategoryDAO();

        categoryDAO.setUser(userDAO);
        categoryDAO.setColor(entity.getColor());
        categoryDAO.setId(entity.getId());
        categoryDAO.setCreatedAt(entity.getCreatedAt());
        categoryDAO.setUpdatedAt(entity.getUpdatedAt());
        categoryDAO.setTitle(entity.getTitle());

        return categoryDAO;
    }

    @Override
    public ICategory mapFromDAODeep(CategoryDAO dao) {
        ICategory categoryEntity = mapFromDAOShallow(dao);

        List<ITask> taskEntities = factory.getTaskMapper().mapFromDAOsShallow(dao.getTasks());
        for (ITask taskEntity : taskEntities){
            categoryEntity.addTask(taskEntity);
        }
        return categoryEntity;
    }

    @Override
    public CategoryDAO mapToDAODeep(ICategory entity) {
        CategoryDAO categoryDAO = mapToDAOShallow(entity);
        List<ITask> taskEntities = Arrays.asList(entity.getTasks());
        List<TaskDAO> taskDaos = factory.getTaskMapper().mapToDAOsShallow(taskEntities);
        for (TaskDAO taskDAO : taskDaos){
            categoryDAO.getTasks().add(taskDAO);
        }
        return categoryDAO;
    }

    @Override
    public List<ICategory> mapFromDAOsShallow(List<CategoryDAO> daos) {
        List<ICategory> categoryEntities = new ArrayList<>();
        for (CategoryDAO dao : daos){
            categoryEntities.add(mapFromDAOShallow(dao));
        }
        return categoryEntities;
    }

    @Override
    public List<CategoryDAO> mapToDAOsSHallow(List<ICategory> entities) {
        List<CategoryDAO> categoryDaos = new ArrayList<>();
        for (ICategory entity : entities){
            categoryDaos.add(mapToDAODeep(entity));
        }
        return categoryDaos;
    }
}
