package cz.ucl.logic;

import cz.ucl.logic.app.entities.definition.ICategory;
import cz.ucl.logic.app.entities.definition.ITag;
import cz.ucl.logic.app.entities.definition.ITask;
import cz.ucl.logic.app.entities.definition.IUser;
import cz.ucl.logic.app.services.definition.ICategoryService;
import cz.ucl.logic.app.services.definition.ITagService;
import cz.ucl.logic.app.services.definition.ITaskService;
import cz.ucl.logic.app.services.definition.IUserService;

/**
 * Everything which is shown (or done) by the AppLogic, has to be related only to the logged in user
 */
public interface IAppLogic extends ICategoryService, IUserService, ITaskService, ITagService {
    //region Tasks
    /** Returns one task by its ID */
    ITask getTaskById(int id);

    /** Returns all tasks without any filter by category or tags */
    ITask[] getAllTasks();

    //endregion

    //region Tags
    /** Returns all tags */
    ITag[] getAllTags();
    //endregion

    //region Mock Data
    /** Generates mock (testing) data */
    void generateMockData();
    //endregion
}
