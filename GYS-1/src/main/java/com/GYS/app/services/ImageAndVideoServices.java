package com.GYS.app.services;



import org.springframework.web.multipart.MultipartFile;

public interface ImageAndVideoServices {
     
	
	public String saveUserProfileImage(MultipartFile imageFile)throws Exception;
	public String saveProjectImage(MultipartFile  []imageFiles)throws Exception;
	public String saveProjectVideo(MultipartFile videoFile)throws Exception;
	public String saveProjectCategoryImage(MultipartFile imageFile)throws Exception;
	public boolean deleteUserProfileImage(String imageFile);
    public boolean deleteProjectCategoryImage(String imageFile);
    boolean deleteProjectVideo(String videoFile);
	boolean deleteProjectImages(String imageFile);
	
	
	
}
