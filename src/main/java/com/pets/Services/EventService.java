package com.pets.Services;

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

}
