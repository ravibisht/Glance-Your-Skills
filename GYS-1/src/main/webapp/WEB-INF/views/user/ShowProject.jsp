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

     <section>
    <!-- PROJECT SHORT DESCRIPTOIN -->
        <c:set var="user" value="${project.getUser()}"/>
        
        <div class="container-fluid">
             <br>
             <h1 class="text-center dark-grey-text pb-3 mt-5 pt-5 text-capitalize">
                <strong>${user.getFirstname()}'S</strong> Project
             </h1>
             <p class="grey-text text-center mb-4 text-uppercase spacing">Welcome on my Project. </p>
            
            <div class="row flex-center">
            
                 <div class="col-md-10 col-xl-5">
                    <p class="grey-text text-center">
                        <em>${project.getShortDesc()}</em>
                    </p>
                 </div>
            </div>
       </div>
     <!-- END OF THE SHORT DESCRIPTION -->  
    </section>
     
     
  <section>
  <div class="container-fluid grey lighten-4">
       <hr class="my-5">
   <!-- MAIN CONTINER -->
   <div class="container-fluid">
       <!-- MAIN ROW -->       
      <div class="row mt-5 pt-3">

          <!-- MAIN  PROJECT COLUMN -->
          <div class="col-lg-8 col-12 mt-1 mx-lg-4">

              <!-- PROJECT SECTION --> 
              <section class="pb-5  text-lg-left">

                <!-- PROJECT ROW -->     
                <div class="row mb-4">

                  <!-- PROJECT COLUMN -->
                  <div class="col-md-12">

                    <!-- PROJECT CARD -->
                    <div class="card shadow project">

                      <!-- ON HOVER EFFECT -->   
                        <div class="view overlay">

                          <!-- PROJECT CAROUSEL  -->
                          <div id="demo" class="carousel slide" data-ride="carousel">
                          
                                <c:set var="projectImages" value="${project.getImage()}"/>
                                <c:set var="images" value="${fn:split(projectImages,',') }"/>
                                <c:set var="video" value="${project.getVideo() }"/>
                                <c:set var="length" value="${fn:length(images)}"/>
                                 
                                 <c:if test="${(not empty video) and(video ne 'novideo.mp4')  }" >
                                     <c:set var="length" value="${length+1}"/>
                                 </c:if>
                                    
                                    
                           <!-- INDICATORS -->
                            <ul class="carousel-indicators">
                              <li data-target="#demo" data-slide-to="0" class="active">
                              </li>
                              <c:forEach begin="1" end="${length-1}" varStatus="couter" >
                                  <li data-target="#demo" data-slide-to="${couter.count}" >
                                  </li>
                               </c:forEach> 
                             </ul>
                           <!-- END OF THE INDICATORS -->

                            <!-- THE SLIDESHOW-->
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
                                
                               <c:if test="${(not empty video) and(video ne 'novideo.mp4')}" >
                                      <div class="carousel-item">
                                          <video class="video-fluid p_video" poster="blog_3.png" autoplay loop muted controls>
                                             <source src="/ProjectAssets/Video/${video}" type="video/${videoextension}" />
                                          </video>
                                       </div>
                                </c:if>
                          </div>
 
                            <!--END OF  THE SLIDESHOW-->         
                                      

                            <!-- LEFT AND RIGHT CONTROLS -->
                            
                            <c:if test="${length gt 1 }">
                              <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                  <span class="carousel-control-prev-icon"></span>
                               </a>
                               <a class="carousel-control-next" href="#demo" data-slide="next">
                                 <span class="carousel-control-next-icon"></span>
                               </a>
                            </c:if>
                     
                         <!-- END OF THE PROJECT CAROUSEL  -->
                            <a>
                             <div class="mask rgba-white-slight"></div>
                           </a>

                      </div>
                    
                      <!-- END OF THE ON HOVER EFFECT -->
                                        
                            <!-- PROJECT LIKE,COMMENT  -->
                             <div class="like-comment text-center mt-2">
                                   <span class="align-like-comment pl-5">
                                      <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                                          <span>${project.getLikes().size()} likes</span>
                                      <i class="fa fa-comment" aria-hidden="true"></i>
                                         <span>${project.getComments().size()} comments</span>
                                </span>   
                             </div>
                             <!-- END OF THE PROJECT LIKE,COMMENT -->

                            
                             <!-- PROJECT DESCRIPTION BODY -->   
                              <div class="card-body">
                                            <!--PROJECT TITLE-->
                                              <h4 class="card-title">
                                                  <strong>${project.getProjectName()}</strong>
                                              </h4>
                                            <!-- END OF THE PROJECT TITLE -->

                                            <hr>

                                            <!-- PROJECT DESCRIPTOIN -->
                                            <p class="dark-grey-text mb-3 mt-4 mx-4">
                                              ${project.getShortDesc() }
                                            </p>

                                            <!--Grid row-->
                                          <div class="row mx-4 mt-3">
                                                   <p class="dark-grey-text article">
                                                   
                                                   ${project.getDescription() }
                                                   </p>

                                                   <h5 class="mt-3 mb-4">
                                                    <strong></strong>
                                                   </h5>

                                                   <p class="dark-grey-text article"></p>

                                                

                                                   <p class="dark-grey-text article"> </p>

                                            </div>
                                            

                                            <!--Grid row-->
                                            <div class="row mx-4">

                                                <p class="dark-grey-text article"></p>

                                                <p class="dark-grey-text article mb-4"></p>

                                            </div>
                                            <!--Grid row-->

                                            <hr>
                                            
                                            <!--PROJECT UPLOADED HISTORY -->
                                            <div class="row mb-4">
                                                 <div class="col-md-12 text-center">
                                                    <h4 class="text-center font-weight-bold dark-grey-text mt-3 mb-3">
                                                       <div class=" text-center">
                                                          <strong>${project.dateCounter() }</strong>
                                                      </div>
                                                      
                                                    </h4>
                                                  </div>
                                            </div>
                                          <!--END OF THE PROJECT UPLOADED HISTORY-->
                                         
                                         </div>
                                        <!--END OF THE DESCRIPTION BODY-->

                                    </div>
                                  <!-- END OF THE PROJECT CARD -->

                                </div>
                              <!-- END OF THE PROJECT COLUMN -->

                            </div>
                            
                            </div>
                            
                           <!-- END OF THE PROEJCT ROW -->

                        </section>
                      <!-- END OF THE PROJECT SECTION -->

                </div>
                <!-- END OF THE MAIN PROJECT COLUMN -->

                  <!-- PROFILE SECTION -->

                    <!-- MAIN PROFILE COLUMN -->
                    <div class="col-lg-3 col-12 mt-1">
                        <!-- PROFILE CARD -->  
                        <div class="card shadow-lg sticky-top mt-3">

                            <!-- PROFILE IMAGE  -->
                            <div class="view overlay">

                               <a href="/${user.getUsername()}">   
                                 <img alt="" src="/Users/${user.getProfilePicture() }" 
                                  style="width:100%; height:100%;max-width:298px;max-height:255px;"/>
                                 </a>
                                    <div class="mask rgba-white-slight"></div>
                                
                            </div>
                            <!-- END OF THE PROFILE IMAGE -->

                            <!-- PROFILE BIO BODY -->
                            <div class="card-body">
                                
                                <h5 class="card-title dark-grey-text text-center grey lighten-4 py-2 ">
                                    <strong class="text-capitalize">${user.getFirstname() } 
                                      ${user.getLastname() }</strong>
                                </h5>
                                    <h4 class="text-center grey p-1">${user.getProfession() }</h4> 

                                <!--PROFILE BIO-->
                                <p class="mt-3 dark-grey-text font-small text-center">
                                    <em>${user.getBio()} </em>
                                </p>
                                <!-- END OF THE PROFILE BIO -->
                               
                            </div>
                            <!-- END OF THE PROFILE BIO BODY -->

                        </div>
                        <!-- END OF THE PROFILE CARD -->

                        <!-- TOTAL PROJECT SECTION -->
                        <section class="my-5">
                          <!-- TOTAL PROJECT CARD,CARD BODY -->
                           <div class="card card-body pb-0 shadow-lg" >
                                  <p class="font-weight-bold dark-grey-text text-center spacing grey lighten-4 py-2 mb-4">
                                    <strong>TOTAL PROJECTS</strong>
                                  </p>

                                  <div class="row mt-4">
                                      <div class="col-md-12">
                                         <h1 class="text-center font-weight-bold dark-grey-text mt-3 mb-3">
                                            <strong>30</strong>
                                          </h1>
                                        </div>
                                       <a role="button" class="btn btn-dark btn-block mb-4 mt-4" 
                                        style="color: white;">SHOW</a>
                                  </div>
                            </div>
                            <!-- END OF THE TOTAL PROJECT CARD -->

                        </section>
                        <!-- END OF THE TOTAL PROJECT SECTION -->
                   <!-- END OF THE PROFILE SECTION -->
                     
                </div>
                <!-- END OF THE MAIN COLUMN -->  

            </div>
           
            <!-- END OF THE MAIN ROW -->

         </div>
         <!--  END OF THE MAIN CONTAINER -->   
     </div>
     <!-- END OF THE GLOBEL CONTAINER -->

  </section>
   <!-- END OF THE SECTION -->
     
<%@include file="Footer.jsp" %>

</body>
</html>