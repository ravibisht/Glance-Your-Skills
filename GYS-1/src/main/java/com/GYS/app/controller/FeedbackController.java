package com.GYS.app.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.GYS.app.model.Feedback;
import com.GYS.app.services.FeedbackServices;

@Controller
public class FeedbackController {

@Autowired
private FeedbackServices fs;

 @RequestMapping(value = "/feedback")
 public String feedbackForm(Model model) {
	 
	 model.addAttribute("navName", "Back to Home");
	 model.addAttribute("navUrl", "/user/home");
	
	 return "user/Feedback";
 }
	
 
  @RequestMapping(value="/feedback",method = RequestMethod.POST)
   public String feedback(Feedback feedback,HttpSession session,Model model) {
 
	   int loggedInUserId=(int)session.getAttribute("loggedInUserId");
	  
	   feedback.setUserId(loggedInUserId);

       feedback.setContactDate(new Date());
       fs.saveFeedback(feedback);
       
       return "user/Feedback";
    }
 
 
   @RequestMapping(value="/aboutus")
   public String aboutUs() {
	   
	   return "user/AboutUs";
   }
  
}
