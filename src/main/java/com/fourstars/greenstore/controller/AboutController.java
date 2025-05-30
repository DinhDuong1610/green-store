package com.fourstars.greenstore.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.fourstars.greenstore.commom.CommomDataService;
import com.fourstars.greenstore.entities.Faq;
import com.fourstars.greenstore.entities.User;
import com.fourstars.greenstore.repository.FaqRepository;

@Controller
public class AboutController extends CommomController {

    @Autowired
    CommomDataService commomDataService;
    @Autowired
    FaqRepository faqRepository;

    @GetMapping(value = "/aboutUs")
    public String about(Model model, User user) {

        commomDataService.commonData(model, user);
        return "web/about";
    }
    // @GetMapping(value = "/faq")
    // public String faq(Model model, User user) {
    //
    // commomDataService.commonData(model, user);
    // return "web/faq";
    // }

    // show list product - table list
    @ModelAttribute("faqs")
    public List<Faq> showFaq(Model model) {
        List<Faq> faqs = faqRepository.findAll();
        model.addAttribute("faqs", faqs);

        return faqs;
    }

    @GetMapping(value = "/faq")
    public String faqs(Model model, Principal principal) {
        Faq faq = new Faq();
        model.addAttribute("faq", faq);

        return "web/faq";
    }

}
