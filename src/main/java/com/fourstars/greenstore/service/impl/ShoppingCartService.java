package com.fourstars.greenstore.service.impl;

import java.util.Collection;

import org.springframework.stereotype.Service;

import com.fourstars.greenstore.entities.CartItem;
import com.fourstars.greenstore.entities.Product;

@Service
public interface ShoppingCartService {

    int getCount();

    double getAmount();

    void clear();

    Collection<CartItem> getCartItems();

    void remove(CartItem item);

    void add(CartItem item);

    void remove(Product product);

}
