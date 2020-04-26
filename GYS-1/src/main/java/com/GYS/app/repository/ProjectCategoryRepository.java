package com.GYS.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GYS.app.model.ProjectCategory;

public interface ProjectCategoryRepository extends JpaRepository<ProjectCategory, Integer> {


	public ProjectCategory findById(int id);
}
