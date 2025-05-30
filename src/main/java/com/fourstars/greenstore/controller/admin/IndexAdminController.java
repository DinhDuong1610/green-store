package com.fourstars.greenstore.controller.admin;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fourstars.greenstore.dto.UserExcelExporter;
import com.fourstars.greenstore.entities.User;
import com.fourstars.greenstore.repository.UserRepository;
import com.fourstars.greenstore.service.UserService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/admin")
public class IndexAdminController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;

    @ModelAttribute(value = "user")
    public User user(Model model, Principal principal, User user) {

        if (principal != null) {
            model.addAttribute("user", new User());
            user = userRepository.findByEmail(principal.getName());
            model.addAttribute("user", user);
        }

        return user;
    }

    @GetMapping(value = "/home")
    public String index(Model model, Principal principal) {

        User user = userRepository.findByEmail(principal.getName());
        model.addAttribute("user", user);

        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);

        return "/admin/users";
    }

    // to excel
    @GetMapping(value = "/export3")
    public void exportToExcel3(HttpServletResponse response) throws IOException {

        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";
        String headerValue = "attachement; filename=users.xlsx";

        response.setHeader(headerKey, headerValue);

        List<User> productList = userService.listAll();

        UserExcelExporter productExcelExporter = new UserExcelExporter(productList);
        productExcelExporter.export(response);

    }
}
