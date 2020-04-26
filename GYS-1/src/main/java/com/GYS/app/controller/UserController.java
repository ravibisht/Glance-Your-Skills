/**
 * 
 */
package com.GYS.app.controller;

import java.util.Date;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.GYS.app.model.User;
import com.GYS.app.services.UserServices;

import com.GYS.app.services.SessionServicesImpl;

/**
 * @author Ravindra Singh
 *
 */

@Controller
public class UserController {
	
	
	@Autowired
	private UserServices us;
	
	
	
	
	
	
	
	 @RequestMapping(value="/logout")
	 public String logout(HttpSession session) {
		
		userLogOut(session);
		
		return "user/Login";
	}
	
	
	
	@RequestMapping(value="/login")
	  public String loginForm(Model model) {
		
		model.addAttribute("title", "login");
		return "user/Login";
     }
	
	
	    @RequestMapping(value="/login",method = RequestMethod.POST)
	    public String login(@RequestParam("username")String username,
			   @RequestParam("password")String password,HttpSession session,Model model) {
		   
		   
	    	 if(us.validateLogin(username, password)) {
			  
	    		User user=us.findByUsername(username);
	    		addUserSession(user,session);
			   
	            
	            
	           return "redirect:/user/home";
		     }
		   
		        model.addAttribute("loginerror", "UserName OR Password is Wrong");
		        model.addAttribute("bootstrapclass", "alert alert-danger mt-5");
		              
		       return "user/Login";
	     }
	
 
	    @RequestMapping(value="/signup")
		public String singUpForm() {
			
			return "user/SignUp";
		}
		
		
	    
		@RequestMapping(value="/signup",method = RequestMethod.POST)
		public String signUp(@ModelAttribute("user")User user,Model model) {
			
			 if(us.UserExitsByUsername(user.getUsername())) {
			    
			    model.addAttribute("Uerror", "Username is Already taken");		
			  
			    return "user/SignUp";
			 }
			
			
			else if(us.UserExitsByEmail(user.getEmail())){
				
				    model.addAttribute("emailerror", "Email id Already Exists");
				
				 return "user/SignUp";
			 }
			
			 user.setCreatedDate(new Date());
			 user.setUpdatedDate(new Date()); 
			 user.setProfilePicture("default-user.png");
			 
            us.saveUser(user);
			return "user/Login";
		 }
		
		public void addUserSession(User user,HttpSession session) {
			
			user.setPassword("");
			session.setAttribute("loggedInUser", user);
			session.setAttribute("loggedInUserId", user.getId());
			session.setAttribute("role","USER");
		 }
		
		
	    public void userLogOut(HttpSession session) {
			
			session.removeAttribute("loggedInUser");
			session.removeAttribute("ROLE");
			session.removeAttribute("loggedInUserId");
			session.invalidate();
		}
	
}
