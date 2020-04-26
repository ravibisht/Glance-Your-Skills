package com.GYS.app.admin.dashbord.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.GYS.app.exception.FeedbackNotFoundException;
import com.GYS.app.exception.ProjectCategoryNotFoundException;
import com.GYS.app.exception.ProjectNotFoundException;
import com.GYS.app.exception.UserNotFoundException;
import com.GYS.app.model.Feedback;
import com.GYS.app.model.ProjectCategory;
import com.GYS.app.model.User;
import com.GYS.app.model.Project;
import com.GYS.app.services.FeedbackServices;
import com.GYS.app.services.ProjectCategoryServices;
import com.GYS.app.services.UserServices;
import com.GYS.app.services.ProjectServices;


@Controller
public class DashbordController {

	@Autowired
	private ProjectCategoryServices pcs;

	@Autowired
	private UserServices us;

	@Autowired
	private ProjectServices ps;

	@Autowired
	private FeedbackServices fs;
	
	private Date createdDate;

//-----------------------------------  Project Category Controller ---------------------------------------

	@RequestMapping("/admin/dashboard/add/projectcategory")
	public String addProjectCategoryForm() {
		return "dashboard/DashboardAddCategory";
	 }
	

	@RequestMapping("/admin/dashboard/edit/projectcategory")
	public String editProjectCategoryForm(Model model, @RequestParam int id) throws ProjectCategoryNotFoundException {
		
		try {
		ProjectCategory projectCategory = pcs.findById(id);
		
		createdDate = projectCategory.getCreatedDate();
		model.addAttribute("editCategory", projectCategory);
		return "dashboard/DashboardEditCategory";
	   }
		
		catch(Exception exception) {
			throw new ProjectCategoryNotFoundException(id);
		}
	}

	
	@PostMapping("/admin/dashboard/add/projectcategory")
	public String addProjectCategory(ProjectCategory projectCategory, Model model, MultipartFile categoryPicture) {

		projectCategory.setCreatedDate(new Date());
		projectCategory.setUpdatedDate(new Date());
        pcs.saveProjectCategoryWithImage(projectCategory,categoryPicture);
	    model.addAttribute("meassage", "Project Category Added ");

		return "redirect:/admin/dashboard/show/projectCategory/page";
	}

	
	@PostMapping("/admin/dashboard/edit/projectcategory")
	public String editProjectCategory(ProjectCategory projectCategory, Model model, MultipartFile categoryPicture) {

		projectCategory.setCreatedDate(createdDate);
		projectCategory.setUpdatedDate(new Date());
        pcs.saveProjectCategoryWithImage(projectCategory,categoryPicture);
        model.addAttribute("meassage", "Project Category Updated ");

		return "redirect:/admin/dashboard/show/projectCategory/page";
	}

	
	@RequestMapping("/admin/dashboard/del/projectCategory/{pageId}/{id}")
	public String deleteProjectCategory(@PathVariable("pageId")int pageNo,
			                            @PathVariable int id,  
			                            @RequestParam int  total,Model model) throws ProjectCategoryNotFoundException {
		         if(total==1) 
			       pageNo=pageNo-1;
		           if(pageNo<0)
				       pageNo=0;
		
		try {           
		pcs.deleteProjectCategoryById(id);
		model.addAttribute("meassage", "Project Category Deleted");
		
		}
		catch(Exception exception) {
			throw new ProjectCategoryNotFoundException(id);
		}

		return "redirect:/admin/dashboard/show/projectCategory/page?page="+pageNo;
	}

	
	@RequestMapping("/admin/dashboard/show/projectCategory/page")
	public String showProjectCategory(Model model, @RequestParam(defaultValue = "0") int page) {
		Page<ProjectCategory> projectCategory = pcs.showProjectCategoryByPage(PageRequest.of(page, 6));
		model.addAttribute("projectCategoriesByPage", projectCategory);
		model.addAttribute("currentPage", page);
		return "dashboard/DashboardProjectCategories";
	}

//--------------------------------- Project Controller ----------------------------------------

	@RequestMapping("/admin/dashboard/show/projects")
	public String showProjects(Model model) {

		model.addAttribute("projects", ps.getAllProject());

		return "Projects";
	}

	
	@RequestMapping("/admin/dashboard/show/projects/page")
	public String showProjectByPage(Model model, @RequestParam(defaultValue = "0") int page) {

		Page<Project> project = ps.showProjectByPage(PageRequest.of(page, 6));

		model.addAttribute("projectByPage", project);
		model.addAttribute("currentPage", page);

		return "dashboard/DashboardShowProjects";

	}

	
	@RequestMapping("/admin/dashboard/show/project/{projectId}")
	public String showProject(@PathVariable("projectId") int projectId, Model model) throws ProjectNotFoundException {

		try {
		 Project project = ps.getProject(projectId);
		 project.getCategoryId();
         model.addAttribute("project", project);

		 return "dashboard/DashboardShowProject";
	  }	
		catch(EntityNotFoundException message) {
			
			throw new ProjectNotFoundException(projectId);
		}	
		
	}

	
	@RequestMapping("/admin/dashboard/del/project/{pageIid}/{projectId}")
	public String deleteProject(@PathVariable("pageId")int pageNo,
			                   @PathVariable int projectId,
			                   @RequestParam int  total,Model model) throws ProjectNotFoundException {

		         if(total==1) 
			          pageNo=pageNo-1;
	               if(pageNo<0)
				       pageNo=0;
	    try {           
	     	ps.deleteProjectById(projectId);
		    model.addAttribute("deleteMeassage", "Project Has Been Deleted");
	    }
	    
	    catch(EntityNotFoundException message) {
			   throw new ProjectNotFoundException(projectId);
		   }
	    
		return "redirect:/admin/dashboard/show/projects/page?page="+pageNo;
	}

// -------------------------------- User Controller --------------------------------------------

	@RequestMapping("/admin/dashboard/show/users/page")
	public String showUsersByPage(Model model, @RequestParam(defaultValue = "0") int page) {

		Page<User> users = us.showUsersByPage(PageRequest.of(page, 6));
		model.addAttribute("userByPage", users);
		model.addAttribute("currentPage", page);
		return "dashboard/DashboardShowUser";
	}

	
	@RequestMapping("/admin/dashboard/show/user/{username}")
	public String showUser(@PathVariable String username, Model model) throws UserNotFoundException {

		User user = us.findByUser(username);
		
		if(user==null)
			 throw new UserNotFoundException(username);
		
		model.addAttribute("userProfile", user);

		return "dashboard/DashboardUserProfile";
	}

	
	@RequestMapping("/admin/dashboard/del/user/page/{pageId}/{userId}")
	public String deleteUser(@PathVariable("page_id")int pageNo,
			                 @PathVariable int userId,
			                 @RequestParam int  total,Model model) throws UserNotFoundException {

		
		if(total==1) 
			 pageNo=pageNo-1;
		       if(pageNo<0)
				    pageNo=0;
		
		try {
		  us.userDeleteById(userId);
		
		  model.addAttribute("deleteMesssage", "User Has Been Deleted");
          
		}  
		
		catch(EntityNotFoundException message) {
		        throw new UserNotFoundException(userId);
		}
		
		return "redirect:/admin/dashboard/show/users/page/?page="+pageNo;
	}

//--------------------------- Feedback Controller -------------------------  

	@RequestMapping("/admin/dashboard/show/feedback/page")
	public String showFeedbackByPage(Model model, @RequestParam(defaultValue = "0") int page) {

		Page<Feedback> feedback = fs.showFeedbackByPage(PageRequest.of(page, 10));

		model.addAttribute("feedbackByPage", feedback);
		model.addAttribute("currentPage", page);
		return "dashboard/DashboardFeedback";
	}

	
	/* delete
	 * @RequestMapping("/admin/dashboard/show/feedback/{feedbackId}") public String
	 * showFeedback(@PathVariable int feedbackId, Model model) {
	 * 
	 * model.addAttribute("feedback", fs.getfeedback(feedbackId));
	 * 
	 * return "ShowFeedback"; }
	 */
	

	@RequestMapping("/admin/dashboard/del/feedback/{page_id}/{feedback_id}")
	public String deleteFeedback(@PathVariable("page_id")int pageNo,
			                     @PathVariable ("feedbackId")int feedbackId,
			                     @RequestParam int  total,Model model) throws FeedbackNotFoundException {

		                if(total==1) 
			               pageNo=pageNo-1;
                         if(pageNo<0)
				                 pageNo=0;
                 
                  try {
		           fs.deleteFeedbackById(feedbackId);
		            model.addAttribute("deleteMeassage", "Feedback Has Been Deleted");
                  }
                  catch(EntityNotFoundException exception) {
                	  throw new FeedbackNotFoundException(feedbackId);
                  }
		return "redirect:/admin/dashboard/show/feedback/page/?page="+pageNo;
	}

//--------------------------- Dashboard Controller -----------------------------
	@RequestMapping("/admin/dashboard/data")
	public String dashBoardData(Model model) {

		model.addAttribute("totalUsers", us.countAllUsers());
		model.addAttribute("totalProjects", ps.countAllProject());
		model.addAttribute("totalProjectCategories", pcs.countAllProjectCategories());
		model.addAttribute("totalFeedbacks", fs.countAllFeedbacks());

		return "dashboard/AdminDashboard";
	}

// --------------------------- Report Controller ------------------------------------

	@RequestMapping("/admin/dashboard/show/report/page")
	public String showReportsPage() {

		return "dashboard/DashboardReport";
	}

	@RequestMapping("/admin/dashboard/show/report")
	public String showUsers(Model model, @RequestParam("report_type") String reportType,
			@RequestParam("from_date") @DateTimeFormat(pattern = "yyyy-MM-dd")Date fromDate,
			@RequestParam("to_date") @DateTimeFormat(pattern = "yyyy-MM-dd" ) Date toDate) {
            toDate.setHours(23);
		    toDate.setMinutes(59);
		    toDate.setSeconds(59);
		 		
		    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
            String reportFromDate = simpleDateFormat.format(fromDate);
            String reportToDate=simpleDateFormat.format(toDate); 
            
		    if (reportType.equals("user_sign_up_report")) {
                 List<User> users=us.findUserBetweenFromDateToDate(fromDate, toDate);
                
                  if(users.isEmpty()) {
                      model.addAttribute("bootstrapclass", "alert alert-danger");
                      model.addAttribute("errorMessage", "User Not Found from : "+ reportFromDate + " To " + reportToDate);
			         return "dashboard/DashboardUserSignUpReport";
			     }

			model.addAttribute("usersReport",users); 
			return "dashboard/DashboardUserSignUpReport";
		   }
         
		    else if(reportType.equals("feedback_report")) {
		    	List<Feedback> feedbacks=fs.findFeedbackByFromDateToDate(fromDate, toDate);
		         
		    	if(feedbacks.isEmpty()) {
		            model.addAttribute("bootstrapclass", "alert alert-danger");
	                model.addAttribute("errorMessage","Feedbacks Not Found from : "+reportFromDate+" To "
		    	 +reportToDate);
		    	}
		    	 
		    	model.addAttribute("feedbackReport", feedbacks);
		    	return "dashboard/DashboardFeedbackReport";
		    	
		    }
            model.addAttribute("bootstrapclass", "alert alert-danger");
            model.addAttribute("errorMessage", " No Report Found type  ");
		  return "dashboard/DashboardReport";

	}

	
}