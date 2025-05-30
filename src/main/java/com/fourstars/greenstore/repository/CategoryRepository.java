package com.fourstars.greenstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fourstars.greenstore.entities.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

}
