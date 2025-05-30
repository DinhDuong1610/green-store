package com.fourstars.greenstore.service.impl;

import java.io.IOException;

import org.springframework.stereotype.Service;

import com.fourstars.greenstore.dto.MailInfo;

import jakarta.mail.MessagingException;

@Service
public interface SendMailService {
    void run();

    void queue(String to, String subject, String body);

    void queue(MailInfo mail);

    void send(MailInfo mail) throws MessagingException, IOException;
}
