package com.kcc.lib_project.global.config;

import com.kcc.lib_project.domain.user.auth.CustomUserDetailService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.http.HttpSession;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

  private static final String[] WHITE_LIST = {
      "/common/**",
      "WEB-INF/views/**",
      "/**",
      "/login"
  };

  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http, CustomUserDetailService customUserDetailService) throws Exception {
      http
              .authorizeHttpRequests(authorizeHttpRequests -> authorizeHttpRequests
                      .requestMatchers("/user/**").authenticated()  // 로그인한 사용자만 회원조회
                      .anyRequest().permitAll())  // 그 외의 모든 요청은 인증 없이 접근 가능
              .csrf(csrf -> csrf.disable())
              .formLogin(form -> form
                      .loginPage("/login")
                      .loginProcessingUrl("/login")
                      .usernameParameter("id")
                      .passwordParameter("password")
                      .successHandler((request, response, authentication) -> {
                          // 로그인 성공 후 리디렉션 처리
                          String redirectUrl = "/";
                          if (authentication.getAuthorities().stream()
                                  .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
                              redirectUrl = "/admin/main";  // ROLE_ADMIN일 경우 관리자 페이지로 리디렉션
                          }
                          response.sendRedirect(redirectUrl);
                      }))
              .logout(logout -> logout
                      .logoutUrl("/logout")
                      .logoutSuccessUrl("/")
                      .addLogoutHandler((request, response, authentication) -> {
                          HttpSession session = request.getSession();
                          session.invalidate();
                      })
                      .logoutSuccessHandler((request, response, authentication) -> response.sendRedirect("/"))
                      .deleteCookies("remember-me"))
              .rememberMe(remember -> remember
                      .userDetailsService(customUserDetailService)
                      .key("uniqueAndSecret")
                      .tokenValiditySeconds(60000));

      return http.build();
  }


}