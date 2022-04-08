package com.example.praktikum.handlingFormInput;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class FormService{

    public FormService() {
        forms.add(new Form(0, "Test1", "Das ist ein Test"));
        forms.add(new Form(1, "Test2", "Hallo Welt"));
    }

    private List<Form> forms = new ArrayList<>();

    public List<Form> getForms(){
        return forms;
    }

    public void addForm(Form form){
        forms.add(form);
    }

    public void deleteEntry(long id) {
        for (int i = 0; i < forms.size(); i++) {
            if (forms.get(i).getId() == id) {
                forms.remove(i);
            }
        }
    }

    public long getSize() {
        return forms.size();
    }

    public Form getForm(long id) {
        for (Form f : forms) {
            if (f.getId() == id) {
                return f;
            }
        }
        return null;
    }
}
