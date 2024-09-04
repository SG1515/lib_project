package com.kcc.lib_project.domain.admin.controller;


import com.kcc.lib_project.domain.admin.service.AdminService;
import com.kcc.lib_project.domain.user.auth.CustomUserDetailService;
import com.kcc.lib_project.domain.user.auth.UserDetail;
import com.kcc.lib_project.domain.user.dto.UserDto;
import com.kcc.lib_project.domain.user.repository.UserRepositoryImpl;
import com.kcc.lib_project.domain.user.service.UserService;
import com.kcc.lib_project.domain.user.vo.UserVo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepositoryImpl userRepositoryImpl;

    @Autowired
    private AdminService adminService;

    @GetMapping("/admin/main")
    public String adminMain(Model model, @AuthenticationPrincipal UserDetail userDetail) {
        if (userDetail == null) {
            // 로그인 페이지로 리다이렉트
            return "redirect:/admin/login";
        }
        System.out.println(userDetail.getUsername());
        return "admin/adminMain";
    }


    @GetMapping("/admin/login")
    public String adminLogin() {
        return "admin/login";
    }

//    @PostMapping("/admin/login")
//    public String loginPost(@RequestParam String id, @RequestParam String password, Model model,
//                            HttpServletRequest request, RedirectAttributes ra) {
//        UserDetails userDetails = customUserDetailService.loadUserByUsername(id);
//
//        // 로그인 유저의 admin 여부 검사 로직
//        Collection<? extends GrantedAuthority> authorities = userDetails.getAuthorities();
//        boolean isAdmin = authorities.stream()
//                .anyMatch(auth -> auth.getAuthority().equals("ROLE_ADMIN"));
//
//        System.out.println("현재 페이지에 로그인한 사용자의 권한은 " + ((UserDetail)userDetails).getRole());
//
//        if (!isAdmin) {
//            model.addAttribute("error", "admin page only login admin");
//            return "admin/login";
//        }
//
//        // 패스워드 검사 로직
//        if (!customUserDetailService.validatePassword(password, userDetails.getPassword())) {
//            model.addAttribute("error", "Invalid username or password");
//            return "admin/login";
//        }
//
//        // Authentication 객체 생성 및 SecurityContext에 설정
//        Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
//        SecurityContextHolder.getContext().setAuthentication(authentication);
//
//        return "redirect:admin/adminMain";
//    }



    @PostMapping("/admin/logout")
    public String logout(   HttpServletRequest request, HttpServletResponse response) {
        SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
        logoutHandler.logout(request, response, SecurityContextHolder.getContext().getAuthentication());
        return "redirect:/";
    }

    @GetMapping("/admin/profile")
    public String adminInfo(Model model, @AuthenticationPrincipal UserDetails userDetails) {
        String username = userDetails.getUsername();
        String password = userDetails.getPassword();

        Optional<UserVo> userDetail = userRepositoryImpl.getUserVoById(username);
        UserVo userVo = userDetail.get();
        String email = "";
        String birth = "";
        String name ="";
        String address = "";
        int phone =0;

        if (userDetail.isPresent()) {
            email = userVo.getEmail();
            birth = userVo.getBirth();
            name = userVo.getName();
            address = userVo.getAddress();
            phone = userVo.getPhone();
        } else {
            throw new UsernameNotFoundException("Username not found");
        }
//    System.out.println("email은  : " + email );

        model.addAttribute("username", username);
        model.addAttribute("password", password);
        model.addAttribute("email", email);
        model.addAttribute("birth", birth);
        model.addAttribute("name", name);
        model.addAttribute("address", address);
        model.addAttribute("phone", phone);

        return "admin/profile";
    }

    @PostMapping("/admin/profile/update")
    public String updateAdminInfo(@ModelAttribute @Valid UserDto userDto, @AuthenticationPrincipal UserDetails userDetails) {

        String username = userDetails.getUsername();
        userDto.setId(username);
        System.out.println(userDto.toString());

        userService.updateUser(userDto);

        return "redirect:/";
    }

    @GetMapping("/admin/books/loan")
    public String loanBook() {
        return "admin/loan";
    }

    @GetMapping("/getMemberInfo")
    @ResponseBody
    public Map<String, Object> getUserInfo(@RequestParam("id") String id){
        Map<String, Object> responseUser = new HashMap<>();
        UserDto user = adminService.getUser(id);

        if(user != null){
            responseUser.put("name", user.getName());
            responseUser.put("email", user.getEmail());
            responseUser.put("address", user.getAddress());
        } else {
            System.out.println("User not found for id: " + id);
            responseUser.put("error", "User not found");
        }

        System.out.println("유저의 이름은 :" + responseUser.get("name"));

        return responseUser;
    }
}
