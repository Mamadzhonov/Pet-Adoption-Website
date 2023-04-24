package com.pets.Contollers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiController {
	@GetMapping("/apiKey")
	public List<String> mapTest() {
		System.out.println("We're trying here");
		
		File keyFile = new File("src/main/resources/static/map_key.txt");
		FileInputStream inStream = null;
		
		
		try {
			inStream = new FileInputStream(keyFile.getAbsoluteFile());
		} catch(FileNotFoundException e) {
			System.err.println("Couldn't file key file. Error: " + e.getMessage());
		}
		byte[] lines = null;
		
		
		try {
			lines = inStream.readAllBytes();
		} catch(IOException e) {
			System.err.println("Couldn't read api file. Error: " + e.getMessage());
		}
		List<String> response = new ArrayList<String>();
		response.add(new String(lines));
		
		System.out.println("Key: " + response.get(0));
		return response;
	}
}
