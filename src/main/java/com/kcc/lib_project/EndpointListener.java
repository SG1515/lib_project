package com.kcc.lib_project;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Component
@Log4j
public class EndpointListener implements CommandLineRunner {

  @Autowired
  private RequestMappingHandlerMapping handlerMapping;

  @Override
  public void run(String... args) throws Exception {
    Map<RequestMappingInfo, HandlerMethod> map = handlerMapping.getHandlerMethods();
    map.forEach((key, value) -> System.err.println(key + " 야호 " + value));
  }
}