package com.kcc.lib_project.test_controller;

import com.kcc.lib_project.domain.book.dto.BookTopTenDto;
import com.kcc.lib_project.domain.book.service.BookService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
@RequiredArgsConstructor
public class TestController {

	private final BookService bookService;

	@GetMapping("/admin")
	public String testView_admin() {
		return "/components/header_admin";
	}

	@GetMapping("/")
	public String getMethodName(Model model) {
		BookTopTenDto topTenBooks = bookService.getTopTenBooks();
		model.addAttribute("topTenBooks", topTenBooks);
		return "main";
	}

}
