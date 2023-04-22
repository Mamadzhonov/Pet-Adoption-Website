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

import com.pets.Models.LoginUser;
import com.pets.Models.User;
import com.pets.Services.UserService;

@Controller
public class MainContoller {

	@Autowired
	private UserService userServ;

//	@GetMapping("/")
//	public String index() {
//		return "redirect:/register";
//	}

	// Making a test route for the landing page
	@GetMapping("/home")
	public String home(HttpSession session, Model model, RedirectAttributes redirect) {
		model.addAttribute("newLogin", new LoginUser());

		if (session.getAttribute("loggedUser") == null) {
			redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
			return "redirect:/login";
		}

		Long id = (Long) session.getAttribute("loggedUser");
		User loggedUser = userServ.findById(id);
		model.addAttribute("loggedUser", loggedUser);

		return "homepage.jsp";
	}

	
	// LANDING PAGE
	// Making a test route for the landing page
	@GetMapping("/api")
	public String homepage(HttpSession session, Model model, RedirectAttributes redirect) {
		// leaving room for model attributes + redirectAttribute error return (if user is not logged in)
		model.addAttribute("newLogin", new LoginUser());

		if (session.getAttribute("loggedUser") == null) {
			redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
			return "redirect:/login";
		}

		Long id = (Long) session.getAttribute("loggedUser");
		User loggedUser = userServ.findById(id);
		model.addAttribute("loggedUser", loggedUser);

		return "Index.jsp";
	}
	
	@GetMapping("/")
	public String userRegLogin(Model model, HttpSession session, RedirectAttributes redirect) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "userRegLogin.jsp";
	}
	
//	@GetMapping("/register")
//	public String registration(Model model, HttpSession session, RedirectAttributes redirect) {
//		model.addAttribute("newUser", new User());
//		return "Registration.jsp";
//	}
//
//	@PostMapping("/register")
//	public String register(@Valid @ModelAttribute("newUser") User user, BindingResult result, HttpSession session,
//			Model model, RedirectAttributes redirect) {
//		model.addAttribute("newLogin", new LoginUser());
//
//		// Checks if data in frontend maches with BD requirments
//		if (result.hasErrors()) {
//			return "Registration.jsp";
//		}
//
//		// Check if email already used!
//		if (userServ.findByEmail(user.getEmail())) {
//			redirect.addFlashAttribute("emailExist", "Email is already used!");
//			return "redirect:/register";
//		}
//
//		// Storing logged User's id
//		User newUser = userServ.register(user, result);
//		if (newUser == null) {
//			model.addAttribute("newLogin", new LoginUser());
//			return "Registration.jsp";
//		}
//		session.setAttribute("loggedUser", user.getId());
//
//		return "redirect:/home";
//	}
//
//	@GetMapping("/login")
//	public String getLoginPage(Model model) {
//		model.addAttribute("newLogin", new LoginUser());
//		return "Login.jsp";
//	}
//
//	@PostMapping("/login")
//	public String login(@Valid @ModelAttribute("newLogin") LoginUser usrLogin, HttpSession session, Model model,
//			BindingResult result, RedirectAttributes redirect) {
//
//		User user = userServ.login(usrLogin, result);
//		if (user == null) {
//			model.addAttribute("newUser", new User());
//			redirect.addFlashAttribute("loginIssue", "Login or Password is invalid!");
//			return "redirect:/login";
//		}
//		session.setAttribute("loggedUser", user.getId());
//		return "redirect:/home";
//	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("loggedUser", null);
		return "redirect:/";
	}
	
//	about page
	@GetMapping("/about")
	public String about(HttpSession session, Model model, RedirectAttributes redirect) {
		model.addAttribute("newLogin", new LoginUser());

		if (session.getAttribute("loggedUser") == null) {
			redirect.addFlashAttribute("permitionIssue", "Need to login to access Home page");
			return "redirect:/login";
		}

		Long id = (Long) session.getAttribute("loggedUser");
		User loggedUser = userServ.findById(id);
		model.addAttribute("loggedUser", loggedUser);

		return "about.jsp";
	}
}
