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
import javax.validation.constraints.NotNull;

@Entity
@Table(name="inquiries")
public class Inquiry {

	////	ATTRIBUTES
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@NotNull(message="Inquiry type required")
	private String inquiryType;
	
	private Date dateOfPickup;
	
	private Date dateOfDropoff;
		
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="pet_id")
	private Pet pet;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="inquirer_id")
	private User inquirer;
	
	@OneToMany(mappedBy="inquiry", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Message> chat;
	
	@Column(updatable=false)
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
	
	////	CONSTRUCTORS
	
	public Inquiry() {}

	////	GETTERS AND SETTERS
	
	public Long getId() {
		return id;
	}

	public String getInquiryType() {
		return inquiryType;
	}

	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}

	public Date getDateOfPickup() {
		return dateOfPickup;
	}

	public void setDateOfPickup(Date dateOfPickup) {
		this.dateOfPickup = dateOfPickup;
	}

	public Date getDateOfDropoff() {
		return dateOfDropoff;
	}

	public void setDateOfDropoff(Date dateOfDropoff) {
		this.dateOfDropoff = dateOfDropoff;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}

	public User getInquirer() {
		return inquirer;
	}

	public void setInquirer(User inquirer) {
		this.inquirer = inquirer;
	}

	public List<Message> getChat() {
		return chat;
	}

	public void setChat(List<Message> chat) {
		this.chat = chat;
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
}
