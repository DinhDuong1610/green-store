package com.fourstars.greenstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fourstars.greenstore.commom.CommomDataService;
import com.fourstars.greenstore.entities.Comment;
import com.fourstars.greenstore.entities.Product;
import com.fourstars.greenstore.entities.User;
import com.fourstars.greenstore.repository.CommentRepository;
import com.fourstars.greenstore.repository.ProductRepository;
import com.fourstars.greenstore.service.impl.ShoppingCartService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductDetailController extends CommomController {

    @Autowired
    HttpSession session;
    @Autowired
    ShoppingCartService shoppingCartService;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    CommentRepository commentRepository;

    @Autowired
    CommomDataService commomDataService;

    @GetMapping(value = "productDetail")
    public String productDetail(@RequestParam("id") Long id, Model model, User user,
            HttpServletRequest request, @RequestParam("id") int id1) {

        Product product = productRepository.findById(id).orElse(null);
        model.addAttribute("product", product);

        commomDataService.commonData(model, user);
        listProductByCategory10(model, product.getCategory().getCategoryId());
        if (user.getEmail() != null) {
            String userid = String.valueOf(user.getUserId());
            int user_id = Integer.parseInt(userid);

            Comment comment = commentRepository.SearchUser(user_id, id1).orElse(null);
            if (comment == null) {
                model.addAttribute("commentListcheck", 1);
            } else {
                model.addAttribute("commentListcheck", 0);
            }

        }
        List<Comment> commentList = commentRepository.selectAllSaves(id1);
        model.addAttribute("commentList", commentList);
        // session = request.getSession();
        // Collection<CartItem> cartItems = shoppingCartService.getCartItems();
        // if (product != null) {
        // CartItem item = new CartItem();
        // BeanUtils.copyProperties(product, item);
        // item.setQuantity(1);
        // item.setProduct(product);
        // item.setId(product.getProductId());
        // shoppingCartService.add(item);
        // }
        // session.setAttribute("history", cartItems);

        return "web/productDetail";
    }

    // Gợi ý top 10 sản phẩm cùng loại
    public void listProductByCategory10(Model model, Long categoryId) {
        List<Product> products = productRepository.listProductByCategory10(categoryId);
        model.addAttribute("productByCategory", products);
    }
}
