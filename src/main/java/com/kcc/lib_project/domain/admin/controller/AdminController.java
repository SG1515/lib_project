package com.kcc.lib_project.domain.admin.controller;


import com.kcc.lib_project.domain.user.auth.CustomUserDetailService;
import com.kcc.lib_project.domain.user.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminController {


    @Autowired
    private CustomUserDetailService customUserDetailService;

    @GetMapping("/admin/main")
    public String main(Model model) {
        return "admin/adminMain";
    }

    @GetMapping("/admin/login")
    public String adminLogin() {
        return "admin/login";
    }

    @PostMapping("/admin/login")
    public String loginPost(@RequestParam String id, @RequestParam String password, Model model,
                            HttpServletRequest request, RedirectAttributes ra) {
        UserDetails userDetails = customUserDetailService.loadUserByUsername(id);

        if (!customUserDetailService.validatePassword(password, userDetails.getPassword())) {
            model.addAttribute("error", "Invalid username or password");
            return "user/login";
        }

        HttpSession session = request.getSession();
        session.setAttribute("id", id);
        ra.addFlashAttribute("result", "login success");
        System.out.println("Session ID after setting: " + session.getId()); // 로그로 확인

        return "redirect:admin/adminMain";
    }

    @PostMapping("/admin/logout")
    public String logout(   HttpServletRequest request, HttpServletResponse response) {
        SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
        logoutHandler.logout(request, response, SecurityContextHolder.getContext().getAuthentication());
        return "redirect:admin/adminMain";
    }
}
