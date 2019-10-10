package com.nowak.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/")
    public String showMainPage(){
        return "main-page";
    }

    @RequestMapping("/cpu")
    public String showCpus(){
        return "cpu-page";
    }
}
