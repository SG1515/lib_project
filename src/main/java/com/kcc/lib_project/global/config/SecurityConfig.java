package com.kcc.lib_project.global.config;

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
  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http
        .authorizeHttpRequests(authorizeHttpRequests -> authorizeHttpRequests.anyRequest().permitAll())
        .csrf(csrf -> csrf.disable());
    http
        .formLogin(form -> form
            .loginPage("/login")
            .loginProcessingUrl("/login")
            .usernameParameter("id")
            .passwordParameter("password")
            .defaultSuccessUrl("/", true));
    http
        .logout(logout -> logout
            .logoutUrl("/logout")
            .logoutSuccessUrl("/")
            .addLogoutHandler((request, response, authentication) -> {
              HttpSession session = request.getSession();
              session.invalidate();
            })
            // 로그아웃 성공 핸들러 추가 (리다이렉션 처리)
            .logoutSuccessHandler((request, response, authentication) -> response.sendRedirect("/"))
            // 로그아웃 시 쿠키 삭제 설정 (예: "remember-me" 쿠키 삭제)
            .deleteCookies("remember-me"));

    return http.build();
  }

}