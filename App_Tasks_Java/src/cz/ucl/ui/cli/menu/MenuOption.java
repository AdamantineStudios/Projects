package cz.ucl.ui.cli.menu;

import cz.ucl.ui.definition.menu.IMenu;
import cz.ucl.ui.definition.menu.IMenuOption;

public class MenuOption implements IMenuOption {
    private int number;
    private IMenu menu;

    public MenuOption(int number, IMenu menu) {
        this.number = number;
        this.menu = menu;
    }

    @Override
    public int getNumber() {
        return number;
    }

    @Override
    public String getTitle() {
        return menu.getTitle();
    }

    @Override
    public IMenu getMenu() {
        return menu;
    }
}
