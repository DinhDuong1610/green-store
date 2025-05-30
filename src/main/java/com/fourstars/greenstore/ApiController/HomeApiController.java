package com.fourstars.greenstore.ApiController;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Optional;

import org.apache.poi.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fourstars.greenstore.entities.Product;
import com.fourstars.greenstore.entities.ResponseObject;
import com.fourstars.greenstore.repository.ProductRepository;

import jakarta.servlet.http.HttpServletResponse;

@RestController
@RequestMapping(path = "/app/api/products")
public class HomeApiController {
    @Autowired
    private ProductRepository productRepository;
    @Value("${upload.path}")
    private String pathUploadImage;

    @GetMapping("")
    List<Product> getAllProduct() {
        return productRepository.findAll();
    }

    @GetMapping(value = "/loadImage/{imageName}")
    @ResponseBody
    public byte[] index(@PathVariable String imageName, HttpServletResponse response)
            throws IOException {
        response.setContentType("image/jpeg");
        File file = new File(pathUploadImage + File.separatorChar + imageName);
        InputStream inputStream = null;
        if (file.exists()) {
            try {
                inputStream = new FileInputStream(file);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
            if (inputStream != null) {
                return IOUtils.toByteArray(inputStream);
            }
        }
        return IOUtils.toByteArray(inputStream);
    }

    // getDetailProduct
    @GetMapping("/{productId}")
    ResponseEntity<ResponseObject> ProductDetail(@PathVariable Long productId) {
        Optional<Product> foundProduct = productRepository.findById(productId);
        return foundProduct.isPresent() ? ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject("Ok", "Query product Success", foundProduct))
                : ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                        new ResponseObject("Ok", "Cannot find Product With id =" + productId, "foundProduct"));
    }

    // Top10 product Same Type
    @GetMapping("/listProductTop/{categoryId}")
    ResponseEntity<ResponseObject> listProductByCategory10(@PathVariable Long categoryId) {
        List<Product> foundProduct = productRepository.listProductByCategory10(categoryId);
        return foundProduct.size() > 0 ? ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject("Ok", "Query product Success", foundProduct))
                : ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                        new ResponseObject("Ok", "Cannot find Product With id =" + categoryId, "foundProduct"));
    }

    // Top10 product Same Type
    @GetMapping("/listproduct10")
    ResponseEntity<ResponseObject> listproduct10() {
        List<Product> foundProduct = productRepository.listProductNew20();
        return foundProduct.size() > 0 ? ResponseEntity.status(HttpStatus.OK).body(
                new ResponseObject("Ok", "Query product Success", foundProduct))
                : ResponseEntity.status(HttpStatus.NOT_FOUND).body(
                        new ResponseObject("Ok", "Query product Fails", "foundProduct"));
    }

}
