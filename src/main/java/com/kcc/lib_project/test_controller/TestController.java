package com.kcc.lib_project.test_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


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

	@GetMapping("/bookList")
	public String getBookList() {
		return "book/bookList";
	}
	
}
