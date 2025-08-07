package com.fourstars.greenstore.config;

import com.fourstars.greenstore.entities.Role;
import com.fourstars.greenstore.entities.User;
import com.fourstars.greenstore.repository.RoleRepository;
import com.fourstars.greenstore.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.Collections;
import java.util.Date;

@Component
public class DataSeeder implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {
        createRoleIfNotFound("ROLE_ADMIN");
        createRoleIfNotFound("ROLE_USER");

        if (userRepository.findByEmail("admin@gmail.com") == null) {
            User admin = new User();
            admin.setName("Admin");
            admin.setEmail("admin@gmail.com");
            admin.setPassword(passwordEncoder.encode("123456"));
            admin.setRegisterDate(new Date());
            admin.setStatus(true);
            admin.setAvatar("user.png");

            Role adminRole = roleRepository.findByName("ROLE_ADMIN").orElseThrow();
            admin.setRoles(Collections.singleton(adminRole));

            userRepository.save(admin);
        }
    }

    private void createRoleIfNotFound(String roleName) {
        if (roleRepository.findByName(roleName).isEmpty()) {
            roleRepository.save(new Role(roleName));
        }
    }
}