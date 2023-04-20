package com.pets.Services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.pets.Models.LoginUser;
import com.pets.Models.User;
import com.pets.Repositories.UserRepository;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepo; 
    

    public User register(User newUser, BindingResult result) {
        if (!newUser.getConfirmPW().equals(newUser.getPassword())) {
            result.rejectValue("confirmPW", null, "Passwords do not match");
        }
        if (result.hasErrors()) {
            return null;
        }

        String hashPW = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashPW);
        return userRepo.save(newUser);
    }

    public User findById(Long id) {
        Optional<User> optUser = userRepo.findById(id);
        if (optUser.isPresent()) {
            return optUser.get();
        }
        return null;
    }

    public User login(LoginUser l, BindingResult result) {
        Optional<User> optUser = userRepo.findByEmail(l.getEmail());
        if (optUser.isEmpty() || !BCrypt.checkpw(l.getPassword(), optUser.get().getPassword())) {
            return null;
        }
        return optUser.get();
    }
    public Boolean findByEmail(String email) {
        List<User> opt = userRepo.findAllByEmail(email);
        if (opt.size() > 0) {
            return true;
        }
        return false;
    }
}
