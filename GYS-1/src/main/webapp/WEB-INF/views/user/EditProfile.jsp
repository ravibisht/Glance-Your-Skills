<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@include file="header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

     <input type="hidden" name="id" value="${edituser.getId() }" >
     <input type="hidden" name="username" value="${edituser.getUsername() }">       

    <!-- BACK TO PROFILE NAVIGATION CONTAINER -->
         <%@include file="Navigator.jsp" %>
    <!-- END OF THE BACK TO PROFILE NAVIGATION CONTAINER -->

  <!-- EDIT PROFILE FORM CONTAINER -->
  <div class="container mt-5 mb-5">

     <!-- EDIT FORM MAIN ROW -->	
      <div class="row">
         <div class="col-2">
   	     </div>

          <!-- EDIT PROFILE FORM COLUMN  -->
          <div class="col-8 my bg-white shadow">
 
    	      <!-- EDIT FORM PROFILE -->
             <div class="edit-profile ">
 
           	     <!-- EDIT PROFILE FORM ROW TITLE ROW -->
    	          <div class="row">
       	              <div class="col-12 text-center  text-uppercase">
    	   	              <h4>Edit Profile</h4>
    	              </div>   
                  </div>	
                 <!-- END OF THE EDIT PROFILE FORM TITLE ROW -->
                 
               
                 
                 <!-- EDIT PROFILE FORM INSIDE ROW (the row of form ) -->
    	         <div class="row">
 
    	   	          <!-- PROFILE IMAGE COLUMN -->
    	   	           <div class="col-3">
 
    	   	        	 <!-- PROFILE IMAGE -->
    	   	   	         <div class="profile-img ">
 		    	   	  	    	   <img class="ml-3 mt-4" src="/Users/${edituser.getProfilePicture()}">
 		    	   	  		        <br>
 		    	   	  		        <br>
 		   <form action="/profile/edit/user" method="post" enctype="multipart/form-data">    
 		                        <label for="imageUpload" id="imageUploadLabel" class="btn btn-primary  btn-outlined text-white">Upload</label>
 		                        <input type="file" id="imageUpload" accept="image/*" name="imageFile" style="display: none">
 		                        
                                <input type="hidden" name="profilePicture" value="${edituser.getProfilePicture()}">
                       </div>
                       <!-- END OF THE PROFILE IMAGE -->

                       </div>
                        <!-- END OF THE  PROFILE IMAGE COLUMN -->
                   
                        <!-- EDIT PROFILE FORM COLUMN -->
    	   	     <div class="col-9 pl-2 pr-5 py-3">
                 
                  <input type="hidden" value="${edituser.getId()}" />
 		 					 
 		 				      <div class="form-row">                    
 		 				           <div class="form-group col-6 ">
 	                          <label for="f_name">Firstname</label>
 		 				 	              <input type="text" class="form-control" placeholder="First Name" 
 		 				 	               value="${edituser.getFirstname()}" id="f_name" name="firstname">
 		 				 	               <span id="f_name_error"></span>
 		 				 	         </div>
 		 				 		   
 		                  <div class="form-group col-6 ">
 		 	                     <label for="l_name">Lastname</label>	
 		 				 		           <input type="text" class="form-control" placeholder="Last Name" 
 		 				 		            value="${edituser.getLastname()}" name="lastname" id="l_name">
 		 				 		            <span id="l_name_error"></span>
 		 				  	      </div>
                  </div>         
                                    
                     <div class="form-row">      
                        <div class="form-group col-12">
 		 				               <label for="u_name">Username</label>
 		 				               <input type="text" class="form-control" placeholder="Username"
 		 				                name="username" id="u_name" value="${edituser.getUsername() }">
 		 				                <span id="u_name_error"></span>
 		 				            </div>
 		 				            <input type="hidden" name="previousUsername" value="${edituser.getUsername() }">
 		 				            <span style="color:red">${Uerror}</span>
                      </div>
  
                     <div class="form-row"> 
        		 				     <div class="form-group col-12">
        		 				 	     <label for="bio">Bio</label>
        		 				 	     <textarea  class="form-control" rows="1" placeholder="Bio"
        		 				 	      name="bio" id="bio">${edituser.getBio() } </textarea> 
        		 				 	      <span id="bio_error"></span> 
      		 				     </div>  
		           	     </div>  
  
  		 	              <div class="form-row">                 
                         <div class="form-group col-6">
  		 				             <label for="profession">Profession</label>
  		 				             <input type="text" class="form-control" placeholder="Profession"
  		 				              name="profession" value="${edituser.getProfession()}" id="profession">
  		 				              <span id="prof_error"></span>
  		 			          </div>
  
                     <div class="form-group col-6">
  		 			               <label for="mobile_no">Mobile no</label>
  		 			               <input type="text" class="form-control" placeholder="Mobile no"
  		 			                value="${edituser.getMobileNo()}" name="mobileNo" id="mobile_no">
  		 			                <span id="mobile_no_error"></span>
  		 		              </div>
                     </div>
  		                              
  		 	              <div class="form-row">
  		                    <div class="form-group col-12">
  		 		                  <label for="email_id">Email </label>
  		 		                  <input type="email" class="form-control" placeholder="Email"
  		 		                    name="email" value="${edituser.getEmail() }" id="email_id">
  		 		                    <span id="email_error"></span>
  		 		                </div>
  		 		                <input type="hidden" name="previousEmail" value="${edituser.getEmail() }">
  		 		                
  		 		                <span style="color:red">${emailerror}</span>
 		                  </div>
 	                                             
 		 		          <button type="submit" id="edit_profile_button" class="btn btn-dark font-weight-bold btn-group-lg button "> Save</button>
                    </form>
 
                   </div> 
                  <!-- END OF THE EDIT PROFILE FORM COLUMN --> 
 
                    </div>
                    <!-- END OF THE EDIT PROFILE FORM INSIDE ROW (the row of form) -->

                  </div>
                  <!-- END OF THE EDIT PROFILE FORM PROFILE -->   
 
    	   	  </div>
              <!-- END OF THE EDIT PROFILE FORM COLUMN --> 
 
         </div>
         <!-- END OF THE EDIT PROFILE FORM MAIN ROW --> 
    </div>
    <!-- END OF THE EDIT PROFILE FORM CONTAINER -->
    
<%@include file="Footer.jsp" %>
</body>
</html>