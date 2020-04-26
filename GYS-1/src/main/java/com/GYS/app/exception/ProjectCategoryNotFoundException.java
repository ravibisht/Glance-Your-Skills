package com.GYS.app.exception;



public class ProjectCategoryNotFoundException extends Exception {

	public ProjectCategoryNotFoundException(int id) {
		super("Reason  Being  Project Category Not Found With Id : "+id);
		
	}

	
	
}
