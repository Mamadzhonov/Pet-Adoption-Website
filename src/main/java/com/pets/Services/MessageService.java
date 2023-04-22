package com.pets.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pets.Models.Message;
import com.pets.Repositories.MessageRepository;

@Service
public class MessageService {

	@Autowired
	MessageRepository repo;
	
	public List<Message> findByInquiryId(Long inquiryId) {
		return repo.findByInquiryId(inquiryId);
	}
	
}
