package com.fourstars.greenstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fourstars.greenstore.entities.Order;
import com.fourstars.greenstore.repository.OrderRepository;

@Service
public class OrderDetailService {

    @Autowired
    OrderRepository repo;

    public List<Order> listAll() {
        return (List<Order>) repo.findAll();
    }

}
