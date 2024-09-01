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

	@GetMapping("/search")
	public String getBookList() {
		return "book/bookList";
	}

	@GetMapping("/search/{callNumber}")
	public String getBookDetail() {
		return "book/bookDetail";
	}
	
}
