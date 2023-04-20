package com.pets.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pets.Repositories.UserRepository;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepo; 
    
}
