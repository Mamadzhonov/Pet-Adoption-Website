package com.pets.Repositories;

import javax.persistence.Id;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pets.Models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long>{
    
}
