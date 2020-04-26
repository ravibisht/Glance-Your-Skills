package com.GYS.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import com.GYS.app.model.Comment;
import com.GYS.app.model.Project;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
  
	//@Query("FROM Comment where project_id=?1")
	
	public List<Comment> findByProject(Project project);
	public Integer countByProject_Id(int project_id);
}
