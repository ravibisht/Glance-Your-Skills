package com.GYS.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Welcome {

	@Autowired
	LoginRepo lr;
	
	@RequestMapping("/")
	public String home() {
		
		return "index.jsp";
	}
	
	
	@RequestMapping("/login")
	public String login(Login login) {
		lr.save(login);
		
		return "index.jsp";
	}
}
