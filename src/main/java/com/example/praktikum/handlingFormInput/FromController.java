package com.example.praktikum.handlingFormInput;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class FromController {

    @Autowired
    FormService formService;

    @GetMapping("/form")
    public String greetingForm(Model model) {
        model.addAttribute("form", new Form(formService.getSize()));
        return "handlingFormInput/form";
    }

    @PostMapping("/form")
    public String formSubmit(@ModelAttribute Form form, Model model) {
        formService.addForm(form);
        model.addAttribute("forms", formService.getForms());
        return "handlingFormInput/forms";
    }

    @GetMapping("/forms")
    public String allForms(Model model) {
        model.addAttribute("forms", formService.getForms());
        return "handlingFormInput/forms";
    }

    @GetMapping("/delete_entry")
    public String handleDeleteEntry(@RequestParam(name="id") long id, Model model) {
        formService.deleteEntry(id);
        model.addAttribute("forms", formService.getForms());
        return "handlingFormInput/forms";
    }

    @GetMapping("/edit_entry")
    public String handleEditEntry(@RequestParam(name="id") long id, Model model) {
        model.addAttribute("form", formService.getForm(id));
        formService.deleteEntry(id);
        return "handlingFormInput/form";
    }
}