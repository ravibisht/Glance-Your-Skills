package com.GYS.app.controller;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.GYS.app.model.User;
import com.GYS.app.exception.ProjectNotFoundException;
import com.GYS.app.model.Project;
import com.GYS.app.services.ProjectCategoryServices;
import com.GYS.app.services.ProjectServices;

/**
 * @author Ravi Bisht
 *
 */

@Controller
public class ProjectController {

	@Autowired
	private ProjectServices ps;

	@Autowired
	private ProjectCategoryServices pcs;

	@RequestMapping(value = "/uploadProject")
	public String addProjects(Model model) {

		model.addAttribute("pc", pcs.allCategories());

		model.addAttribute("navName", "Back to Home");
		model.addAttribute("navUrl", "/user/home");

		return "user/ProjectUploadForm";

	}

	@PostMapping(value = "/user/upload/project")
	public String addProject(Project project, HttpSession session, @RequestParam int categoryId,
			@RequestParam("images") MultipartFile images[], @RequestParam("videofile") MultipartFile video) {

		int loggedInUserId = (int) session.getAttribute("loggedInUserId");

		project.setCategoryId(categoryId);
		project.setCreatedDate(new Date());
		project.setUpdatedDate(new Date());

		project.setUserId(loggedInUserId);

		ps.saveProjectWithMedia(project, images, video);

		return "user/ProjectUploadForm";
	}

	@RequestMapping(value = "project/edit/{projectId}")
	public String editProjectForm(@PathVariable int projectId, HttpSession session, Model model)
			throws ProjectNotFoundException {

		String username = ((User) session.getAttribute("loggedInUser")).getUsername();

		try {

			Project project = ps.getProject(projectId);

			int loggedInUserId = (int) session.getAttribute("loggedInUserId");
			int projectUserId = project.getUserId();

			if (loggedInUserId == projectUserId) {
				model.addAttribute("project", project);
				model.addAttribute("navName", "Back to Profile");
				model.addAttribute("navUrl", "/profile/" + username);

				return "user/ProjectEditForm";
			}

		}

		catch (EntityNotFoundException message) {

			throw new ProjectNotFoundException(projectId);
		}

		return "error/error";

	}

	@PostMapping(value = "/project/edit")
	public String editProject(Project project, HttpSession session, Model model) {

		Project newproject = ps.getProject(project.getId());

		newproject.setProjectName(project.getProjectName());
		newproject.setExternalLink(project.getExternalLink());

		newproject.setDescription(project.getDescription());

		newproject.setShortDesc(project.getShortDesc());
		newproject.setUpdatedDate(new Date());

		ps.saveProject(newproject);

		return "redirect:/profile/" + newproject.getUser().getUsername();

	}

	@RequestMapping(value = { "share/project/{projectId}", "show/project/{projectId}" })
	public String showProject(@PathVariable("projectId") int projectId, Model model) throws ProjectNotFoundException {

		try {
			Project project = ps.getProject(projectId);
			int categoryId = project.getCategoryId();
			model.addAttribute("project", project);
			model.addAttribute("categoryId", categoryId);

			return "user/ShowProject";
		}

		catch (EntityNotFoundException exception) {

			throw new ProjectNotFoundException(projectId);
		}

	}

	@RequestMapping(value = "/project/delete/{projectId}")
	public String deleteProject(@PathVariable int projectId, HttpSession session, Model mv)
			throws ProjectNotFoundException {

		try {

			int projectUserId = ps.getProject(projectId).getUserId();

			int loggedInUserId = (int) session.getAttribute("loggedInUserId");

			if (projectUserId == loggedInUserId) {
				ps.deleteProjectById(projectId);

				return "redirect:/profile";
			}

		}

		catch (EntityNotFoundException message) {
			throw new ProjectNotFoundException(projectId);
		}
		return "error/error";
	}

	/*
	 * @RequestMapping(value = { "/", "index", "/value}" }) public String
	 * showProjectForWelcomePage(Model model, @RequestParam(defaultValue = "12") int
	 * value, HttpSession session) {
	 * 
	 * 
	 * try { String
	 * username=((User)session.getAttribute("loggedInUser")).getUsername();
	 * 
	 * if(username!=null) {
	 * 
	 * return "redirect:/user/home"; }
	 * 
	 * } catch(Exception e) { System.out.println(e); }
	 * 
	 * 
	 * Page<Project> projects = ps.showProjectByPage(PageRequest.of(0, value));
	 * 
	 * model.addAttribute("projects", projects); model.addAttribute("value", value);
	 * 
	 * return "user/Index"; }
	 */

	@RequestMapping("/user/home")
	public String homeProjects(Model model, HttpSession session) {

		List<Project> projects = ps.getAllProject();
		model.addAttribute("projects", projects);

		return "user/Home";
	}

}
