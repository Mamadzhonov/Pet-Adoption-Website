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
	
	public List<Message> getAllByInquiryId(Long inquiryId) {
		return repo.findByInquiryId(inquiryId);
	}
	
	public Message save(Message newMessage) {
		return repo.save(newMessage);
	}
	
	public void deleteById(Long id) {
		repo.deleteById(id);
	}
}
