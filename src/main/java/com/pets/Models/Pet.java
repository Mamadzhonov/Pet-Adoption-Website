package com.pets.Models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "pets")
public class Pet {

	//// ATTRIBUTES

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message = "Name is required")
	private String name;

	@NotEmpty(message = "Species is required")
	private String species;

	@NotEmpty(message = "Breed is required")
	private String breed;

	@NotEmpty(message = "Description is required")
	private String description;

	@NotNull(message = "Age is required")
	@Min(value = 0, message = "Age can't be less than 0")
	private Integer age;
	
	@NotEmpty(message = "Gender is required")
	private String sex;
	
	@NotNull(message="Date of Arrival required")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateOfArrival;

	private String petStatus;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;
	
	@OneToMany(mappedBy="pet", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Inquiry> inquiries;

	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;

	@PrePersist
	private void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	private void onUpdate() {
		this.updatedAt = new Date();
	}

	//// CONSTRUCTORS

	public Pet() {
	}

	//// GETTERS AND SETTERS

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}
	
	public Date getDateOfArrival() { 
		return dateOfArrival; 
		
	}
	  
	public void setDateOfArrival(Date dateOfArrival) { 
		this.dateOfArrival = dateOfArrival; 
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	
	public String getPetStatus() {
		return petStatus;
	}

	public void setPetStatus(String petStatus) {
		this.petStatus = petStatus;
	}

	public List<Inquiry> getInquiries() {
		return inquiries;
	}

	public void setInquiries(List<Inquiry> inquiries) {
		this.inquiries = inquiries;
	}
	
	
}
