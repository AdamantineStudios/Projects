package cz.ucl.logic.data.managers;

import cz.ucl.logic.app.entities.definition.IUser;
import cz.ucl.logic.data.dao.UserDAO;
import cz.ucl.logic.data.managers.definition.IUserManager;
import cz.ucl.logic.data.mappers.MapperFactory;

import java.util.ArrayList;
import java.util.List;

public class UserManager implements IUserManager {

    private List<UserDAO> userDatabase;
    private MapperFactory mappers;
    private ManagerFactory managers;

    public UserManager(ManagerFactory managers, MapperFactory mappers) {
        this.userDatabase = new ArrayList<>();
        this.mappers = mappers;
        this.managers = managers;
    }

    @Override
    public IUser[] getAllUsers() {
        IUser[] allUsers = new IUser[userDatabase.size()];
        for (int i = 0; i<userDatabase.size() ;i++){
            UserDAO dao = userDatabase.get(i);
            allUsers[i] = mappers.getUserMapper().mapFromDAODeep(dao);
        }
        return allUsers ;
    }

    @Override
    public IUser getUserByEmail(String email) {
        for (UserDAO dao : userDatabase){
            if (dao.getEmail() == email){
                return mappers.getUserMapper().mapFromDAODeep(dao);
            }
        }
        return null;
    }

    @Override
    public IUser getUserById(int userId) {
        for (UserDAO dao : userDatabase){
            if(dao.getId() == userId){
                return mappers.getUserMapper().mapFromDAODeep(dao);
            }
        }
        return null;
    }

    @Override
    public void createUser(IUser user) {
        UserDAO dao = mappers.getUserMapper().mapToDAODeep(user);
        userDatabase.add(dao);

    }

    @Override
    public void updateUser(IUser user) {
        int daoIndex = -1;
        for (int i = 0; i<userDatabase.size();i++){
            if (userDatabase.get(i).getId() == user.getId()){
                daoIndex = i;
                break;
            }
        }
        UserDAO newDao = mappers.getUserMapper().mapToDAODeep(user);
        userDatabase.set(daoIndex, newDao);
    }

    @Override
    public void deleteUserById(int userId) {
        int index = 0;
        for (UserDAO dao : userDatabase){
            if (dao.getId() == userId){
                index = userDatabase.indexOf(dao);
            }
        }
        userDatabase.remove(index);
    }
}
