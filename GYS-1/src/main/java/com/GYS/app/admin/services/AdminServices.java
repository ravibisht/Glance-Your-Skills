package com.GYS.app.admin.services;

import com.GYS.app.admin.model.Admin;

public interface AdminServices {

	
	public boolean validateAdmin(String username,String password);
	public Admin getAdminInfo(String username);
	
}
