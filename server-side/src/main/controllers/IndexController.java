package com.sbmp.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/hostParty")
public class IndexController {

    @RequestMapping("/Home")
    public String getIndexPage() {
        return "Home";
    }
    
    
}
