package com.pets.Repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pets.Models.Event;


@Repository
public interface EventRepository extends CrudRepository<Event, Long >{

}