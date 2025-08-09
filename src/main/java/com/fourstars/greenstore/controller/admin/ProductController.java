package com.fourstars.greenstore.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fourstars.greenstore.dto.ProductExcelExporter;
import com.fourstars.greenstore.entities.Category;
import com.fourstars.greenstore.entities.Product;
import com.fourstars.greenstore.entities.User;
import com.fourstars.greenstore.repository.CategoryRepository;
import com.fourstars.greenstore.repository.OrderDetailRepository;
import com.fourstars.greenstore.repository.ProductRepository;
import com.fourstars.greenstore.repository.UserRepository;
import com.fourstars.greenstore.service.ProductDetailService;
import com.fourstars.greenstore.service.impl.QrCodeGeneratorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/admin")
public class ProductController {

    @Value("${upload.path}")
    private String pathUploadImage;
    @Autowired
    ProductDetailService productDetailService;
    @Autowired
    private QrCodeGeneratorService qrCodeGeneratorService;

    @Autowired
    ProductRepository productRepository;
    @Autowired
    OrderDetailRepository orderDetailRepository;
    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    UserRepository userRepository;

    @ModelAttribute(value = "user")
    public User user(Model model, Principal principal, User user) {

        if (principal != null) {
            model.addAttribute("user", new User());
            user = userRepository.findByEmail(principal.getName());
            model.addAttribute("user", user);
        }

        return user;
    }

    public ProductController(CategoryRepository categoryRepository,
            ProductRepository productRepository) {
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository;
    }

    @ModelAttribute("products")
    public List<Product> showProduct(Model model) {
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);

        return products;
    }

    @GetMapping(value = "/products")
    public String products(Model model, Principal principal) {
        Product product = new Product();
        model.addAttribute("product", product);
        return "admin/products";
    }

    // @PostMapping(value = "/addProduct")
    // public String addProduct(@ModelAttribute("product") Product product, ModelMap
    // model,
    // @RequestParam("file") MultipartFile file, HttpServletRequest
    // httpServletRequest) {

    // if (productRepository.ProductName(product.getProductName()).isEmpty()) {
    // try {
    // File convFile = new File(pathUploadImage + "/" + file.getOriginalFilename());
    // FileOutputStream fos = new FileOutputStream(convFile);
    // fos.write(file.getBytes());
    // fos.close();
    // } catch (IOException e) {
    // }

    // product.setProductImage(file.getOriginalFilename());

    // product.setEnteredDate(new Date());
    // Product p = productRepository.save(product);
    // p.setQrCode(p.getProductId() + ".png");
    // productRepository.save(p);
    // if (null != p) {
    // String filePath = pathUploadImage + "/" + p.getProductId() + ".png";
    // String qrCodeContent = "http://localhost:8077/product/{id}";
    // int width = 400;
    // int height = 400;
    // qrCodeGeneratorService.generateQRCode(qrCodeContent, filePath, width,
    // height);

    // model.addAttribute("message", "Add success");
    // model.addAttribute("product", product);
    // return "redirect:/admin/products";

    // } else {
    // model.addAttribute("error", "Add failure");
    // model.addAttribute("product", product);
    // return "redirect:/admin/products";
    // }
    // } else {
    // model.addAttribute("error", "Product already exists ");
    // model.addAttribute("product", product);
    // return "admin/products";
    // }

    // }

    @PostMapping(value = "/addProduct")
    public String addProduct(@ModelAttribute("product") Product product, ModelMap model,
            @RequestParam("file") MultipartFile file) { // Bỏ HttpServletRequest nếu không dùng

        if (file.isEmpty()) {
            model.addAttribute("error", "Vui lòng chọn một file ảnh!");
            model.addAttribute("categoryList", categoryRepository.findAll());
            return "admin/products";
        }

        try {
            Path uploadDir = Paths.get(this.pathUploadImage);

            if (!Files.exists(uploadDir)) {
                Files.createDirectories(uploadDir);
            }

            String originalFilename = StringUtils.cleanPath(file.getOriginalFilename());

            String uniqueFilename = System.currentTimeMillis() + "_" + originalFilename;

            Path destinationFile = uploadDir.resolve(uniqueFilename);

            Files.copy(file.getInputStream(), destinationFile, StandardCopyOption.REPLACE_EXISTING);

            product.setProductImage(uniqueFilename);

            String qrCodeName = System.currentTimeMillis() + "_QR.png";
            Path qrCodePath = uploadDir.resolve(qrCodeName);
            qrCodeGeneratorService.generateQRCode("http://localhost:8077/product/{id}", qrCodePath.toString(), 250,
                    250);
            product.setQrCode(qrCodeName);

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Lỗi upload file: " + e.getMessage());
            model.addAttribute("categoryList", categoryRepository.findAll());
            return "admin/products";
        }

        product.setEnteredDate(new Date());
        productRepository.save(product);
        model.addAttribute("message", "Thêm sản phẩm thành công");

        return "redirect:/admin/products";
    }

    @ModelAttribute("categoryList")
    public List<Category> showCategory(Model model) {
        List<Category> categoryList = categoryRepository.findAll();
        model.addAttribute("categoryList", categoryList);

        return categoryList;
    }

    @GetMapping(value = "/editProduct/{id}")
    public String editCategory(@PathVariable("id") Long id, ModelMap model) {
        Product product = productRepository.findById(id).orElse(null);

        model.addAttribute("product", product);

        return "admin/editProduct";
    }

    @PostMapping(value = "/editProduct")
    public String editProduct(@ModelAttribute("product") Product p, ModelMap model,
            @RequestParam("file") MultipartFile file, HttpServletRequest httpServletRequest) throws IOException {
        Product product = productRepository.findById(p.getProductId()).orElse(null);
        if (file.isEmpty()) {
            p.setProductImage(product.getProductImage());
        } else {
            try {
                File convFile = new File(pathUploadImage + "/" + file.getOriginalFilename());
                FileOutputStream fos = new FileOutputStream(convFile);
                fos.write(file.getBytes());
                fos.close();
            } catch (IOException e) {
            }
            p.setProductImage(file.getOriginalFilename());
        }
        p.setQrCode(product.getProductId() + ".png");
        p.setStatus(0);
        productRepository.save(p);
        if (null != p) {
            try {
                Path myPathqr = Paths.get(
                        pathUploadImage + "/" + productRepository.findById(product.getProductId()).get().getQrCode());
                Files.deleteIfExists(myPathqr);
            } catch (Exception e) {

            }
            String filePath = pathUploadImage + "/" + p.getProductId() + ".png";
            String qrCodeContent = "http://localhost:8077/product/{id}";
            int width = 400;
            int height = 400;
            qrCodeGeneratorService.generateQRCode(qrCodeContent, filePath, width, height);
            model.addAttribute("message", "Update success");
            model.addAttribute("product", p);
        } else {
            model.addAttribute("message", "Update failure");
            model.addAttribute("product", p);
        }
        return "redirect:/admin/products";
    }

    @GetMapping("/deleteProduct/{id}")
    public String delProduct(@PathVariable("id") Long id, Model model) throws IOException {
        try {
            Path myPath = Paths.get(pathUploadImage + "/" + productRepository.findById(id).get().getProductImage());
            Files.deleteIfExists(myPath);

        } catch (IOException e) {
        }
        productRepository.deleteById(id);
        model.addAttribute("message", "Delete successful!");

        return "redirect:/admin/products";
    }

    @GetMapping(value = "/export1")
    public void exportToExcel(HttpServletResponse response) throws IOException {

        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";
        String headerValue = "attachement; filename=products.xlsx";

        response.setHeader(headerKey, headerValue);

        List<Product> lisProducts = productDetailService.listAll();

        ProductExcelExporter excelExporter = new ProductExcelExporter(lisProducts);
        excelExporter.export(response);

    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
}
