package com.fourstars.greenstore.controller.admin;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fourstars.greenstore.entities.User;
import com.fourstars.greenstore.repository.UserRepository;

@Controller
public class UserController {

    @Autowired
    UserRepository userRepository;

    @GetMapping(value = "/admin/users")
    public String customer(Model model, Principal principal) {

        User user = userRepository.findByEmail(principal.getName());
        model.addAttribute("user", user);

        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);

        return "/admin/users";
    }
}
