package com.pets.Services;

import java.util.ArrayList;
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
	
	public List<Pet> getPetPage(Integer page, Integer size, List<String> filter) {
		int startIndex = (page - 1) * size;
		int lastIndex = startIndex + size;

		List<Pet> petList = (filter == null) ? repo.findAll() : getFilteredPets(filter);
		
		if((page - 1) * size > petList.size()) return null;
		
		return petList.subList(startIndex, (lastIndex > petList.size()) ? petList.size(): lastIndex);
	}
	
	public List<Pet> getPetPage(Integer page, List<String> filter) {
		return getPetPage(page, 6, filter);
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
	
	private List<Pet> getFilteredPets(List<String> filter) {
		int filterCount = 0;
		boolean isFilteredBySpecies = false;
		List<Long> filteredPetIdList = new ArrayList<Long>();
		
		for(String filterString : filter) {
			if(isSpecies(filterString)) {
				if(!isFilteredBySpecies) {
					filterCount++;
				}
				isFilteredBySpecies = true;
				
				filteredPetIdList.addAll(getIdListFromPetList(repo.findBySpecies(filterString)));
			}
			if(filterString.contains("lowAge")) {
				int lowAge = Integer.parseInt(filterString.substring(filterString.indexOf(":") + 1));
				filteredPetIdList.addAll(getIdListFromPetList(repo.findByAgeGreaterThan(lowAge)));
				filterCount++;
			}
			if(filterString.contains("highAge")) {
				int highAge = Integer.parseInt(filterString.substring(filterString.indexOf(":") + 1));
				filteredPetIdList.addAll(getIdListFromPetList(repo.findByAgeLessThan(highAge)));
				filterCount++;
			}
			if(filterString.contains("sex")) {
				String filterSex = filterString.substring(filterString.indexOf(":") + 1);
				filteredPetIdList.addAll(getIdListFromPetList(repo.findBySexIs(filterSex)));
				filterCount++;
			}
		}
		
		return combineFilteredLists(filteredPetIdList, filterCount);		
	}
	
	private List<Long> getIdListFromPetList(List<Pet> petList) {
		List<Long> idList = new ArrayList<Long>();
		for(Pet pet : petList) {
			idList.add(pet.getId());
		}
		
		return idList;
	}
	
	private List<Pet> combineFilteredLists(List<Long> idList, int filterCount) {
		Long currentId;
		int count = 0;
		List<Pet> petList = new ArrayList<Pet>();
		
		for(int i = 0; i < idList.size(); i++) {
			count = 0;
			currentId = idList.get(i);
			for(int j = i; j < idList.size(); j++) {
				if(idList.get(j) == currentId) {
					count++;
				}
				if(count == filterCount) {
					petList.add(findById(currentId));
					break;
				}
			}
		}
		
		return petList;
	}
	
	private boolean isSpecies(String filterString) {
		if(filterString.equals("Dog") ||
			filterString.equals("Cat") ||
			filterString.equals("Reptile") ||
			filterString.equals("Bird")) {
			return true;
		}
		return false;
	}
}
