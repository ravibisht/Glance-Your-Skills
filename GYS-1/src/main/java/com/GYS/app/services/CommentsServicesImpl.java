package com.GYS.app.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GYS.app.model.Comment;
import com.GYS.app.model.Project;
import com.GYS.app.repository.CommentRepository;

@Service
public class CommentsServicesImpl implements CommentServices{

	@Autowired
    private CommentRepository cr;

	
@Override
	public void doComment(Comment comment) {
            		
             cr.saveAndFlush(comment);
             cr.flush();
	}


	
	public List<Comment> getComments(Project project) {

		return cr.findByProject(project);
	}

	public  void flush() {
		
		cr.flush();
	}



	@Override
	public Integer countComments(int project_id) {
          
		 		
		return cr.countByProject_Id(project_id);
	}



	@Override
	public void deleteCommentById(int id) {
      
		cr.deleteById(id);
		
	}



	@Override
	public Comment getComment(int id) {

		
		return cr.getOne(id);
	}
	
	
	
	
	
}
