package com.fourstars.greenstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fourstars.greenstore.entities.Menu;

@Repository
public interface MenuRepository extends JpaRepository<Menu, Long> {

}
