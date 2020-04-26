package com.GYS.app.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.GYS.app.admin.services.AdminServices;
import com.GYS.app.services.SessionServicesImpl;

@Controller
public class AdminController {
	
@Autowired
private AdminServices as;



	@GetMapping("/admin/login")
	public String adminLoginForm() {
		
		return "dashboard/AdminLogin";
	}

	
    @PostMapping("/admin/login")
    public String adminLogin(@RequestParam("username")String username,
    		@RequestParam("password") String password,HttpSession session,Model model) {
	   
         if(as.validateAdmin(username, password)) {
        	
        	 addAdminSession(username, session);
        	 
        	 
        	 return "redirect:/admin/dashboard/data";
         }
         
         model.addAttribute("loginerror", "UserName OR Password is Wrong");
         model.addAttribute("bootstrapclass_error", "alert alert-danger");
         model.addAttribute("username", username);
         
         
         return "dashboard/AdminLogin";
     }
    



  @RequestMapping("/admin/logout")
  public String adminLogout(HttpSession session,Model model) {
	  
	     adminLogout(session);
	     
         model.addAttribute("bootstrapclass", "alert alert-success");
         model.addAttribute("message", "Your have Successfully Logout ");
	     
	   return "dashboard/AdminLogin";  
  }
  
  
  public void addAdminSession(String adminUsername,HttpSession session) {
		
		session.setAttribute("adminUsername", adminUsername);
 	    session.setAttribute("adminRole", "ADMIN"); 
		
	}


	public void adminLogout(HttpSession session) {
		
		session.removeAttribute("adminUsername");
		session.removeAttribute("adminRole");
		session.invalidate();
		
	}
  
} 