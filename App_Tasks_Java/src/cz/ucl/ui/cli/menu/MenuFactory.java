package cz.ucl.ui.cli.menu;

import cz.ucl.logic.IAppLogic;
import cz.ucl.ui.cli.forms.FormField;
import cz.ucl.ui.cli.menu.system.BackMenu;
import cz.ucl.ui.cli.menu.system.FillFormMenu;
import cz.ucl.ui.cli.menu.system.QuitMenu;
import cz.ucl.ui.cli.menu.user.MainMenu;
import cz.ucl.ui.definition.IUserInterface;
import cz.ucl.ui.definition.forms.FormFieldType;
import cz.ucl.ui.definition.forms.IFormField;
import cz.ucl.ui.definition.menu.IMenu;
import cz.ucl.ui.definition.menu.IMenuFactory;
import cz.ucl.ui.definition.menu.IMenuOption;
import cz.ucl.ui.definition.menu.MenuType;

import java.util.List;

public class MenuFactory implements IMenuFactory {
    @Override
    public IMenu createMainMenu(IUserInterface ui) {
        return new MainMenu(ui, "HLAVNÍ NABÍDKA");
    }

    @Override
    public IMenu createQuitMenu(IMenu parentMenu) {
        return new QuitMenu(parentMenu, "Ukončit aplikaci");
    }


    @Override
    public IMenu createFillFormMenu(IMenu parentMenu) {
        return new FillFormMenu(parentMenu, "Vyplnit formulář");

    }

    @Override
    public IMenu createBackMenu(IMenu parentMenu) {
        return new BackMenu(parentMenu, "Zpět");
    }

    @Override
    public IMenu createLoginFormMenu(IMenu parentMenu) {
        return new FormMenu(parentMenu, "login", "Přihlásit se") {
            @Override
            protected void defineForm() {
                addFormField(new FormField("email", "Zadejte váš e-mail: ", FormFieldType.TEXTUAL));
                addFormField(new FormField("password", "Zadejte vaše heslo: ", FormFieldType.SECURE));
            }

            @Override
            protected void build() {
                setDescription("--------------------------------------------------------------------------------------------------\n" +
                        "Pro přihlášení je třeba zadat uživatelské jméno a heslo. \n" +
                        "--------------------------------------------------------------------------------------------------");

                IMenu fillMenu = ui.getMenuFactory().createFillFormMenu(this);
                IMenu backMenu = ui.getMenuFactory().createBackMenu(this);

                addOption(new MenuOption(nextOptionNumber(), fillMenu));
                addOption(new MenuOption(nextOptionNumber(), backMenu));
            }
        };
    }

    @Override
    public IMenu createRegistrationFormMenu(IMenu parentMenu) {
        return new FormMenu(parentMenu, "register", "Registrovat se") {


            @Override
            protected void defineForm() {
                addFormField(new FormField("username", "Zadejte uživatelské jméno: ", FormFieldType.TEXTUAL));
                addFormField(new FormField("email", "Zadejte E-Mail: ", FormFieldType.TEXTUAL));
                addFormField(new FormField("password", "Zadejte heslo: ", FormFieldType.SECURE));
            }

            @Override
            protected void build() {
                setDescription("--------------------------------------------------------------------------------------------------\n" +
                        "Pro registraci je třeba zadat e-mail, uživatelské jméno a heslo.\n" +
                        "--------------------------------------------------------------------------------------------------");

                IMenu fillMenu = ui.getMenuFactory().createFillFormMenu(this);
                IMenu backMenu = ui.getMenuFactory().createBackMenu(this);

                addOption(new MenuOption(nextOptionNumber(), fillMenu));
                addOption(new MenuOption(nextOptionNumber(), backMenu));
            }
        };
    }
}

//    public IMenu loggedMainMenu(IMenu parentMenu){
//        return new Menu(parentMenu,"main_menu","Hlavni nabidka"){
//            @Override
//            protected void build() {
//                setDescription("Vyberte si akci: ");
//
//                IMenu listTasks = ui.getMenuFactory().createListTasks(this);
//                IMenu unfinishedTasks = ui.getMenuFactory().createunfinishedTasks(this);
//                IMenu finishedTasks = ui.getMenuFactory().createfinishedTasks(this);
//                IMenu addTask = ui.getMenuFactory().createAddTask(this);
//                IMenu appSettings = ui.getMenuFactory().createappSettings(this);
//                IMenu createQuitMenu = ui.getMenuFactory().createQuitMenu(this);
//
//
//                addOption(new MenuOption(nextOptionNumber(),listTasks));
//                addOption(new MenuOption(nextOptionNumber(), unfinishedTasks));
//                addOption(new MenuOption(nextOptionNumber(), finishedTasks));
//                addOption(new MenuOption(nextOptionNumber(), addTask));
//                addOption(new MenuOption(nextOptionNumber(), appSettings));
//                addOption(new MenuOption(nextOptionNumber(), createQuitMenu));
//            }
//        };
//    }
//}
