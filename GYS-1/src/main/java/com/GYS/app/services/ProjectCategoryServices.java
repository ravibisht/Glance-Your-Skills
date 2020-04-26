package com.GYS.app.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import com.GYS.app.model.ProjectCategory;
public interface ProjectCategoryServices {
	
	public List<ProjectCategory> allCategories();
	public ProjectCategory findById(int id);
	public void saveProjectCategory(ProjectCategory projectCategory);
	public void saveProjectCategoryWithImage(ProjectCategory projectCategory,MultipartFile image);
	public void deleteProjectCategoryById(int id);
	public Long countAllProjectCategories();
    public Page<ProjectCategory> showProjectCategoryByPage(Pageable pageable);
}
