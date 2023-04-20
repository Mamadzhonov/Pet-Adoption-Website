package com.pets.Contollers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pets.Models.Pet;
import com.pets.Services.PetService;

@Controller
@RequestMapping("/pet")
public class PetController {
	
	////	SERVICES	
	
	@Autowired
	PetService petService;
	
	@InitBinder
	public void dateBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-d");
		CustomDateEditor dateEditor = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}
	
	@GetMapping("") 
	public String petPage(Model model, HttpSession session) {
		
		model.addAttribute("petList", petService.getAll());
		return "test.jsp";//These are test jsps I created
	}
	
	@GetMapping("/add")
	public String addPet(Model model, HttpSession session) {
		
		model.addAttribute("newPet", new Pet());
		return "add-pet.jsp";
	}
	
	@PostMapping("/add") 
	public String savePet(@Valid @ModelAttribute("newPet") Pet newPet, BindingResult result) {		
		
		if(result.hasErrors()) return "/add-pet.jsp";
		
		petService.savePet(newPet);
		return "redirect:/pet";
	}
}
