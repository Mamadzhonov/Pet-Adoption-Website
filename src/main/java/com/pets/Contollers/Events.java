package com.pets.Contollers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
            return "redirect:/login";
        }

        Long id = (Long) session.getAttribute("loggedUser");
        User loggedUser = userServ.findById(id);
        model.addAttribute("loggedUser", loggedUser);

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
    public String createEvent(@Valid @ModelAttribute("newEvent") Event eventNew, BindingResult result, HttpSession session, Model model) {
        if (result.hasErrors()) {
        	 Long id = (Long) session.getAttribute("loggedUser");
             User loggedUser = userServ.findById(id);
             model.addAttribute("loggedUser", loggedUser);
            return "NewEvent.jsp";
        }

        
        eventServ.create(eventNew);
        
        return "redirect:/events";
    }

}
