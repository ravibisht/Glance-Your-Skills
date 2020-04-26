<%@include file="header.jsp" %>

<!DOCTYPE html>


<html lang="en">
<head>
  
  <title>Home</title>
  <meta charset="utf-8">
 
  
   
</head>
 <body>


<!-- MAIN CONTAINER -->
 
   <input type="hidden" id="login_username" value="${loggedInUser.getUsername()}" >
   <input type="hidden" value="${loggedInUser.getProfilePicture()}" id="login_profile_pic"/>

  <div class="container ">
  
  <c:set var="LoginUser" value="${project.getUser()}"/>

  <!-- MAIN ROW AND PROFILE -->
   <div class="row profile">
   
         <!-- PROFILE COLUMN -->
          <div class="col-md-3">

             <!-- PROFILE SIDEBAR -->
               <div class="profile-sidebar   mt-5">

                 <!-- SIDEBAR USERPIC -->
                    <div class="profile-userpic">
                        <img src="/Users/${loggedInUser.getProfilePicture()}" >
                     </div>
                 <!-- END SIDEBAR USERPIC -->


                 <!-- SIDEBAR USER TITLE -->
                   <div class="profile-usertitle">
                      <div class="profile-usertitle-name text-capitalize" >
                         ${loggedInUser.getFirstname()}  ${loginUserInfo.getLastname()}
                       </div>
                       <div class="profile-usertitle-job">${loggedInUser.getProfession()}
                       </div>
                    </div>
                 <!-- END SIDEBAR USER TITLE -->
                 
                 <!-- SIDEBAR MENU -->
                   <div class="profile-usermenu">
                      <ul class="nav flex-column">
                         <li class="nav-item ">
                            <a class="nav-link active" href="/user/home">
                              <i class="fa fa-home fa-3x" aria-hidden="true"></i>
                                Home</a>
                          </li>
                          <li class="nav-item">
                             <a class="nav-link " href="/edit/${loggedInUser.getUsername()}">
                                 <i class="fa fa-user" aria-hidden="true"></i>
                                  Account Settings</a>
                           </li>
                            <li class="nav-item">
                               <a class="nav-link" href="#">  
                                  <i class="fa fa-info-circle fa-3x" aria-hidden="true"></i>
                                     Help</a>
                             </li>
                            <li class="nav-item">
                              <a class="nav-link" href="/logout"> 
                                <i class="fa fa-sign-out fa-3x" aria-hidden="true"></i>
                                 Log Out</a>
                           </li>
                        </ul>
                    </div>
                 <!-- END OF  SIDEBAR MENU -->
            </div>
           <!-- END OF PROFILE SIDEBAR MENU -->    
       </div>
     <!-- END OF THE PROFILE COLUMN -->

       
     <!-- PROJECTS COLUMN -->
     <div class="col-md-9">
        <!-- PROJECT CONTENT  -->
          <div class="profile-content">
          
         <%-- LOOP FOR ITERATING PROJECT FORM PROJECT LIST --%>         
        <c:forEach  var="project"  varStatus="count" items="${projects}"> 
            
            <c:set var="user" value="${project.getUser() }"/>
            <c:set var="projectId" value="${project.getId() }"/>
              
           <!-- MAIN PORJECT COLUMN  --> 
           <div class="col-7 mb-5 ">
             <!-- PROJECT CARD -->
              <div class="card project" style="width:650px">
                <!-- PROJECT CARD HEADER -->
                  <div class="card-header p-header">
                    <a href="/profile/${user.getUsername()}"  role="button">
                       <img src="/Users/${user.getProfilePicture() }"  class="rounded-circle" width="50" height="50"/>
                         <span class="font-weight-bold p_u_name"> @${user.getUsername()}</span>
                     </a>
                     
                     <!-- PROJECT EDIT AND DELETE BUTTON -->
                     <span>
                      <%-- TESTING WHETER USER IS OWNER OF THE PROJECT  --%>
                      
                        <c:if test="${ user.getId() eq  loggedInUserId}" >
                            <a role="button" class="btn btn-danger float-right"
                               onclick="return confirm('Are you really want to delete')"
                               href="/project/delete/${projectId}">Delete</a>
                            <a role="button" class="btn btn-primary  float-right mr-3"
                               href="/project/edit/${projectId}">Edit</a>
                        </c:if>
                        
                     <%-- END OF THE TESTING WHETER USER IS OWNER OF THE PROJECT  --%>                
                   </span>
                   
                  <!-- END OF THE PROJECT EDIT AND DELETE BUTTON -->   
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
                                  
           <!-- remove this if you want to carousel slides auto data-interval="false" -->
           
           <div id="carousel${count.count}" class="carousel slide" data-ride="carousel" data-interval="false">
             <!-- INDICATORS -->
              <ul class="carousel-indicators">
                   <li data-target="#carousel${count.count}" data-slide-to="0" class="active"></li>
                                          
                      <c:forEach begin="1" end="${length-1}" varStatus="couter" >
                          <li data-target="#carousel${count.count}" data-slide-to="${couter.count}" ></li>
                      </c:forEach> 

              </ul>
             <!-- END OF THE INDICATORS -->

            <!-- THE SLIDESHOW-->
              <a href="/show/project/${projectId}">
              
                <div class="carousel-inner">
                  <div class="carousel-item active">
                     <img src="/ProjectAssets/Images/${images[0]}" class="card-img-top p_image" alt="Los Angeles">
                  </div>
                   
                <c:forEach begin="1" end="${fn:length(images)-1}" varStatus="i">
		           <div class="carousel-item">
					 <img src="/ProjectAssets/Images/${images[i.count]}"
							class="card-img-top p_image" />
	               </div>
	           </c:forEach>

			  <c:set value="${fn:split(video,'.')}" var="extension" />
              <c:set var="videoextension" value="${extension[fn:length(extension)-1]}"/>
                                
               <c:if test="${(not empty video)and (video ne 'novideo.mp4') }" >
                    <div class="carousel-item">
                       <video class="video-fluid p_video" autoplay loop muted controls>
                           <source src="/ProjectAssets/Video/${video}" type="video/${videoextension}" />
                        </video>
                     </div>
                </c:if>
                                            
         </div>       
        </a> 
        <!--END OF  THE SLIDESHOW-->         
                                      
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
          <a href="#" class=" btn btn-link  " style="font-size: 30px; margin-top: -25px;">
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
           <img src="/Users/${loggedInUser.getProfilePicture()}" style="width: 37px; height: 37px;border-radius: 50%;">
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
 <!-- END OF THE  MAIN PORJECT COLUMN  -->  
 </div>
 <!-- END OF THE  PROJECT CONTENT  -->
 </div>
 <!-- END OF THE PROJECTS COLUMN --> 
 </div>
 <!-- END OF THE MAIN ROW AND PROFILE -->
 </div>
<!-- END OF THE MAIN CONTAINER -->


<%@include file="Footer.jsp" %>
</body>
</html>

                     
                    <!-- delete --> 
                    
                    
                     <!-- SIDEBAR BUTTONS -->
                      <!-- <div class="profile-userbuttons">
                        <button type="button" class="btn btn-success btn-sm">Follow</button>
                        <button type="button" class="btn btn-danger btn-sm">Message</button>
                      </div> -->
                      <!-- END SIDEBAR BUTTONS -->
                      
                      <%--  <c:if test="${totalComments ge 4}">
                                          
                                             <div class="text-center" >
                                                <a href="" role="button" class="btn btn-primary mt-3" > more</a>
                                            </div>
                                         </c:if>  --%>
