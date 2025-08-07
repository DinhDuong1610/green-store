package com.fourstars.greenstore.controller.admin;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fourstars.greenstore.entities.Comment;
import com.fourstars.greenstore.entities.User;
import com.fourstars.greenstore.repository.CommentRepository;
import com.fourstars.greenstore.repository.MenuRepository;
import com.fourstars.greenstore.repository.UserRepository;

@Controller
@RequestMapping("/admin")
public class CmtController {
    @Autowired
    MenuRepository menuRepository;
    @Autowired
    CommentRepository commentRepository;

    @Autowired
    UserRepository userRepository;

    @ModelAttribute(value = "user")
    public User user(Model model, Principal principal, User user) {

        if (principal != null) {
            model.addAttribute("user", new User());
            user = userRepository.findByEmail(principal.getName());
            model.addAttribute("user", user);
        }

        return user;
    }

    @ModelAttribute("comments")
    public List<Comment> showCategory(Model model) {
        List<Comment> comments = commentRepository.findAll();
        model.addAttribute("comments", comments);
        return comments;
    }

    @GetMapping(value = "/comments")
    public String categories(Model model, Principal principal) {
        Comment comment = new Comment();
        model.addAttribute("comment", comment);

        return "admin/comment";
    }

    @GetMapping(value = "/detailComment/{id}")
    public String detailComment(@PathVariable("id") Long id, ModelMap model) {
        Comment comment = commentRepository.findById(id).orElse(null);

        model.addAttribute("comment", comment);

        return "admin/commentDetail";
    }

    @GetMapping("/deleteComment/{id}")
    public String delCategory(@PathVariable("id") Long id, Model model) {
        commentRepository.deleteById(id);

        model.addAttribute("message", "Delete successful!");

        return "redirect:/admin/comments";
    }
}
