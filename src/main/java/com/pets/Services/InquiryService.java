package com.pets.Services;

import java.util.List;
import java.util.Optional;

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
	
	public Inquiry save(Inquiry newInquiry) {
		return repo.save(newInquiry);
	}
	
	public Inquiry update(Inquiry inquiry) {
		return repo.save(inquiry);
	}
	
	public void deleteById(Long id) {
		repo.deleteById(id);
	}
	
	public Inquiry findById(Long id) {
		Optional<Inquiry> inquiry = repo.findById(id);
		if(inquiry.isPresent()) {
			return inquiry.get();
		}
		return null;	
	}
}
