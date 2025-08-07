package com.fourstars.greenstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.fourstars.greenstore.commom.CommomDataService;
import com.fourstars.greenstore.dto.Mailsup;
import com.fourstars.greenstore.entities.User;

import jakarta.mail.MessagingException;

@Controller
public class ContactController extends CommomController {

    @Autowired
    CommomDataService commomDataService;

    @GetMapping(value = "/contact")
    public String contact(Model model, User user) {
        Mailsup mailsup = new Mailsup();
        model.addAttribute("mailsup", mailsup);
        commomDataService.commonData(model, user);
        return "web/contact";
    }

    @PostMapping(value = "/sendmail")
    public String sendemail(Model model, @ModelAttribute("mailsup") Mailsup mailsup) throws MessagingException {

        commomDataService.sendEmailSupport("jenny.180820@gmail.com", mailsup.getTitle(), mailsup);
        model.addAttribute("message", "Send Success");
        return "redirect:/contact";
    }
}
