package com.fourstars.greenstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fourstars.greenstore.entities.Product;
import com.fourstars.greenstore.repository.ProductRepository;

@Service
public class ProductDetailService {
    @Autowired
    ProductRepository repo;

    public List<Product> listAll() {
        return (List<Product>) repo.findAll();
    }

}
