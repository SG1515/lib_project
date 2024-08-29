package com.kcc.lib_project.test_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/")
	public String testView() {
		return "/main";
	}
	
}
