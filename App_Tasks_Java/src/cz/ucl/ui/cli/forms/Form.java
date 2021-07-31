package cz.ucl.ui.cli.forms;

import cz.ucl.ui.definition.forms.IForm;
import cz.ucl.ui.definition.forms.IFormField;
import cz.ucl.ui.definition.menu.IMenu;
import cz.ucl.ui.definition.menu.MenuType;

import java.util.ArrayList;
import java.util.List;

public class Form implements IForm {
    private List<IFormField> fields;
    private IMenu menu;

    public Form(IMenu parentMenu) {
        this.menu = parentMenu;
        this.fields = new ArrayList<>();
    }

    // TODO

    @Override
    public IFormField[] getFormFields() {
        IFormField[] formFields = new IFormField[fields.size()];
        for (int i = 0; i<fields.size();i++){
            formFields[i] = fields.get(i);
        }
        return formFields;
    }

    @Override
    public void addFormField(IFormField field) {
        fields.add(field);
    }

    @Override
    public String renderFormField(IFormField formField) {
        StringBuilder string = new StringBuilder();
        string.append(formField.getTitle()).append("\n");
        return string.toString();
    }

    @Override
    public boolean isForm() {
        if (getFormFields().length >0 ){
            return true;
        } else return false;
    }
}
