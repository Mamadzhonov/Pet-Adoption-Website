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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pets.Models.Inquiry;
import com.pets.Models.Pet;
import com.pets.Models.User;
import com.pets.Services.InquiryService;
import com.pets.Services.PetService;
import com.pets.Services.UserService;


@Controller
@RequestMapping("/pet")
public class PetController {
	
	////	SERVICES	
	@Autowired
	private UserService userServ;
	@Autowired
	PetService petService;
	@Autowired
	InquiryService inquiryServ;
		
	
	//This allows the "Date of Arrival" attribute to be bound to the Pet object
	//Otherwise Spring JPA doesn't know how to convert it to a Java Date object
	//I definitely did not figure this out I found it on StackOverflow
	//https://stackoverflow.com/questions/43786382/submit-input-type-date-in-spring-mvc-application
	@InitBinder
	public void dateBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-d");
		CustomDateEditor dateEditor = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}
	
	/*	This is the Pet Adoption Page "Get" Route
	*	It receives URL parameters and adds a list of pets, and the loggedUser to the model
	*			---URL Parameters---
	*		-Page-
	*	This parameter is used so the service knows which page to return in regards to pagination
	*	There is protection against choosing a page higher than what's available, but it simply returns a null list
	*	URL: http://localhost:8080/pet?page=1		--Returns the 1st page with a default of 6 pets
	*
	*		-Size-
	*	This parameter is optional, so it can be omitted in the URL
	*	If used it will determine how many pets show up on each page
	*	If omitted it defaults to a size of 6
	*	URL: http://localhost:8080/pet?page=1&size=4     --Return the 1st page with 4 pets
	*
	*		-Filter-
	*	This parameter is also optional, and when omitted returns all of the pets in the db
	*	These parameters are added when the "filter form" is submitted from this page (see @PostMapping('/filter') below)
	*	URL: http://localhost:8080/pet?page=2&filter=Dog&filter=lowAge:3&filter=highAge:8&filter=sex:Male	--Returns the 2nd page of male dogs that are between the ages of 3 and 8	
	*/
	@GetMapping("") 
	public String petPage(Model model, HttpSession session, RedirectAttributes redirect,
			@RequestParam(name="page") Integer page, 
			@RequestParam(name="size", required=false) Integer size, 
			@RequestParam(name="filter", required=false) List<String> filter) {
		
		if(session.getAttribute("loggedUser") == null) {
			redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
			return "redirect:/";
		}
		
		User loggedUser = userServ.findById((Long) session.getAttribute("loggedUser"));
		String filterURL = "";
		
		model.addAttribute("loggedUser", loggedUser);
		
		model.addAttribute("currentPage", page);
		model.addAttribute("lastPage", petService.getNumLastPage(filter));
		
		model.addAttribute("filterList", filter);
		
		if(filter != null) {
			for(String filterString : filter) {
				filterURL += "&filter=" + filterString;
				if(filterString.contains("lowAge")) {
					int lowAge = Integer.parseInt(filterString.substring(filterString.indexOf(":") + 1));
					model.addAttribute("lowAge", lowAge);
				}
				if(filterString.contains("highAge")) {
					int highAge = Integer.parseInt(filterString.substring(filterString.indexOf(":") + 1));
					model.addAttribute("highAge", highAge);
				}
				if(filterString.contains("sex")) {
					String filterSex = filterString.substring(filterString.indexOf(":") + 1);
					model.addAttribute("sexFilter", filterSex);
				}
			}
		}
		
		model.addAttribute("filterURL", filterURL);
		
		List<Pet> petPage;
		
		petPage = petService.getPetPage(page, filter);
		
		model.addAttribute("petList", petPage);
		
		return "availablePets.jsp";//Replace this with the availablePets.jsp when it's added
	}
	
	
	// CREATE NEW PET FORM
	@GetMapping("/add")
	public String addPet(Model model, HttpSession session, RedirectAttributes redirect) {
		if (session.getAttribute("loggedUser") == null) {
			redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
			return "redirect:/";
		}

		Long id = (Long) session.getAttribute("loggedUser");
		User loggedUser = userServ.findById(id);
		model.addAttribute("loggedUser", loggedUser);
		model.addAttribute("newPet", new Pet());
		return "addPet.jsp";
	}
	
	@PostMapping("/add") 
	public String savePet(@Valid @ModelAttribute("newPet") Pet newPet, BindingResult result, HttpSession session, RedirectAttributes redirect, Model model) {		
		if(result.hasErrors()) {
			Long id = (Long) session.getAttribute("loggedUser");
			User loggedUser = userServ.findById(id);
			model.addAttribute("loggedUser", loggedUser);
			return "addPet.jsp";
		} 
		// we need to set the pet.user = session.userId
		Long id = (Long) session.getAttribute("loggedUser");
		User loggedUser = userServ.findById(id);
		model.addAttribute("loggedUser", loggedUser);
		newPet.setUser(loggedUser);
		petService.savePet(newPet);
//		return "redirect:/pet?page=1";
		return "redirect:/home";
	}
	
	// EDIT PET FORM
	// eventually going to add the pet.id in the route
	@GetMapping("/edit/{petId}")
	public String editPet(@PathVariable("petId") Long petId, Model model, HttpSession session, RedirectAttributes redirect){
		if (session.getAttribute("loggedUser") == null) {
			redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
			return "redirect:/";
		}

		Long id = (Long) session.getAttribute("loggedUser");
		User loggedUser = userServ.findById(id);
		model.addAttribute("loggedUser", loggedUser);
//		temp model attribute
		Pet pet = petService.findById(petId);
		model.addAttribute("pet", pet);
		model.addAttribute("petId", petId);
		// will un comment this once I add in the form
//		model.addAttribute("pet", petService.findById(id));
		return "editPet.jsp";
	}
	
	@PutMapping("/edit/{petId}")
	public String updatePet(@Valid @ModelAttribute("pet") Pet pet, BindingResult result, HttpSession session, Model model, @PathVariable("petId") Long petId) {
		if (result.hasErrors()) {
//			get user
			Long id = (Long) session.getAttribute("loggedUser");
			User loggedUser = userServ.findById(id);
			model.addAttribute("loggedUser", loggedUser);
			// get pet
			model.addAttribute("petId", petId);
			return "editPet.jsp";
		} else {
			// making sure that this updated pet has the same id
			pet.setId(petId);
			// also making sure pet.user stays the same as before
			Pet thisPet = petService.findById(petId);
			pet.setUser(thisPet.getUser());
			// saving pet into db
			petService.savePet(pet);
			return "redirect:/pet/" + petId;
		}
	}
	
	/*	This is the post mapping for the "filter form" from the Pet Adoption page
	 * 	It reads the form inputs and adds the filter parameters the Pet Adoption page URL before redirecting back there
	 * 	Needs to be reworked to have the form's inputs persist since they refresh at every redirection, but it still works otherwise
	 * 	The name attribute of the @RequestParam()s below need to match the names on the form input fields
	 * 	The form I was testing with was formatted like so
	 * 		-Species filters are checkboxes (No need for checkboxes to have values)
	 * 		-Age filters are number inputs
	 * 		-Sex filter is a select
	 * 
	 * 	This function just parses the form data and concatenates it to the URL before redirecting to the pet adoption page
	 */
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
		if(sex != null && sex != "") {
			if(!sex.equals("None")) {
				filter = filter.concat("&filter=sex:" + sex);
			}
		}
		System.out.println("Filter: " + filter);
		return "redirect:/pet?page=1".concat(filter);
	}
	
	// VIEW PET PAGE 
	// will be changing "view" to "{id}" once jsp is halfway done
	@GetMapping("/{petId}")
	public String viewPet(@PathVariable("petId") Long petId, Model model, HttpSession session, RedirectAttributes redirect) {
		if (session.getAttribute("loggedUser") == null) {
			redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
			return "redirect:/";
		}
		
		Long id = (Long) session.getAttribute("loggedUser");
		User loggedUser = userServ.findById(id);
		model.addAttribute("loggedUser", loggedUser);
		
		Pet pet = petService.findById(petId);
		model.addAttribute("pet", pet);
//		model.addAttribute("pet", petService.findById(id));
		return "viewPet.jsp";
	}
	
	
	//----------		Inquiry Mappings		----------//

	// SHOW THE INQUIRY ADD PAGE 
	@GetMapping("/add/inquiry/{petId}")
	public String addInquiry(Model model,@PathVariable("petId") Long petId, 
							HttpSession session, RedirectAttributes redirect) {
		if (session.getAttribute("loggedUser") == null) {
			redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
			return "redirect:/login";
		}

		Long id = (Long) session.getAttribute("loggedUser");
		User loggedUser = userServ.findById(id);
		model.addAttribute("loggedUser", loggedUser);
		model.addAttribute("newInquiry", new Inquiry());

		Pet pet = petService.findById(petId);
		model.addAttribute("pet", pet);
		model.addAttribute("petId", petId);

		return "addInquiry.jsp";
	}

	//POST TO THE ADD INQUIRY
	@PostMapping("/add/inquiry") 
	public String saveInquiry(@Valid @ModelAttribute("newInquiry") Inquiry newInquiry, BindingResult result) {		
		
		if(result.hasErrors()) {
			return "addInquiry.jsp";
		}
		inquiryServ.save(newInquiry);
		return "redirect:/pet?page=1";
	}
	
	
	//SHOW THE INQUIRY DETAIL 
	@GetMapping("/inquire/{inquiryId}")
	public String showInquiryDetails(Model model, HttpSession session, @PathVariable("inquiryId")  Long inquiryId, RedirectAttributes redirect) {
		if (session.getAttribute("loggedUser") == null) {
			redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
			return "redirect:/";
		}
		
		User loggedUser = userServ.findById((Long) session.getAttribute("loggedUser"));
		model.addAttribute("loggedUser", loggedUser);
		Inquiry inquiry = inquiryServ.findById(inquiryId); 
		model.addAttribute("inquiry", inquiry);
		return "respondInquiry.jsp";//Put the jsp file here when complete.
	}

	// SHOW THE INQUIRY DASHBOARD
	@GetMapping("/inquire/dashboard")
	public String inquiryDashboard(Model model, HttpSession session, RedirectAttributes redirect) {
		if (session.getAttribute("loggedUser") == null) {
			redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
			return "redirect:/";
		}
		
		User loggedUser = userServ.findById((Long) session.getAttribute("loggedUser"));
		model.addAttribute("loggedUser", loggedUser);
		List<Inquiry> inquiries = inquiryServ.findAll();
		model.addAttribute("inquiries",inquiries);
		return "dashboardInquiry.jsp";//Put the jsp file here when complete.
	}
	
	// UPDATE THE INQUIRY WITH THE RESPONSE
	@PutMapping("/edit/inquiry/{inquiryId}")
	public String updateInquiry(@Valid @ModelAttribute("inquiry") Inquiry inquiry, BindingResult result, 
								HttpSession session, Model model, @PathVariable("inquiryId") Long inquiryId) {
		if (result.hasErrors()) {
//			get user
			Long id = (Long) session.getAttribute("loggedUser");
			User loggedUser = userServ.findById(id);
			model.addAttribute("loggedUser", loggedUser);
			// get inquiry
			model.addAttribute("inquiryId", inquiryId);
			return "respondInquiry.jsp";
		} else {
			// making sure that this updated inquiry has the same id
			inquiry.setId(inquiryId);
			// also making sure pet.user stays the same as before
			Inquiry thisInquiry = inquiryServ.findById(inquiryId);
//			inquiry.setUser(thisInquiry.getUser());
			// saving inquiry into db
			inquiryServ.save(inquiry);
			return "redirect:/inquire/dashboard";
		}
	}


	

}