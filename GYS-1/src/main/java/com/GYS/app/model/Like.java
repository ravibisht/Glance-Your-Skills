/**
 * 
 */
package com.GYS.app.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;
import org.springframework.stereotype.Component;

import com.GYS.app.model.Project;

/**
 * @author Ravindra Singh
 *
 */


@Component
@Entity
@Table(name="project_likes")
@DynamicUpdate
public class Like {
	
	
@Id	
@GeneratedValue(strategy =GenerationType.AUTO)
private int id;

@Column(name="user_id")
private int userId;

@Column(name="project_id")
private int projectId;


@Column(name="created_date")
private Date createdDate;

@Column(name="updated_date")
private Date updatedDate;




//------------------------------------- Relationship Mapping ----------------------------------------------

@ManyToOne
@JoinColumn(name = "project_id",insertable = false,updatable = false)
private Project project;




//----------------------------------------- To String --------------------------------------------------------

@Override
public String toString() {
	return "Like [id=" + id + ", userId=" + userId + ", project=" + project + ", createdDate=" + createdDate
			+ ", updatedDate=" + updatedDate + "]";
}







//------------------------------------------- Getters & Setters ------------------------------------------------


public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public int getUserId() {
	return userId;
}

public void setUserId(int user_id) {
	this.userId = user_id;
}

public Date getCreatedDate() {
	return createdDate;
}
public void setCreatedDate(Date created_date) {
	this.createdDate = created_date;
}
public Date getUpdatedDate() {
	return updatedDate;
}

public void setUpdatedDate(Date updated_date) {
	this.updatedDate = updated_date;
}


public Project getProject() {
	return project;
}


public void setProject(Project project) {
	this.project = project;
}

public int getProjectId() {
	return projectId;
}

public void setProjectId(int projectId) {
	this.projectId = projectId;
}





}





