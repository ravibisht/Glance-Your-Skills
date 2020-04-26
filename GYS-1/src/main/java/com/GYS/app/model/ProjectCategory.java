package com.GYS.app.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

import org.springframework.stereotype.Component;



/**
 * @author Ravindra Singh
 *
 */

@Component
@Entity
@Table(name="project_categories")
public class ProjectCategory {

@Id	
@GeneratedValue(strategy = GenerationType.AUTO)
public int id;	

public String name;
private String description;
private String image;

@Column(name="created_date")
private Date createdDate;

@Column(name="updated_date")
private Date updatedDate;




//---------------------------To String ----------------------------- 


@Override
public String toString() {
	return "Project_Category [id=" + id + ", name=" + name + ", description=" + description + ", image=" + image
			+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + "]";
}






//--------------------   Getters And Setters ---------------------------------------


public int getId() {
	return id;
}


public void setId(int id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}

public String getImage() {
	return image;
}

public void setImage(String image) {
	this.image = image;
}

public Date getCreatedDate() {
	return createdDate;
}

public void setCreatedDate(Date createdDate) {
	this.createdDate = createdDate;
}

public Date getUpdatedDate() {
	return updatedDate;
}

public void setUpdatedDate(Date updatedDate) {
	this.updatedDate = updatedDate;
}



	
}
