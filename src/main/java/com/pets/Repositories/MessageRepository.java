package com.pets.Repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pets.Models.Message;

@Repository
public interface MessageRepository extends CrudRepository<Message, Long>{
	public List<Message> findByInquiryId(Long inquiryId);
}
