package com.GYS.app.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;
import org.springframework.stereotype.Component;

import com.GYS.app.model.Project;

@Component
@Entity
@Table(name="project_comments")
@DynamicUpdate
public class Comment {

 @Id
 @GeneratedValue
 private int id;
 
 @Column(name="user_id")
 private int userId;
 
 @Column(name="project_id")
 private int projectId;
 
 @Column(name = "comment")
 private String commentText;
 
 
 @Column(name="created_date")
 private Date createdDate;
 
 @Column(name="updated_date")
 private Date updatedDate;
 

//-------------------------------- Relationship Mapping ---------------------------------------------- 
 
 
 @ManyToOne
 @JoinColumn(name = "user_id",insertable = false,updatable = false)
 private User user;
 
 @ManyToOne
 @JoinColumn(name = "project_id", insertable = false, updatable = false)
 private Project project;
 
 
 
 
//---------------------------------- To String -------------------------------------------------------------
 
@Override
public String toString() {
	return "Comment [id=" + id + ", userId=" + userId + ", commentText=" + commentText + ", project=" + project
			+ ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", user=" + user + "]";
}





//--------------------------------- Getters & Setters ---------------------------------------------------

public int getId() {
	return id;
}


public void setId(int id) {
	this.id = id;
}


public int getUserId() {
	
	return userId;
}


public void setUserId(int userId) {
	this.userId = userId;
}



public Project getProject() {
	return project;
}


public void setProject(Project project) {
	this.project = project;
}


public String getCommentText() {
	return commentText;
}


public void setCommentText(String commentText) {
	this.commentText = commentText;
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


public User getUser() {
	return user;
}


public void setUser(User user) {
	this.user = user;
}


public int getProjectId() {
	return projectId;
}


public void setProjectId(int project_id) {
	this.projectId = project_id;
}
 
 
 
	
}
