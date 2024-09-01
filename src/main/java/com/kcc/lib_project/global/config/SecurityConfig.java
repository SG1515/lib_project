package com.kcc.lib_project.global.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig{

  private static final String[] WHITE_LIST = {
    "/common/**",
    "WEB-INF/views/**",
    "/**",
    "/login"
  };

  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http
      .authorizeHttpRequests(authorizeHttpRequests ->
        authorizeHttpRequests.anyRequest().permitAll())
        .csrf(csrf -> csrf.disable())
        .formLogin(form -> form
          .loginPage("/login")
          .loginProcessingUrl("/login")
          .usernameParameter("username")
          .passwordParameter("password")
          .defaultSuccessUrl("/"));

      
      return http.build();
  }

}