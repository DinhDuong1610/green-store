package com.fourstars.greenstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fourstars.greenstore.entities.User;
import com.fourstars.greenstore.repository.UserRepository;

@Service
public class UserService {
    @Autowired
    UserRepository repo;

    public List<User> listAll() {
        return (List<User>) repo.findAll();
    }
}
