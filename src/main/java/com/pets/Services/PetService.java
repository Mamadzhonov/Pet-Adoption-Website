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
	
	/*	This is the function called by the Pet Adoption Get Routing for retrieving the necessary page
	 * 	It uses the page number and size to determine the indices that reference the specific page from the list
	 * 	If there are filters applied, then it will use a filtered list (see getFilteredPets() below), otherwise it uses a list of all pets
	 * 	If the page that is requested is out of the bounds of the list, the function returns null
	 * 	It then returns a sublist of the source list
	 */
	public List<Pet> getPetPage(Integer page, Integer size, List<String> filter) {
		int startIndex = (page - 1) * size;
		int lastIndex = startIndex + size;

		List<Pet> petList = (filter == null) ? repo.findAll() : getFilteredPets(filter);
		
		if((page - 1) * size > petList.size()) return null;
		
		return petList.subList(startIndex, (lastIndex > petList.size()) ? petList.size(): lastIndex);
	}
	
	//Overloaded function that doesn't accept size input, so it defaults to 6
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
	
	
	/*	This is my headache
	 * 	JK...ish. This function returns a list of pets with the filters applied
	 * 	It loops through each filter and parses it to determine what kind of filter it is
	 * 	Then, for each filter, it adds all of the pet ids that pass that filter to a list of ids
	 * 	Then that list of ids is consolidated by the combineFilteredLists() function below
	 */
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
	
	//This function just takes a list of pets and returns a list of all of their ids
	//I couldn't figure out how to get the repo to return just the ids and not the entire row of data
	private List<Long> getIdListFromPetList(List<Pet> petList) {
		List<Long> idList = new ArrayList<Long>();
		for(Pet pet : petList) {
			idList.add(pet.getId());
		}
		
		return idList;
	}
	
	/*	This function takes a list of ids as well as a count of filters being applied and returns a consolidated list of pet ids
	 * 	It essentially works like this
	 * 		If for every filter you store every pet id that passes it, then the pets that pass all of the filters should have an id for every filter.
	 * 		-	4 filters = 4 ids. If there is less than 4 ids for a pet, then it doesn't pass. There should never be more
	 * 		-	2 filters = 2 ids.
	 * 		- 	4 filters and 2 pet ids means that pet only passed 2 filters and doesn't pass the entire filter
	 */
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
	
	//Idk what species we are going to have exactly
	//This can be easily adjusted to account for more or different species
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
