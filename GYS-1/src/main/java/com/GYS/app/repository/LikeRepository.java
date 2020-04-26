package com.GYS.app.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.GYS.app.model.Like;
import com.GYS.app.model.Project;
@Repository
public interface LikeRepository extends JpaRepository<Like, Integer>{

	@Modifying
	@Transactional
	@Query("delete from Like l where l.id =?1")
    public void deleteById(int id);	

	
	@Query("FROM Like  where user_id=?1 AND project=?2")
		public Like findByUserIdAndProjectId(int userid,Project project);
	   
	    
	   
//	    @Query("delete from Like where id=?1")
//        public void deleteById(int id);	
//		
	    
	    
	    @Query("FROM Like  where user_id=?1 AND project_id=?2")
        public Like findByUserIdAndProjectId(int userid,int project_id);
		
	    public int countByProject(Project project);

}
