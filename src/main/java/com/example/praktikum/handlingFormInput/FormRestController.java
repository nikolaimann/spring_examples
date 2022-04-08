package com.example.praktikum.handlingFormInput;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
public class FormRestController {

    @Autowired
    FormService formService;

    @ResponseBody
    @GetMapping(value = "/form_rest", produces=              {
            MediaType.APPLICATION_XML_VALUE,
            MediaType.APPLICATION_JSON_VALUE
    })
    public List<Form> index() {
        return formService.getForms();
    }

}
