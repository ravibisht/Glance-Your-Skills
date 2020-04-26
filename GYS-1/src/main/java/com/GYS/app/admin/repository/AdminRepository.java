package com.GYS.app.admin.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GYS.app.admin.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, Integer> {

	
	public Admin findByUsername(String username);
}
