package com.fourstars.greenstore.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fourstars.greenstore.entities.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
    @Query(value = "SELECT * FROM Comments where product_id = ?;", nativeQuery = true)
    public List<Comment> selectAllSaves(int productId);

    @Query(value = "SELECT * FROM Comments where user_id = ?1 and product_id =?2", nativeQuery = true)
    public Optional<Comment> SearchUser(int user_id, int productId);
}
