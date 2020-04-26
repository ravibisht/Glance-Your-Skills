package com.GYS.app.model;

import java.util.ArrayList;
import java.util.Calendar;
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
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.stereotype.Component;

import com.GYS.app.model.Comment;
import com.GYS.app.model.Like;
import com.GYS.app.model.ProjectCategory;
import com.GYS.app.model.User;

/**
 * @author Ravi Bisht
 *
 */
@Entity
@Table(name ="projects")
@Component
@DynamicUpdate
public class Project {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
    
	@Column(name="project_name")
	private String projectName;
	
	private String image;
	private String video;
	
	@Column(name="short_desc")
   	private String shortDesc;
	
	@Lob
	@Column
	private String description;
	
	@Column(name="external_link")
	private String externalLink;
	
	@Column(name="created_date")
	private Date createdDate;
	
	@Column(name="updated_date")
	private Date updatedDate;
	

	@Column(name="user_id")
	private int userId;
  
	@Column(name="category_id")
	private int categoryId;
	
  
  //----------------------- Relationship Mapping ---------------------------------------
	
	@ManyToOne
	@JoinColumn(name ="category_id",insertable = false, updatable = false)
	private ProjectCategory projectCategory;

	@ManyToOne
	@JoinColumn(name = "user_id", insertable = false, updatable = false)
	private User user;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "project", fetch = FetchType.EAGER)
	private List<Like> likes = new ArrayList<Like>();

	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "project", orphanRemoval = true)
	private List<Comment> comments = new ArrayList<Comment>();
	
	
	
	
//---------------------------To String -----------------------------------------------------------------------------------------------

	@Override
	public String toString() {
		return "Project [id=" + id + ", userId=" + userId + ", projectCategory=" + projectCategory
				+ ", projectName=" + projectName + ", shortDesc=" + shortDesc + ", description=" + description
				+ ", image=" + image + ", video=" + video + ", externalLink=" + externalLink + ", createdDate="
				+ createdDate + ", updatedDate=" + updatedDate + "]";
	}

	
	
//--------------------   Getters And Setters ------------------------------------------------------------------------------------------

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

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getShortDesc() {
		return shortDesc;
	}

	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
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

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getExternalLink() {
		return externalLink;
	}

	public void setExternalLink(String externalLink) {
		this.externalLink = externalLink;
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

	public ProjectCategory getProjectCategory() {
		return projectCategory;
	}

	public void setProjectCategory(ProjectCategory projectCategory) {
		this.projectCategory = projectCategory;
	}

	public List<Like> getLikes() {
		return likes;
	}

	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	
	
	public String dateCounter() {
		Calendar todayCal, createdCal;
	    Date today = new Date();
		todayCal = Calendar.getInstance();
		todayCal.setTime(today);
		int todayYear = todayCal.get(Calendar.YEAR);
        int dayOfYear = todayCal.get(Calendar.DAY_OF_YEAR);

		createdCal = Calendar.getInstance();
		createdCal.setTime(createdDate);

		int createdYear = createdCal.get(Calendar.YEAR);
		int yearCal = todayYear - createdYear;

		if (yearCal < 1) {
			int cdayOfYear = createdCal.get(Calendar.DAY_OF_YEAR);
			int count = dayOfYear - cdayOfYear;
			System.out.println("date : " + count);
			int result;
            if (count > 6 && count < 31) {
				result = (count / 7);
				return result > 1 ? result + " Weeks ago" : result + " Week ago";
			} 
			else if (count > 29 && count < 366) {
				result = (count / 30);
				return result > 1 ? result + " Months ago" : result + " Month ago";
			}
             return (count) > 1 ? count + " Days ago" : count + " Day ago";
		}
       return yearCal > 1 ? yearCal + " Years ago" : yearCal + " Year ago";
	}

}
