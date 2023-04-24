package com.pets.Contollers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pets.Models.Event;
import com.pets.Models.User;
import com.pets.Services.EventService;
import com.pets.Services.UserService;

@Controller
public class Events {
    @Autowired
    private UserService userServ;
    @Autowired
    private EventService eventServ;

    @GetMapping("/events")
    public String events(Model model, HttpSession session, RedirectAttributes redirect) {

        if (session.getAttribute("loggedUser") == null) {
            redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
//            needs to route back to reg/login page
            return "redirect:/";
        }

        Long id = (Long) session.getAttribute("loggedUser");
        User loggedUser = userServ.findById(id);
        model.addAttribute("loggedUser", loggedUser);
        model.addAttribute("allEvents", eventServ.allEvents());
        model.addAttribute("events", eventServ.all());
        return "Events.jsp";
    }

    @GetMapping("/event/new")
    public String event(Model model, HttpSession session, RedirectAttributes redirect) {
        if (session.getAttribute("loggedUser") == null) {
            redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
            return "redirect:/";
        }
        
        Long id = (Long) session.getAttribute("loggedUser");
        User loggedUser = userServ.findById(id);
        model.addAttribute("loggedUser", loggedUser);
        model.addAttribute("newEvent", new Event());
        return "NewEvent.jsp";
    }

    @PostMapping("/event/new")
    public String createEvent(@ModelAttribute("newEvent") Event eventNew, BindingResult result, Model model,
            HttpSession session,
            RedirectAttributes redirect) {

          if (result.hasErrors()) {
            return "NewEvent.jsp";
        }

        if (session.getAttribute("loggedUser") == null) {
            redirect.addFlashAttribute("login", "Need to login to edit this post");
            return "redirect:/";
        }

        Long id = (Long) session.getAttribute("loggedUser");
        User loggedUser = userServ.findById(id);
        model.addAttribute("loggedUser", loggedUser);

        eventNew.setPostedBy(loggedUser.getUserName());
        eventServ.create(eventNew);
        return "redirect:/events";
    }
    
//	VIEW EVENT PAGE
//   
    @GetMapping("/event/{eventId}/edit")
    public String editEvent(@PathVariable("eventId") Long eventId, Model model, HttpSession session, RedirectAttributes redirect) {
    	   if (session.getAttribute("loggedUser") == null) {
               redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
               return "redirect:/";
        }
    	   Long id = (Long) session.getAttribute("loggedUser");
       User loggedUser = userServ.findById(id);
        model.addAttribute("loggedUser", loggedUser);
    	   	Event event = eventServ.findById(eventId);
    	   	model.addAttribute("eventId", eventId);
    	   	model.addAttribute("eventName", eventServ.findById(eventId).getEventName());
        model.addAttribute("event", event);
    		return "EditEvent.jsp";
    }
    
    @PutMapping("/event/{eventId}/edit")
    public String updateEvent(@Valid @ModelAttribute("event") Event event, BindingResult result, Model model, HttpSession session, RedirectAttributes redirect, @PathVariable("eventId") Long eventId) {
    	if (result.hasErrors()) {
    		 Long id = (Long) session.getAttribute("loggedUser");
    	     User loggedUser = userServ.findById(id);
    	     model.addAttribute("loggedUser", loggedUser);
    	    	 model.addAttribute("eventId", eventId);
    	    	 model.addAttribute("eventName", eventServ.findById(eventId).getEventName());
    	    	 return "EditEvent.jsp";
    		}
    		event.setId(eventId);
    		eventServ.update(event);
    		return "redirect:/event/" + eventId;
    }
    
//	VIEW EVENT PAGE
    @GetMapping("/event/{id}")
    public String eventDetails(@PathVariable("id") Long id, HttpSession session, Model model,
            RedirectAttributes redirect) {

        if (session.getAttribute("loggedUser") == null) {
            redirect.addFlashAttribute("login", "Need to login to access this page");
            return "redirect:/";
        }

        Long userLoggedId = (Long) session.getAttribute("loggedUser");
        User loggedUser = userServ.findById(userLoggedId);
        model.addAttribute("loggedUser", loggedUser);

        model.addAttribute("eventById", eventServ.findById(id));
        return "viewEvent.jsp";
        // Not sure which return line is needed
        // return "redirect:/events";
    }
    
//	VIEW EVENT PAGE
    @GetMapping("/events/{id}")
    public String eventDetails(Model model, @PathVariable("id") Long eventId, HttpSession session, RedirectAttributes redirect) {
		if (session.getAttribute("loggedUser") == null) {
			redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
			return "redirect:/";
		}
		
		Long id = (Long) session.getAttribute("loggedUser");
		User loggedUser = userServ.findById(id);
		model.addAttribute("loggedUser", loggedUser);
		
		Event event = eventServ.findById(eventId);
		model.addAttribute("event", event);
		return "viewEvent.jsp"; 
    }
    

    @GetMapping("/event/edit/{id}")
    public String edit(@Valid @PathVariable("id") Long id, Model model, HttpSession session,
            RedirectAttributes redirect) {
        if (session.getAttribute("loggedUser") == null) {
            redirect.addFlashAttribute("login", "Need to login to edit this post");
            return "redirect:/";
        }
//        model.addAttribute("updatedForm", new Event());
        Long userLoggedId = (Long) session.getAttribute("loggedUser");
        User loggedUser = userServ.findById(userLoggedId);
        model.addAttribute("loggedUser", loggedUser);
        model.addAttribute("event", eventServ.findById(id));
     // NEED these model attributes for form to work
        model.addAttribute("eventId", id);
        model.addAttribute("eventName", eventServ.findById(id).getEventName());
        return "EditEvent.jsp";
    }

    @PostMapping("/event/edit/{id}")
    public String update(@Valid @ModelAttribute("updatedForm") Event updatedEvent,
            BindingResult result, @PathVariable("id") Long id, Model model, HttpSession session) {

        if (result.hasErrors()) {
        	Long userLoggedId = (Long) session.getAttribute("loggedUser");
            User loggedUser = userServ.findById(userLoggedId);
            model.addAttribute("loggedUser", loggedUser);
            // NEED these model attributes for form to work
            model.addAttribute("eventId", id);
            model.addAttribute("eventName", eventServ.findById(id).getEventName());
            return "EditEvent.jsp";
        }
        Long userLoggedId = (Long) session.getAttribute("loggedUser");
        User loggedUser = userServ.findById(userLoggedId);
//        setting event creator to current user
        updatedEvent.setPostedBy(loggedUser.getUserName());
        // setting event id to previous id
        updatedEvent.setId(id);
        // updating the event
        eventServ.update(updatedEvent);
        return "redirect:/events";
    }

    @GetMapping("/event/delete/{id}")
    public String getMethodName(@PathVariable("id") Long id) {
        eventServ.deleteById(id);
        return "redirect:/events";
    }

}
