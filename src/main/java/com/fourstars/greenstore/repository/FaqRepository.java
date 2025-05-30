package com.fourstars.greenstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fourstars.greenstore.entities.Faq;

@Repository
public interface FaqRepository extends JpaRepository<Faq, Long> {
}
