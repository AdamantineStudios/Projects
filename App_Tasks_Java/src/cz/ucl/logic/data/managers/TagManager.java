package cz.ucl.logic.data.managers;


import cz.ucl.logic.app.entities.definition.ITag;
import cz.ucl.logic.app.entities.definition.IUser;
import cz.ucl.logic.data.dao.TagDAO;
import cz.ucl.logic.data.managers.definition.ITagManager;
import cz.ucl.logic.data.mappers.MapperFactory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TagManager implements ITagManager {

    private Map<String, List<TagDAO>> tagDatabase;
    private MapperFactory mappers;
    private ManagerFactory managers;

    public TagManager(ManagerFactory managers, MapperFactory mappers){
        this.tagDatabase = new HashMap<>();
        this.mappers = mappers;
        this.managers = managers;
    }

    private List<TagDAO> getDAOsForUserLoggedIn(IUser user){
        List<TagDAO> userTags = tagDatabase.get(user.getEmail());
        if (userTags == null){
            userTags = new ArrayList<>();
            tagDatabase.put(user.getEmail(), userTags);
        }
        return userTags;
    }
    @Override
    public ITag[] getAllTagsForUser(IUser user) {
        List<TagDAO> userTags = getDAOsForUserLoggedIn(user);
        ITag[] loadedTags = new ITag[userTags.size()];
        for (int i = 0; i<userTags.size();i++){
            TagDAO dao = userTags.get(i);
            loadedTags[i] = mappers.getTagMapper().mapFromDAODeep(dao);
        }
        return loadedTags;
    }

    @Override
    public ITag getTagByIdForUser(int tagId, IUser user) {
        List<TagDAO> userTags = getDAOsForUserLoggedIn(user);
        for(TagDAO tagDao : userTags){
            if (tagDao.getId() == tagId){
                return mappers.getTagMapper().mapFromDAODeep(tagDao);
            }
        }
        return null;
    }

    @Override
    public void createTag(ITag tag) {
        List<TagDAO> userTags = getDAOsForUserLoggedIn(tag.getUser());
        TagDAO dao = mappers.getTagMapper().mapToDAODeep(tag);

        userTags.add(dao);

    }

    @Override
    public void updateTag(ITag tag) {
        List<TagDAO> userTags = getDAOsForUserLoggedIn(tag.getUser());
        int daoIndex = -1;
        for (int i = 0; i<userTags.size();i++){
            if (userTags.get(i).getId() == tag.getId()){
                daoIndex = i;
                break;
            }
        }
        TagDAO newDao = mappers.getTagMapper().mapToDAODeep(tag);
        userTags.set(daoIndex,newDao);

    }

    @Override
    public void deleteTagByIdForUser(int tagId, IUser user) {
        List<TagDAO> userTags = getDAOsForUserLoggedIn(user);
        int foundTaskIndex = -1;
        for (TagDAO dao : userTags){
            if (dao.getId() == tagId){
                foundTaskIndex = userTags.indexOf(dao);
            }
        }
        userTags.remove(foundTaskIndex);

    }
}
