package com.pets.Repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pets.Models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    List<User> findAllByEmail(String email);

    Optional<User> findByEmail(String email);

}
