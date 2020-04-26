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
 
 <input type="hidden" id="login_username" value="${loggedInUser.getUsername()}" >
 <input type="hidden" value="${loggedInUser.getProfilePicture()}" id="login_profile_pic"/>
     
  <!-- PROFILE HEADER -->
  <section>
    
    <!-- PROFILE HEADER CONTAINER --> 
    <div class="container-fluid profile-header lighten-4 " >
       
       <!-- PROFILE HEADER ROW -->
       <div class="row mt-2">

        <!-- PROFILE HEADER COLUMN -->
          <div class="col-9  text-center ">
            <h1 class="profile-text   p-3 text-capitalize"  >  Ravi's Profile </h1>
          </div>
        <!-- END OF THE PROFILE HEADER COLUMN  -->

        <!-- PROFILE HEADER COLUMN (total project) -->
       <div class="col-3 p-2">
          <div class="total-projects text-center card card-body text-uppercase shadow ">
             <h3 class="my-auto">Total Project : ${profile.getProjects().size()} </h3>
          </div>
       </div>
       <!-- END OF THE PROFILE HEADER (total project) -->

    </div>
   <!-- END OF THE PROFILE HADER ROW --> 
  
  </div> 
  <!-- END OF THE PROFILE HEADER CONTAINER -->

</section> 
<!-- END OF THE PROFILE HEADER -->



<!-- PROFILE PAGE -->

<c:set var="username" value="${profile.getUsername()}"/>

<section >


 <div class="container-fluid ">

   <!-- MAIN ROW OF PROFILE PAGE  -->
   <div class="row mt-5 pt-5 ">


  
      <!-- PROFILE COLUMN -->
      
       <div class="col-4 display-user ">

          <!-- PROFILE CARD -->
         
           <div class="card  shadow p-4 mb-4 bg-white rounded  " style="height:560px;"> 
                
              <img src="/Users/${profile.getProfilePicture() }" class="mx-auto d-block rounded-circle " 
               style="border-width: 6px" width="200" height="200"> 
                
                 <!-- PROFILE CARD BODY -->
                  <div class="card-body">
                     <h3 class="card-title mb-2 text-center">@${profile.getUsername() }</h3>

                         <!-- PROFILE CARD TEXT -->
                         <div class="card-text"> 
                             
                             <h5 class="text-center font-weight-bold"> ${profile.getBio() }</h5>
                                 <div class="row pt-2">
                                      <div class="col-4 font-weight-bold ">
                                          <p> Name </p>
                                          <p> Email </p>
                                          <p> Mobile </p>
                                          <p> Profession </p>
                                      </div>
                                       <div class="col">
                                         <p class="text-capitalize">${profile.getFirstname() } ${profile.getLastname()} </p>
                                         <p> ${profile.getEmail() }</p>
                                         <p>${profile.getMobileNo() }</p>
                                         <p class="text-capitalize"> ${profile.getProfession() }</p>
                                      </div>
                                  </div>

                               <!-- EDIT BUTTON ROW -->
                               <div class="row">
                                  
                                  <!-- EDIT BUTTON OF PROFILE  -->
                              <div class="col-12 text-center mt-1">
                                 
                                 <c:if test="${ username eq loggedInUser.getUsername()}" >
                                     
                                        <a role="botton" class="btn btn-dark  text-white" 
                                          href="/edit/${profile.getUsername()}">Edit Profile</a>
                                      
                                </c:if>
                                
                                    </div>
                                    <!-- END OF THE EDIT BUTTON OF PROFILE  -->

                              </div>
                              <!-- END OF THE EDIT BUTTON ROW -->
                        
                        </div>
                        <!-- END OF THE PROFILE CARD TEXT  -->
                             
                    </div>
                    <!-- END OF THE PROFILE CARD BODY -->
                            
                </div>
                <!-- END OF THE PROFILE CARD -->
            
         </div>
         <!-- END OF THE PROFILE COLUMN -->                 
    
    

         
        <!-- PROJECT COLUMN -->
         <c:forEach  var="project"  varStatus="count" items="${profile.getProjects()}">
         
            <c:set var="projectId" value="${project.getId() }"/>
             <c:set var="user" value="${project.getUser() }"/>         
                 
                 <c:if test="${count.count eq 1 }">
                  <div class=" offset-1 col-7  ">
                </c:if>
         
             <c:if test="${count.count gt 1 }">
                    <div class="offset-md-5 col-7 mt-5 ">
             </c:if>
        
          <!-- MAIN PORJECT COLUMN  --> 
          
                            

                      <!-- PROJECT CARD -->
                       <div class="card project" style="width:650px">

                         <!-- PROJECT CARD HEADER -->
                          <div class="card-header p-header">
                               <a href="/${profile.getUsername()}"  role="button">
                                   <img src="/Users/${profile.getProfilePicture() }"  class="rounded-circle" width="50" height="50"/>
                                   <span class="font-weight-bold p_u_name"> @${profile.getUsername()}</span>
                                </a>
                                
                               
                                 <span>
                                     <c:if test="${loggedInUserId eq profile.getId() }" >
                                     
                                        <a role="button" class="btn btn-danger float-right" onclick="return confirm('Are you really want to delete')" 
                                         href="/project/delete/${project.getId()}">Delete</a>
                                        <a role="button" class="btn btn-primary  float-right mr-3" href="/project/edit/${project.getId()}">Edit</a>
                                     
                                     </c:if>
                                     
                                 </span>
                             </div>   
                            <!-- END OF THE PROJECT CARD HEADER -->
                            
                            
                            <!-- PROJECT CAROUSEL  -->
                                <c:set var="projectImages" value="${project.getImage()}"/>
                                <c:set var="images" value="${fn:split(projectImages,',') }"/>
                                <c:set var="video" value="${project.getVideo() }"/>
                                <c:set var="length" value="${fn:length(images)}"/>
                                 
                                 <c:if test="${(not empty video) and(video ne 'novideo.mp4')  }" >
                                     <c:set var="length" value="${length+1}"/>
                                 </c:if>
                                  
                            
                               <div id="carousel${count.count}" class="carousel slide" data-ride="carousel">
                                    <!-- INDICATORS -->
                                      <ul class="carousel-indicators">
                                          <li data-target="#carousel${count.count}" data-slide-to="0" class="active"></li>
                                          
                                          <c:forEach begin="1" end="${length-1}" varStatus="couter" >
                                              <li data-target="#carousel${count.count}" data-slide-to="${couter.count}" ></li>
                                           </c:forEach> 

                                      </ul>
                                      
                                     <!-- END OF THE INDICATORS -->

                                      <!-- THE SLIDESHOW-->
                                      <a href="/show/project/${project.getId()}">
                                      <!-- LINK FOR PROJECT -->
                                      
                                      <div class="carousel-inner">
                                              <div class="carousel-item active">
                                                  <img src="/ProjectAssets/Images/${images[0]}" class="card-img-top p_image" alt="Los Angeles">
                                               </div>
                                             
                                             <c:forEach  begin="1" end="${fn:length(images)-1}" varStatus="i">
                                                <div class="carousel-item">
                                                   <img src="/ProjectAssets/Images/${images[i.count]}" class="card-img-top p_image" alt="Chicago">
                                                </div>
                                              </c:forEach>  

                                              <c:set value="${fn:split(video,'.')}" var="extension" />
                                              <c:set var="videoextension" value="${extension[fn:length(extension)-1]}"/>
                                
                                             <c:if test="${(not empty video)and (video ne 'novideo.mp4') }" >
                                                <div class="carousel-item">
                                                    <video class="video-fluid p_video" poster="blog_3.png" 
                                                            autoplay loop muted controls>
                                                       <source src="/ProjectAssets/Video/${video}" 
                                                             type="video/${videoextension}" />
                                                    </video>
                                                 </div>
                                            </c:if>
                                            
                                            
                                        </div>       
                                      <!--END OF  THE SLIDESHOW-->         
                                    </a>  
                                    <!-- END OF THE PROJECT LINK -->

                                      <!-- LEFT AND RIGHT CONTROLS -->
                                      <c:if test="${length gt 1 }">
                                           <a class="carousel-control-prev" href="#carousel${count.count}" data-slide="prev">
                                              <span class="carousel-control-prev-icon"></span>
                                            </a>
                                           <a class="carousel-control-next" href="#carousel${count.count}" data-slide="next">
                                              <span class="carousel-control-next-icon"></span>
                                            </a>
                                      </c:if>
                                      
                                    <!-- END OF THE LEFT AND RIGHT CONTROLS -->

                                </div>
      <!-- END OF THE PROJECT CAROUSEL  -->
      
      <!-- PROJECT CARD BODY -->
    <div class="card-body">
      <hr>
      <!-- LIKE,COMMENT,SHARE -->
        <div>
         <c:set var="userId" value="${userid}"/>
           <button class="btn" id="like_${projectId}" 
                   onclick='doLikeAndDeleteLike($(this),${projectId})'style="font-size: 30px; margin-top: -25px;">
                                                 
              <c:set var="status" value="notliked"/>
              
                  <c:forEach var="like" items="${project.getLikes()}" >
                     <c:set var="likeUserId" value="${like.getUserId()}"/>
                     
                        <c:if test="${loggedInUserId eq likeUserId }">
                          <i class="fa fa-thumbs-up" style="color:#007bff;" aria-hidden="true"></i>
                            <c:set var="status" value="liked"/>
                        </c:if>
                        
                  </c:forEach> 
                  
                  <c:set var="check" value="notliked"/>
                     <c:if test="${status eq check}">
                        <i class="fa fa-thumbs-o-up"  aria-hidden="true"></i>
                     </c:if>
            </button> 
                                            
          <a class=" btn btn-link"  href="#comment_box" style="font-size: 30px;margin-top: -25px;">
              <i  class="fa fa-comment-o" aria-hidden="true"></i>
          </a>
          
          <a href="#" class=" btn btn-link" style="font-size: 30px; margin-top: -25px;" onclick="share(${projectId})">
             <i class="fa fa-share" aria-hidden="true"></i>
          </a>
      </div>
     <!-- END OF THE LIKE,COMMENT,SHARE -->
     
       <c:set var="totalLikes" value="${project.getLikes().size()}"/>  
       <c:set var="totalComments" value="${project.getComments().size()}"/> 
         <span class="text-muted" id="total_like_${projectId}">likes ${totalLikes} </span>
           <span class="text-muted" id="total_comments_${projectId}">comments ${totalComments}</span>
             <h4 class="card-title">${project.getProjectName()}</h4>
               <p class="card-text">${project.getShortDesc()} &nbsp  
                  <a href="/show/project/${projectId}" class="ml-5 ">more</a> </p>
                                        
   </div>
   <!-- END OF THE PROJECT CARD BODY -->
   
   <!-- PROJECT CARD FOOTER -->
   <div class="card-footer" style="background-color: white">
     <!-- PROJECT COMMENT IMAGE ->PROJECT COMMENT TEXT -->
     <c:forEach var="comment" items="${project.getComments()}" >
         <c:set var="userInfo" value="${comment.getUser()}"/>
         
       
         <c:set var="userCommentId"  value="${comment.getUserId()}"/>
                                    
       <div class="comment_img" id="comment_id_${comment.getId()}">
       
         <a href="/${userInfo.getUsername()}">
           <img src="/Users/${userInfo.getProfilePicture()}" style="width: 37px;height: 37px;border-radius: 50%;">
         </a>
         
       <!-- PROJECT COMMENT TEXT -->
       <div class="comment_text">
         <a href="/profile/${userInfo.getUsername()}">${userInfo.getUsername()}</a>
            <span class="mb-4">${comment.getCommentText()}</span>
                                                   &nbsp &nbsp
       </div>     
       <!-- END OF THE COMMENT TEXT -->      &nbsp &nbsp
       
       <c:if test="${loggedInUserId==userCommentId}"> 
       
          <button type="button" class="btn btn-link" 
             onclick='deleteComment($(this),comment_id_${comment.getId()},${comment.getId()},${projectId})'>
             delete</button>
             
     </c:if>
     
    </div>
   </c:forEach>
         
     <!-- AJAX COMMENT INJECTOR LOCATION  -->  
      <input type="hidden" id="com_text_${projectId}"/>
      
     <!-- END OF THE PROJECT COMMENT IMAGE <- PROJECT COMMENT TEXT -->
        <hr>
    <!-- PROJECT COMMENT ->COMMENT BOX --> 
   <div class="comment">
    <!-- COMMENT BOX -->
      <div class="comment-box">
         <div class="input">
           <img src="/Users/${user.getProfilePicture()}" style="width: 37px; height: 37px;border-radius: 50%;">
             <input type="text" class="input-text " name="comment_text"  id="comment_text_${projectId}" 
                    style="display:inline-block;" placeholder="Add a comment here"/>
                    
             <input type="button" class="btn btn-primary button" 
                    style="border-radius: 18px;"   id="sendcomment"
                    onclick='doComment(${projectId},$("#comment_text_${projectId}").val())' value="Comment"  />
             </div>
             
           </div>
          <!-- END OF THE COMMENT BOX --> 
         </div>
        <!-- END OF THE PROJECT COMMENT <- COMMENT BOX --> 
       </div>
      <!-- END OF THE PROJECT CARD FOOTER --> 
     </div>
    <!--END OF THE  PROJECT CARD -->
   </div>
  </c:forEach> 
 <!-- END OF THE  MAIN PORJECT COLUMN  -->  
 </div>    
<!-- END OF MAIN ROW OF PROFILE PAGE -->
 </div>
 <!-- END OF THE PRFILE CONTAINER -->

</section>
<!-- END OF THE PROFILE SECTION -->


<%@include file="Footer.jsp" %>
</body>
</html>