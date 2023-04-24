package com.pets.Repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pets.Models.Pet;

@Repository
public interface PetRepository extends CrudRepository<Pet, Long>{
	public List<Pet> findAll();
	public List<Pet> findBySpecies(String species);
	public List<Pet> findByAgeGreaterThanEqual(Integer age);
	public List<Pet> findByAgeLessThanEqual(Integer age);
	public List<Pet> findBySexIs(String sex);
}
