package com.GYS.app.services;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GYS.app.model.Like;
import com.GYS.app.model.Project;
import com.GYS.app.repository.LikeRepository;

@Service
public class LikeServicesImpl implements LikeServices{
    
	@Autowired
    private LikeRepository lr;
    
	@Override
	public boolean doLike(Like like) {
         lr.saveAndFlush(like);
		 lr.flush();
		return true;
	}

	
   public void flush() {
		lr.flush();
	}


	@Override
	public int countlikes(Project project) {		
		
		return lr.countByProject(project);
	}

    
    
	public Like getLike(int user_id, Project project) {
		
		return lr.findByUserIdAndProjectId(user_id, project); 
	}


	@Override
	public Like getLike(int user_id, int project_id) {
		return 	 lr.findByUserIdAndProjectId(user_id, project_id); 
    }

    @Override
	public void deleteById(int id) {
        lr.deleteById(id);
	}

}
