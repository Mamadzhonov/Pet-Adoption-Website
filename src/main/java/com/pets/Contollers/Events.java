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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.PathVariable;

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
            return "redirect:/login";
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
    public String createEvent(@ModelAttribute("newEvent") Event eventNew, BindingResult result, HttpSession session,
            RedirectAttributes redirect, Model model) {
        if (result.hasErrors()) {
        	 Long id = (Long) session.getAttribute("loggedUser");
             User loggedUser = userServ.findById(id);
             model.addAttribute("loggedUser", loggedUser);
            return "NewEvent.jsp";
        }

        if (session.getAttribute("userId") == null) {
            redirect.addFlashAttribute("login", "Need to login to edit this post");
            return "redirect:/";
        }

        eventServ.create(eventNew);
        return "redirect:/events";
    }

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
        return "EventDetail.jsp";
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
			// ^^^ Add Event Details jsp when available
    }

}
