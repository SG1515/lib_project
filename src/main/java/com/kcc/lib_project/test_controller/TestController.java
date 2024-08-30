package com.kcc.lib_project.test_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class TestController {

	@GetMapping("/admin")
	public String testView_admin() {
		return "/components/header_admin";
	}

	@GetMapping("/")
	public String getMethodName() {
		return "main";
	}
	
}
