package com.pets.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pets.Models.Pet;
import com.pets.Repositories.PetRepository;

@Service
public class PetService {
	
	@Autowired
	PetRepository repo;
	
	public List<Pet> getAll() {
		return repo.findAll();
	}
	
	public Pet findById(Long id) {
		Optional<Pet> pet = repo.findById(id);
		if(pet.isPresent()) {
			return pet.get();
		}
		return null;
	}
	
	public List<Pet> getPetPage(Integer page, Integer size) {
		int startIndex = (page - 1) * size;
		int lastIndex = startIndex + size;
		List<Pet> petList = repo.findAll();
		
		if((page - 1) * size > petList.size()) return null;
		
		return petList.subList(startIndex, (lastIndex > petList.size()) ? petList.size(): lastIndex);
	}
	
	public List<Pet> getPetPage(Integer page) {
		return getPetPage(page, 6);
	}
	
	public Pet savePet(Pet newPet) {
		return repo.save(newPet);
	}
	
	public Pet updatePet(Pet pet) {
		return repo.save(pet);
	}
	
	public void deletePet(Pet pet) {
		repo.delete(pet);
	}
	
	public void deleteById(Long id) {
		repo.deleteById(id);
	}
}
