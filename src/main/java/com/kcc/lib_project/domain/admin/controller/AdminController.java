package com.kcc.lib_project.domain.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @GetMapping("/admin/login")
    public String adminLogin() {
        return "admin/login";
    }
}
