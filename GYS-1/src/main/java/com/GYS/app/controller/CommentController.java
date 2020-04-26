package com.GYS.app.controller;

import java.util.Date;

import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.GYS.app.model.Comment;
import com.GYS.app.services.CommentServices;


@Controller
public class CommentController {

	@Autowired
	private CommentServices cs;
	
	
	@PostMapping(value={"user/project/comment","/profile/user/project/comment"})
	@ResponseBody
	public 	Comment doComments(@RequestParam("projectId")int projectId,Comment comment,HttpSession session) {
		
		int loggedInUserId=(int)session.getAttribute("loggedInUserId");
		
		comment.setUserId(loggedInUserId);
        comment.setProjectId(projectId);
        comment.setCreatedDate(new Date());
        comment.setUpdatedDate(new Date());
		cs.doComment(comment);
		
		
		return comment;
	}
	
	
	
	@RequestMapping({"user/project/comment/delete/{id}","/profile/user/project/comment/delete/{id}"})
	@ResponseBody
	public String deleteCommentById(@PathVariable int id,HttpSession session) {
		
		  int CommentUserId=cs.getComment(id).getUserId();
		  int loggedInUserId=(int)session.getAttribute("loggedInUserId");
		  
		  try {
			  
            if(loggedInUserId==CommentUserId) {
		     
        	  cs.deleteCommentById(id);
              return "Deleted";
		     }
          
           return "error";
		 } 
		  
		 catch(EntityNotFoundException e) {
			 return "comment already deleted";
		  }
	
	}

}