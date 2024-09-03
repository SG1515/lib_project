package com.kcc.lib_project.domain.user.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.kcc.lib_project.domain.user.auth.CustomUserDetailService;
import com.kcc.lib_project.domain.user.dto.SignupDto;
import com.kcc.lib_project.domain.user.service.UserService;
import com.kcc.lib_project.domain.user.vo.UserVo;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

  @Autowired
  private UserService userService;

  @Autowired
  private CustomUserDetailService customUserDetailService;

  @GetMapping("/signup")
  public String signupForm() {
    return "user/signup";
  }

  @PostMapping("/signup")
  public String signup(@ModelAttribute @Valid SignupDto signupDto) {
    userService.saveUser(signupDto);
    return "redirect:/";
  }

  @GetMapping("/login")
  public String login() {
    return "user/login";
  }

  @PostMapping("/login")
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

    return "redirect:/";
  }

  @PostMapping("/logout")
  public String logout(HttpServletRequest request, HttpServletResponse response) {
    SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
    logoutHandler.logout(request, response, SecurityContextHolder.getContext().getAuthentication());
    return "redirect:/";
  }

}