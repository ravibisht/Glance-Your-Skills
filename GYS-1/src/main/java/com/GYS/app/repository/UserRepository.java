/**
 * 
 */
package com.GYS.app.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.GYS.app.model.User;
/**
 * @author Ravi Bisht
 *
 */
public interface UserRepository extends JpaRepository<User,Integer> {
    
	
 	public User findByUsername(String username);
	public User findByEmail(String email);
	public User findById(int id);
	
	@Query("from User where reset_token=?1")
    public User findByReset_token(String reset_token);	
	public List<User> findByCreatedDateBetween(Date fromDate,Date toDate);

}
