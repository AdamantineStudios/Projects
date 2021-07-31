package cz.ucl.ui.cli.views;

import cz.ucl.ui.cli.menu.Menu;
import cz.ucl.ui.definition.menu.IMenu;
import cz.ucl.ui.definition.menu.IMenuOption;
import cz.ucl.ui.definition.views.IMenuView;

import java.util.List;

public class MenuView implements IMenuView {
    @Override
    public String formatMenuOption(IMenuOption option) {
        return null;
    }

    @Override
    public String formatMenu(Menu menu) {
        StringBuilder string = new StringBuilder();
        string.append(menu.getTitle()).append("\n");
        string.append(menu.getDescription()).append("\n");

        for (IMenuOption option : menu.getOptions()){
            string.append(option.getNumber()).append(". ");
            string.append(option.getTitle()).append("\n");
        }

        return string.toString();
    }

    @Override
    public String drawDescription(Menu menu) {
        return null;
    }

    @Override
    public String drawHeader(IMenu currentMenu) {
        return null;
    }

    @Override
    public String drawSeparator() {
        return null;
    }

    @Override
    public String drawNewLine() {
        return null;
    }

    @Override
    public String drawBreadcrumbs(IMenu currentMenu) {
        return null;
    }

    @Override
    public String drawOptions(IMenu currentMenu) {
        String write = "";
        for (IMenuOption option : currentMenu.getOptions()){
            System.out.println((Integer.toString(option.getNumber()))+ "/" + option.getTitle());
        } return "";

    }

    @Override
    public String drawMessage(String message) {
        return message;
    }

    @Override
    public String drawError(String message) {
        return message;
    }

    @Override
    public String drawPrompt(String message) {
        return message;
    }
}
