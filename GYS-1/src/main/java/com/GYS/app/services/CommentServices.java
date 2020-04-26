package com.GYS.app.services;

import java.util.List;

import com.GYS.app.model.Comment;
import com.GYS.app.model.Project;

public interface CommentServices {
	
	public List<Comment> getComments(Project project);
    public void doComment(Comment comment);
    public  void flush();
    public Integer countComments(int project_id);
    public void deleteCommentById(int id);
    public Comment getComment(int id);
    
}
