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

  <!-- HERO SECTION -->
  <div class="container-fluid " style="background-color: black;">
      <div class="row hero-banner ">
      	
           <div class="col-6">
           	   
              <h1 class="text-uppercase text-white text-center heading">
              	
              	Show Your Skills To The 
              	<span class="bg-success world" >World</span>
              </h1>
            
            
              <c:if test="${empty username  }">
              <a href="/signup" role="button" class="btn sign-up-button btn-outline-primary  "> SIGN UP</a>
              </c:if>
              
           </div>

	         <div class="col-6">
	      	   <div class="hero-img ">
	      		  <img src="images/hero-img.svg">
	      	 </div>
        </div>	
      </div>
    </div>
   <!-- END OF THE HERO SECTION --> 

	<!-- PROJECTS AREA -->
	<section>

		<!-- PROJECT TITLE -->
		<div class="container  mt-5 ">
			<div class="main-title p-120 ">
				<h2>Our Latest  Projects</h2>
				<p>Who are in extremely love with eco friendly system.</p>
			</div>
		</div>
		<!-- END OF THE TITLE -->

		<!-- PROJECT CONTAINER -->
		<div class="container-fluid project-container">
			<!-- PROJECT ROW -->
			<div class="row">


				<!-- PROJECT COLUMN -->
				 
				<c:forEach  var="project"   items="${projects.getContent()}"> 
				
				   <c:set var="user" value="${project.getUser()}"/>
				    <c:set var="projectImages" value="${project.getImage()}"/>
                      <c:set var="images" value="${fn:split(projectImages,',') }"/>
				
				<div class="col-sm-3 project-inside">
					<div class="project-img">
						<a href="/show/project/${project.getId() } "> <img src="/ProjectAssets/Images/${images[0]}"
							class="project-img"/>
						</a>
					</div>

					<!-- PROJECT NAME -->
					<div class="project-name">
						<span>${project.getProjectName()}</span>
					</div>
					<!-- END OF THE PROJECT NAME -->

					<!-- END OF THE PROJECT BOTTOM -->
					<div class="project-bottom">
						<a href="/${user.getUsername() }" class=" btn-link"> <img src="/Users/${user.getProfilePicture()}" 
						                  class="user-img">
						</a> <a href="/${user.getUsername() }" class="btn-link"> <span class="display-name text-capitalize">
						${user.getFirstname()} ${user.getLastname()}</span>
						</a>

						<!-- PROJECT LIKE,COMMENT -->
						<div class="like-comment mb-5">
							<i class="fa fa-thumbs-o-up" aria-hidden="true"></i> <span>${project.getLikes().size()}</span>
							<i class="fa fa-comments" aria-hidden="true"></i> <span>${project.getComments().size()}</span>
						</div>
						<!-- END OF THE PROJECT LIKE,COMMENT -->

					</div>
					<!-- END OF THE PROJECT BOTTOM -->
				</div>
				<!-- END OF THE  PROJECT COLUMN -->
			</c:forEach>	

		</div>
	  <!-- END OF THE PROJECT ROW -->
	  
		</div>
		<!-- END OF THE PROJECT CONTAINER -->
	</section>
	<!-- END OF THE PROJECT AREA -->


	<!-- LOAD-MORE BUTTON   -->
	<section>
	     
	     
		<a href="/?value=${value+8}" class="loadMore">Load More</a>
	</section>
	<!-- END OF THE LOAD MORE BUTTON  -->


<%@include file="Footer.jsp" %>
</body>
</html>