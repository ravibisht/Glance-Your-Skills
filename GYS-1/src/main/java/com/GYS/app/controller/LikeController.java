package com.GYS.app.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.GYS.app.model.Like;

import com.GYS.app.services.LikeServices;


@Controller
public class LikeController {
   
	
	
	@Autowired
	private LikeServices ls;
	
	
	
	
	@RequestMapping("user/project/like/{projectId}")
	@ResponseBody
	public String doLike(@PathVariable("projectId")int projectId,HttpSession session) {
		
		Like like=new Like();
		
		like.setProjectId(projectId);
		
		
		int loggedInUserId=(int)session.getAttribute("loggedInUserId");
		
		like.setUserId(loggedInUserId);
		
		like.setCreatedDate(new Date());
		like.setUpdatedDate(new Date());
		
		
		Like checklike=ls.getLike(loggedInUserId,like.getProjectId());
		
		
		 String message="";
		
		  if(checklike!=null) {
			    
			  ls.deleteById(checklike.getId());
	     	  
	     	  message="deleted";
           }
		  
		  else {
			  ls.doLike(like);
			  message="liked";	
		   }
			
			
		
		
		
		
		return message;
	}
	
	
	
	
}
