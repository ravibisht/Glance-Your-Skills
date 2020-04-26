package com.GYS.app.services;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import com.GYS.app.model.User;

public interface UserServices {

	
	public void saveUser(User user);
	public void saveUserWithProfileImage(User user,MultipartFile image );
	public boolean UserExitsByUsername(String username);
	public boolean UserExitsByEmail(String email);
	public boolean validateLogin(String username,String password);
	public User findByUsername(String username);
	public User getUserById(int id);
	public User findByUser(String username);
	public List<User> getAllUser();
	public User findByResetToken(String reset_token);
	public User findByEmail(String email);
	public void userDeleteById(int id);
    public Page<User> showUsersByPage(Pageable pageable);
    public Long countAllUsers();
	public List<User> findUserBetweenFromDateToDate(Date fromDate,Date toDate); 

	
	
	
	
}
