/**
 * 
 */
package com.GYS.app.model;

import java.util.Date;
import java.util.*;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;
import org.springframework.stereotype.Component;

import com.GYS.app.model.Project;


/**
 * @author Ravi Bisht
 *
 **/
@Component
@Table(name="users")
@DynamicUpdate
@Entity
public class User {
    
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
   	private int id;
    
    private String username;
    private String firstname;
    private String lastname;
    private String password;
    private String email;
    
    @Column(name="mobile_no")
    private String mobileNo;
    
    private String bio;
    
    @Column(name="profile_picture")
    private String profilePicture;
    
    private String profession;
    
    private String reset_token;
    
    @Column(name = "created_date")
    private Date createdDate;
    
    @Column(name = "updated_date")
    private Date updatedDate;
    
    @OneToMany(mappedBy="user",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Project> projects=new ArrayList<Project>();

 
    
//--------------------------  Constructors ------------------------------------    
    
    
    
    
//---------------------------To String ----------------------------------------
    
    

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", firstname=" + firstname + ", lastname=" + lastname
				+ ", password=" + password + ", email=" + email + ", mobileNo=" + mobileNo + ", bio=" + bio
				+ ", profilePicture=" + profilePicture + ", profession=" + profession + ", reset_token=" + reset_token
				+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", projects=" + projects + "]";
	}
	
	
	
//--------------------   Getters And Setters ---------------------------------------
    
    
    
	
	
	



	public void setId(int id) {
		this.id = id;
	}
	
	public int getId() {
		
		return id;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getFirstname() {
		return firstname;
	}
	
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
	public String getLastname() {
		return lastname;
	}
	
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getMobileNo() {
		return mobileNo;
	}
	
	public void setMobileNo(String mobile_no) {
		this.mobileNo = mobile_no;
	}
	
	public String getBio() {
		return bio;
	}
	
	public void setBio(String bio) {
		this.bio = bio;
	}
	
	public String getProfilePicture() {
		return profilePicture;
	}
	
	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}
	
	
	public String getProfession() {
		return profession;
	}



	public void setProfession(String profession) {
		this.profession = profession;
	}

	
    
    public Date getCreatedDate() {
		return createdDate;
	}



	public void setCreatedDate(Date CreatedDate) {
		createdDate = CreatedDate;
	}


    public Date getUpdatedDate() {
		return updatedDate;
	}



	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}



	public List<Project> getProjects() {
	return projects;
    }


     public void setProjects(List<Project> projects) {
	   this.projects = projects;
     }



	public String getReset_token() {
		return reset_token;
	}



	public void setReset_token(String reset_token) {
		this.reset_token = reset_token;
	}




     


    
	
}
