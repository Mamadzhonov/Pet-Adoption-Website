package com.pets.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pets.Models.Event;
import com.pets.Repositories.EventRepository;


@Service
public class EventService {
   @Autowired
   private  EventRepository eventRepo;
    
    public List<Event> all() {
    	return eventRepo.findAll();
    }
    
    public Event findById(Long id) {
    	Optional<Event> event = eventRepo.findById(id);
    	if(event.isPresent()) {
    		return event.get();
    	}
    	return null;
    }

    public Event create(Event event){
        return eventRepo.save(event);
    }

}
