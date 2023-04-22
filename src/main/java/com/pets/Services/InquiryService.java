package com.pets.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pets.Models.Inquiry;
import com.pets.Repositories.InquiryRepository;

@Service
public class InquiryService {
	
	@Autowired
	InquiryRepository repo;
	
	public List<Inquiry> findAll() {
		return repo.findAll();
	}
}
