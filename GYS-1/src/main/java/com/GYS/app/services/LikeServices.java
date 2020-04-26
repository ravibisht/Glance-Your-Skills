package com.GYS.app.services;


import com.GYS.app.model.Like;
import com.GYS.app.model.Project;

 public interface LikeServices {

	public boolean doLike(Like like);
	public Like getLike(int user_id,Project project);
	public Like getLike(int user_id,int project_id);
    public int countlikes(Project project);
	public void deleteById(int id);
	public void flush();

 }
