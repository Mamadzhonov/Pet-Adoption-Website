package com.pets.Models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty
    @Size(min = 4, message = "Username must be more then 4 characters!")
    private String userName;
    
    @Email
    private String email;
    @NotEmpty
    @Size(min = 5, message = "Password must be more then 5 characters!")
    private String password;
    @Transient
    private String confirmPW;
    // admin + user signifier
    private String userType;
    
    @OneToMany(mappedBy="user", fetch=FetchType.LAZY)
    private List<Pet> petsPosted;
    
    @OneToMany(mappedBy="sender", fetch=FetchType.LAZY)
    private List<Message> messagesSent;
    
    @OneToMany(mappedBy="receiver", fetch=FetchType.LAZY)
    private List<Message> messagesReceived;

    @Column(updatable = false)
    private Date createdAt;

    private Date updatedAt;


    @OneToMany(mappedBy = "users", fetch = FetchType.LAZY)
    private List<Event> events;

    public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPW() {
        return confirmPW;
    }

    public void setConfirmPW(String confirmPW) {
        this.confirmPW = confirmPW;
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

    @PrePersist
    public void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    public void onUpdate() {
        this.updatedAt = new Date();
    }

	public List<Pet> getPetsPosted() {
		return petsPosted;
	}

	public void setPetsPosted(List<Pet> petsPosted) {
		this.petsPosted = petsPosted;
	}
	// adding this so we can signify who is an admin + who isn't 
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public List<Message> getMessagesSent() {
		return messagesSent;
	}

	public void setMessagesSent(List<Message> messagesSent) {
		this.messagesSent = messagesSent;
	}

	public List<Message> getMessagesReceived() {
		return messagesReceived;
	}

	public void setMessagesReceived(List<Message> messagesReceived) {
		this.messagesReceived = messagesReceived;
	}
}
