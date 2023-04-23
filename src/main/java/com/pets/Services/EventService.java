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

    public Event create(Event event){
        return eventRepo.save(event);
    }

    public List<Event> allEvents() {
        return eventRepo.findAll();
    }

    public Event findById(Long id) {
        Optional<Event> optEvent = eventRepo.findById(id);
        if (optEvent.isPresent()) {
            return optEvent.get();
        }
        return null;
    }

    public void deleteById(Long id){
        eventRepo.deleteById(id);
    }
    
    public Event update(Event event) {
    	return eventRepo.save(event);
    }

}
