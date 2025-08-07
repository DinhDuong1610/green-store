package com.fourstars.greenstore.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fourstars.greenstore.commom.CommomDataService;
import com.fourstars.greenstore.entities.Favorite;
import com.fourstars.greenstore.entities.Product;
import com.fourstars.greenstore.entities.User;
import com.fourstars.greenstore.repository.FavoriteRepository;
import com.fourstars.greenstore.repository.ProductRepository;

@Controller
public class ShopController extends CommomController {

    @Autowired
    ProductRepository productRepository;

    @Autowired
    FavoriteRepository favoriteRepository;

    @Autowired
    CommomDataService commomDataService;

    @GetMapping(value = "/products")
    public String shop(Model model,
            @RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "size", defaultValue = "12") int size) {

        User user = (User) model.getAttribute("user");
        PageRequest pageable = PageRequest.of(page - 1, size);

        Page<Product> productPage = productRepository.findAll(pageable);

        model.addAttribute("products", productPage);
        commomDataService.commonData(model, user);

        int totalPages = productPage.getTotalPages();
        if (totalPages > 0) {
            List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages).boxed().collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }

        return "web/shop";
    }

    public Page<Product> findPaginated(Pageable pageable) {

        List<Product> productPage = productRepository.findAll();

        int pageSize = pageable.getPageSize();
        int currentPage = pageable.getPageNumber();
        int startItem = currentPage * pageSize;
        List<Product> list;

        if (productPage.size() < startItem) {
            list = Collections.emptyList();
        } else {
            int toIndex = Math.min(startItem + pageSize, productPage.size());
            list = productPage.subList(startItem, toIndex);
        }

        Page<Product> productPages = new PageImpl<Product>(list, PageRequest.of(currentPage, pageSize),
                productPage.size());

        return productPages;
    }

    @GetMapping(value = "/searchProduct")
    public String showsearch(Model model, @RequestParam("keyword") String keyword,
            @RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "size", defaultValue = "12") int size) {

        User user = (User) model.getAttribute("user");
        PageRequest pageable = PageRequest.of(page - 1, size);

        List<Product> searchResult = productRepository.searchProduct(keyword);
        int start = (int) pageable.getOffset();
        int end = Math.min((start + pageable.getPageSize()), searchResult.size());
        Page<Product> productPage = new PageImpl<>(searchResult.subList(start, end), pageable, searchResult.size());

        model.addAttribute("products", productPage);
        commomDataService.commonData(model, user);

        int totalPages = productPage.getTotalPages();
        if (totalPages > 0) {
            List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages).boxed().collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }

        return "web/shop";
    }

    public Page<Product> findPaginatSearch(Pageable pageable, @RequestParam("keyword") String keyword) {

        List<Product> productPage = productRepository.searchProduct(keyword);

        int pageSize = pageable.getPageSize();
        int currentPage = pageable.getPageNumber();
        int startItem = currentPage * pageSize;
        List<Product> list;

        if (productPage.size() < startItem) {
            list = Collections.emptyList();
        } else {
            int toIndex = Math.min(startItem + pageSize, productPage.size());
            list = productPage.subList(startItem, toIndex);
        }

        Page<Product> productPages = new PageImpl<Product>(list, PageRequest.of(currentPage, pageSize),
                productPage.size());

        return productPages;
    }

    @GetMapping(value = "/productByCategory")
    public String listProductbyid(Model model, @RequestParam("id") Long id) {
        User user = (User) model.getAttribute("user");
        List<Product> products = productRepository.listProductByCategory(id);

        if (user != null) {
            products.forEach(p -> {
                Favorite save = favoriteRepository.selectSaves(p.getProductId(), user.getUserId());
                p.setFavorite(save != null);
            });
        }

        model.addAttribute("products", new PageImpl<>(products));
        commomDataService.commonData(model, user);
        return "web/shop";
    }

    @GetMapping(value = "/productByPrice")
    public String listProductbyprice(Model model, @Param("from") String from, @Param("to") String to) {
        User user = (User) model.getAttribute("user");
        List<Product> products = productRepository.searchPrice(Integer.parseInt(from), Integer.parseInt(to));

        if (user != null) {
            products.forEach(p -> {
                Favorite save = favoriteRepository.selectSaves(p.getProductId(), user.getUserId());
                p.setFavorite(save != null);
            });
        }

        model.addAttribute("products", new PageImpl<>(products));
        commomDataService.commonData(model, user);
        return "web/shop";
    }
}
