//package com.GYS.app.controller;
//
//
//import java.util.UUID;
//
//import javax.mail.MessagingException;
//
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.GYS.app.model.User;
//import com.GYS.app.services.EmailServices;
//import com.GYS.app.services.UserServices;
//
//@Controller
//public class ResetPasswordController {
//	
//	@Autowired
//	UserServices us;
//	
//	@Autowired
//	EmailServices es;
//	
//	
//	
//	@RequestMapping(value = "forgot", method = RequestMethod.GET)
//	public String displayForgotPasswordPage(Model model) {
//		
//		model.addAttribute("navName", "Back to Login");
//		model.addAttribute("navUrl", "/login");
//		
//		return "user/ForgotPasswordForm";
//    }
//	
//	
//	@RequestMapping(value="/forgot",method = RequestMethod.POST)
//	public String forgotPasswordForm(@RequestParam("email") String email,Model model) throws MessagingException {
//		
//		User user=us.findByEmail(email);
//		
//		if(user==null) {
//           model.addAttribute("errorMessage","User not Present With This Email");
//           model.addAttribute("bootstrapclass", "alert alert-danger");
//		}
//			
//			
//
//		
//		else {
//			
//			 user.setReset_token(UUID.randomUUID().toString());
//			 us.saveUser(user);
//			 es.sendEmail(user);
//			 
//			model.addAttribute("successMessage", "A Password reset link has been sent to " + user.getEmail());
//            model.addAttribute("bootstrapclass", "alert alert-success");
//		 }
//		
//		
//		model.addAttribute("navName", "Back to Login");
//		model.addAttribute("navUrl", "/login");
//		
//		return "user/ForgotPasswordForm";
//	}
//	
//	
//   @RequestMapping(value = "/reset", method = RequestMethod.GET)
//   public String displayResetPasswordPage(@RequestParam("reset_token") String reset_token,Model model) {
//		
//		
//		 User user = us.findByResetToken(reset_token);
//		  
//		  if (user!=null) {
//		  
//		  model.addAttribute("resetToken", reset_token);
//		 }
//		  
//		  else { 
//		  model.addAttribute("errorMessage",
//		  "Oops! This is an invalid password reset link.");
//		  model.addAttribute("bootstrapclass","alert alert-danger"); 
//		}
//		  model.addAttribute("navName", "Back to Login");
//		  model.addAttribute("navUrl", "/login");
//		  
//		return "user/ResetPasswordForm";
//	}
//   
//
//
//	@RequestMapping(value = "/reset", method = RequestMethod.POST)
//	public String setNewPassword(@RequestParam("reset_token") String reset_token,@RequestParam("password") String password,
//			Model model ) {
//
//		User resetuser = us.findByResetToken(reset_token);
//         
//		
//		if (resetuser!=null) {
//			
//            resetuser.setPassword(password);
//            resetuser.setReset_token(null);
//
//			us.saveUser(resetuser);
//
//			model.addAttribute("resetPassSuccessMessage", "You have successfully reset your password.  You may  login now.");
//
//	      return "user/Login";
//			
//		} 
//		
//		else {
//		 model.addAttribute("errorMessage", "Oops!  This is an invalid password reset link.");
//         model.addAttribute("navName", "Back to Login");
//		 model.addAttribute("navUrl", "/login");
//		
//		return "user/ResetPassword";
//      }
//	
//
//    }
//	
//}