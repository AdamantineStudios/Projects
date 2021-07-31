package cz.ucl.ui.cli.menu.user;

import cz.ucl.logic.IAppLogic;
import cz.ucl.logic.app.entities.definition.IUser;
import cz.ucl.ui.cli.menu.Menu;
import cz.ucl.ui.cli.menu.MenuOption;
import cz.ucl.ui.definition.IUserInterface;
import cz.ucl.ui.definition.forms.IFormField;
import cz.ucl.ui.definition.menu.IMenu;
import cz.ucl.ui.definition.menu.IMenuOption;
import cz.ucl.ui.definition.menu.MenuType;

import java.util.List;

public class MainMenu extends Menu {
    String title;
    String description;
    public MainMenu(IUserInterface ui, String title) {
        super(null, "main_menu", title);

        this.ui = ui;
        this.logic = ui.getLogic();
        this.title = title;
    }

    @Override
    protected void build() {
        setDescription(
                "--------------------------------------------------------------------------------------------------\n" +
                        "Pokud chcete naší aplikaci využívat je nutné se nejdříve přihlásit. \n" +
                        "Aby jste se mohli přihlásit musíte mít svůj vlastní uživatelský účet, pokud takovýto účet nemáte \n" +
                        "je možné se registrovat. \n" +
                        "--------------------------------------------------------------------------------------------------"
        );

        IMenu loginMenu = ui.getMenuFactory().createLoginFormMenu(this);
        IMenu registerMenu = ui.getMenuFactory().createRegistrationFormMenu(this);
        IMenu quitMenu = ui.getMenuFactory().createQuitMenu(this);

        addOption(new MenuOption(nextOptionNumber(), loginMenu));
        addOption(new MenuOption(nextOptionNumber(), registerMenu));
        addOption(new MenuOption(nextOptionNumber(), quitMenu));
    }


}
