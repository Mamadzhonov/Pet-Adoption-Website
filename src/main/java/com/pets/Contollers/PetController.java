package com.pets.Contollers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
	public String petPage(Model model, HttpSession session, 
			@RequestParam(name="page") Integer page, 
			@RequestParam(name="size", required=false) Integer size, 
			@RequestParam(name="filter", required=false) List<String> filter) {
		
		if(size == null) {
			model.addAttribute("petList", petService.getPetPage(page, filter));
		} else {
			model.addAttribute("petList", petService.getPetPage(page, size, filter));
		}
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
		return "redirect:/pet?page=1";
	}
	
	@PostMapping("/filter")
	public String filterPets(@RequestParam Map<String, String> allParams, 
			@RequestParam(name="low-age", required=false) Integer lowAge,
			@RequestParam(name="high-age", required=false) Integer highAge,
			@RequestParam(name="sex", required=false) String sex) {
		
		String filter = "";
		for(String key : allParams.keySet()) {
			if(allParams.get(key).equals("on")) {
				filter = filter.concat("&filter="+key);
			}
		}
		if(lowAge != null) {
			filter = filter.concat("&filter=lowAge:" + lowAge);
		}
		if(highAge != null) {
			filter = filter.concat("&filter=highAge:" + highAge);
		}
		if(sex != null) {
			if(!sex.equals("None")) {
				filter = filter.concat("&filter=sex:" + sex);
			}
		}
		System.out.println("Filter: " + filter);
		return "redirect:/pet?page=1".concat(filter);
	}
}
