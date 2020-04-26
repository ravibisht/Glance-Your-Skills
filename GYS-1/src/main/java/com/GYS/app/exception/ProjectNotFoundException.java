package com.GYS.app.exception;




public class ProjectNotFoundException extends Exception {

	
	
	
	public ProjectNotFoundException(int id) {
		super("Reason  Being Project Not Found That You Looking For With ID "+id);
	 }

	
	
	
	
}
