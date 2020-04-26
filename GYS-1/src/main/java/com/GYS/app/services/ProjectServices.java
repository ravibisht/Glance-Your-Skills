package com.GYS.app.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import com.GYS.app.model.User;
import com.GYS.app.model.Project;

public interface ProjectServices {
	
	public void saveProject(Project project);
	public void saveProjectWithMedia(Project project,MultipartFile []images,MultipartFile video);
    public List<Project> getAllProject();
    public Project getProject(int project_id);
    public void deleteProjectById(int project_id);
    public Page<Project> showProjectByPage(Pageable pageable);
    public Long countAllProject();
    
}
