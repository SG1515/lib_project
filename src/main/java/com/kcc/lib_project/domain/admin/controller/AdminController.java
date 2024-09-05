package com.kcc.lib_project.domain.admin.controller;


import com.kcc.lib_project.domain.admin.dto.LoanDto;
import com.kcc.lib_project.domain.admin.dto.OwnBookDto;
import com.kcc.lib_project.domain.admin.service.AdminService;
import com.kcc.lib_project.domain.user.auth.CustomUserDetailService;
import com.kcc.lib_project.domain.user.auth.UserDetail;
import com.kcc.lib_project.domain.user.dto.UserDto;
import com.kcc.lib_project.domain.user.repository.UserRepositoryImpl;
import com.kcc.lib_project.domain.user.service.UserService;
import com.kcc.lib_project.domain.user.vo.UserVo;
import com.kcc.lib_project.global.exception.type.BookNotFoundException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

import java.time.LocalDate;
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
    public ResponseEntity<Map<String, Object>> getUserInfo(@RequestParam("id") String id) {
        Map<String, Object> responseUser = new HashMap<>();
        UserDto user = adminService.getUser(id);

        if (user != null) {
            responseUser.put("name", user.getName());
            responseUser.put("email", user.getEmail());
            responseUser.put("address", user.getAddress());
            return ResponseEntity.ok(responseUser);
        } else {
            responseUser.put("error", "User not found");
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(responseUser);
        }
    }

    @GetMapping("/getBookInfo")
    @ResponseBody
    public Map<String, Object> getBookInfo(@RequestParam("callNumber") String callNumber) throws BookNotFoundException {
        Map<String, Object> responseBook = new HashMap<>();
        OwnBookDto bookInfo = adminService.getOwnBook(callNumber);

        // 예약 중인 상태가 1이므로 0이 true | 자료상태 AVAILABLE이 사용가능
        if(!bookInfo.getIsReserved() && bookInfo.getStatus().equals("AVAILABLE")){
            responseBook.put("status", true);
            responseBook.put("title", bookInfo.getTitle());
            responseBook.put("publisher", bookInfo.getPublisher());
            responseBook.put("publicationYear", bookInfo.getPublicationYear());
        } else {
            responseBook.put("status", false);
        }

        if(bookInfo.getStatus().equals("UNAVAILABLE")){
            responseBook.put("return", true);
        }

        return responseBook;
    }

    @PostMapping("/rentBook")
    @ResponseBody
    public Map<String, Object> rentBook(@RequestParam("id") String id, @RequestParam("callNumber") String callNumber){
        Map<String, Object> response = new HashMap<>();
        LocalDate now = LocalDate.now();
        LocalDate afterSevenDays = now.plusDays(7);  // 7일 추가
        UserVo user = userRepositoryImpl.getUserVoById(id).get();

        LoanDto loanDto = LoanDto.builder()
                .userId(user.getUserId())
                .callNumber(callNumber)
                .startedAt(now)
                .endedAt(afterSevenDays)
                .isReturned(0)
                .extentionCount(0)
                .build();


        //대여 insert
        Boolean success = adminService.rentBook(loanDto);

        //소유도서 status update
        adminService.changeStatus(callNumber);
        if (success) {
            response.put("message", "대여 신청이 완료되었습니다.");
            response.put("redirectUrl", "/admin/main"); // 리다이렉트할 URL
        } else {
            response.put("error", "대여 신청에 실패했습니다.");
        }


        return response;
    }


    @PostMapping("/returnBook")
    @ResponseBody
    public Map<String, Object> returnBook(@RequestParam("callNumber") String callNumber){
        Map<String, Object> response = new HashMap<>();
        LocalDate now = LocalDate.now();


        LoanDto loanDto = LoanDto.builder()
                .callNumber(callNumber)
                .endedAt(now)
                .isReturned(0)
                .build();

        boolean success = adminService.returnBook(loanDto);

        if (success) {
            response.put("message", "반납 신청이 완료되었습니다.");
        } else {
            response.put("error", "반납 신청에 실패했습니다.");
        }
        

        return response;
    }



}
