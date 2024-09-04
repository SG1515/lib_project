package com.kcc.lib_project;


import com.kcc.lib_project.domain.book.dto.BookTopTenDto;
import com.kcc.lib_project.domain.book.service.OwnBookService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
@RequiredArgsConstructor
public class MainController {


	private final OwnBookService ownBookService;
//
//	@GetMapping("/admin")
//	public String testView_admin() {
//		return "/components/header_admin";
//	}

	@GetMapping("/")
	public String getMethodName(Model model) {
		BookTopTenDto topTenBooks = ownBookService.getTopTenOwnBooks();
		model.addAttribute("topTenBooks", topTenBooks);
		return "main";
	}

}
