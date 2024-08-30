package com.kcc.lib_project.test_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/")
	public String testView() {
		return "/components/header_user";
	}
	

	
	@GetMapping("/admin")
	public String testView_admin() {
		return "/components/header_admin";
	}
}
