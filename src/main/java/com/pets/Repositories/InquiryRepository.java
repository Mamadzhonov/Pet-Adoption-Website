package com.pets.Repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pets.Models.Inquiry;

@Repository
public interface InquiryRepository extends CrudRepository<Inquiry, Long>{
	public List<Inquiry> findAll();
}
