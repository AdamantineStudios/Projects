package cz.ucl.ui.cli.forms;

import cz.ucl.ui.definition.forms.FormFieldType;
import cz.ucl.ui.definition.forms.IFormField;

public class FormField implements IFormField {

    private String identifier;
    private String title;
    private FormFieldType type;
    private boolean isRequired;
    private String label;

    // TODO

    public FormField(String identifier, String title, FormFieldType type, boolean isRequired) {
        this.identifier = identifier;
        this.title = "Prosím zadejte " + title.toLowerCase() ;
        this.type = type;
        this.isRequired = isRequired;

    }

    public FormField(String identifier, String title, FormFieldType type) {
        this.identifier = identifier;
        this.title = title;
        this.type = type;
    }


    @Override
    public String getIdentifier() {
        return identifier;
    }

    @Override
    public String getTitle() {
        return title;
    }

    @Override
    public String getLabel() {
        return label;
    }

    @Override
    public FormFieldType getType() {
        return type;
    }

    @Override
    public boolean getIsRequired() {
        return isRequired;
    }

    // TODO
}
