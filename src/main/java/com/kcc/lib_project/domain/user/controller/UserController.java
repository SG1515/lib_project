package com.kcc.lib_project.domain.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.userdetails.UserDetails;
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
  public String postMethodName(@RequestParam String id, @RequestParam String password, Model model) {
    UserDetails userDetails = customUserDetailService.loadUserByUsername(id);

    if (!customUserDetailService.validatePassword(password, userDetails.getPassword())) {
      model.addAttribute("error", "Invalid username or password");
      return "/login";
    }

    return "redirect:/";
  }

}