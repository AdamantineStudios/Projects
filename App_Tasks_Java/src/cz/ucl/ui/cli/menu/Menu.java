package cz.ucl.ui.cli.menu;

import cz.ucl.logic.IAppLogic;
import cz.ucl.ui.cli.forms.Form;
import cz.ucl.ui.definition.IUserInterface;
import cz.ucl.ui.definition.forms.IForm;
import cz.ucl.ui.definition.forms.IFormField;
import cz.ucl.ui.definition.menu.IMenu;
import cz.ucl.ui.definition.menu.IMenuOption;
import cz.ucl.ui.definition.menu.MenuType;

import java.util.ArrayList;
import java.util.List;

public abstract class Menu implements IMenu {
    private String identifier;
    private String title;

    @Override
    public String getIdentifier() {
        return identifier;
    }

    @Override
    public String getTitle() {
        return title;
    }

    @Override
    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String getDescription() {
        return description;
    }



    private String description;
    private List<IMenuOption> options;
    private IForm form;
    private boolean isBuilt;

    protected IUserInterface ui;
    protected IAppLogic logic;
    protected IMenu parentMenu;

    public Menu(IMenu parentMenu, String identifier, String title) {
        if (parentMenu != null) {
            this.ui = parentMenu.getParentInterface();
            this.logic = parentMenu.getLogic();
        }
        this.parentMenu = parentMenu;
        this.identifier = identifier;
        this.title = title;

        this.options = new ArrayList<>();
        this.form = new Form(this);

        this.isBuilt = false;
    }

    @Override
    public IMenu getParentMenu() {
        return parentMenu;
    }

    @Override
    public List<IMenuOption> getOptions() {
        return options;
    }

    @Override
    public int[] getValidOptionNumbers() {
        return new int[options.size()];
    }

    @Override
    public IMenuOption getOptionForNumber(int optionNumber) {
        return options.get(optionNumber-1);
    }

    @Override
    public void addOption(IMenuOption option) {
        this.options.add(option);

    }

    @Override
    public int nextOptionNumber() {
        return options.size()+1;
    }
    public String stringOptions(List<IMenuOption> options){
        String write = "";
        for (IMenuOption option : options){
         System.out.println((Integer.toString(option.getNumber()))+ "/" + option.getTitle());
        } return "";
    }

    @Override
    public String render() {
        return ui.getMenuView().formatMenu(this);
//        return title + "\n"
//                + description + "\n"
//                + stringOptions(options);

//        return "Menu{" +
//                "title='" + title + '\'' +
//                ", description='" + description + '\'' +
//                ", options=" + stringOptions(options) +
//                '}';
    }

    @Override
    public IAppLogic getLogic() {
        return logic;
    }

    @Override
    public IUserInterface getParentInterface() {
        return ui;
    }

    @Override
    public boolean isSystemMenu() {
        if (getType().equals(MenuType.SYSTEM_FILL_FORM)){
            return true;
        } else if (getType().equals(MenuType.SYSTEM_BACK)){
            return true;
        } else if (getType().equals(MenuType.SYSTEM_QUIT)){
            return true;
        } else return false;
//        if (identifier == "fill_form"){
//            return true;
//        }
//        if (identifier == "back"){
//            return true;
//        }
//        if (identifier == "quit"){
//            return true;
//        } else return false;

    }

    @Override
    public MenuType getType() {
        if (getIdentifier().equals("fill_form")){
            return MenuType.SYSTEM_FILL_FORM;
        }
        if (getIdentifier().equals("back")){
            return MenuType.SYSTEM_BACK;
        }
        if (getIdentifier().equals("quit")){
            return MenuType.SYSTEM_QUIT;
        } else return MenuType.USER;
    }

    @Override
    public IFormField[] getFormFields() {
        return form.getFormFields();
    }

    @Override
    public void addFormField(IFormField field) {
        form.addFormField(field);

    }

    @Override
    public String renderFormField(IFormField formField) {
        return form.renderFormField(formField);
    }

    @Override
    public boolean isForm() {
        return form.isForm();
    }

    /** This method should be used for building the menu - setting description, adding options, etc */
    protected abstract void build();

    @Override
    public void initialize() {
        if (!isBuilt) {
            build();
            isBuilt = true;
        }
    }

}
