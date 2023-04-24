package com.pets.Contollers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiController {
	@GetMapping("/apiKey")
	public List<String> mapTest() {
		Path keyFilePath = Paths.get("D:/CodingDojo/Assignments/Projects/Pet Adoption Site/Pet-Adoption-Website/src/main/resources/static/map_key.txt");
		List<String> fileLines = null;
		
		try {
			fileLines = Files.readAllLines(keyFilePath);
		} catch(IOException e) {
			System.err.println("Couldn't read api file. Error: " + e.getMessage());
		}
		System.out.println(fileLines.get(0));	
		return fileLines;
	}
}
