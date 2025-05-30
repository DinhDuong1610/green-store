package com.fourstars.greenstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.fourstars.greenstore.repository.ProductRepository;

@Controller
public class LoginController {

    @Autowired
    ProductRepository productRepository;

    @GetMapping(value = "/login")
    public String login() {

        return "web/login";
    }

}
