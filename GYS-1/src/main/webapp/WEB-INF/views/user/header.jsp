<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${title }</title>
    
<script src="/js/jquery/jquery.min.js"></script>
     <link rel="stylesheet" href="/css/style.css"/>
     <script src="/js/validate.js"></script>
     <link rel="stylesheet" href="/css/bootstrap/css/bootstrap.min.css"/>
     
     <script src="/css/bootstrap/js/bootstrap.min.js"></script>
     <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    <script type="text/javascript">
    
    $(document).ready(function() {
    	$("#username").change(function() {
    	var actionValue = $(this).val();
    	
    	
    	$("#searchForm").attr('action', '/'+actionValue);
    	
    	})
    	});
    	
    
    </script>

</head>
<body>

      <c:set var="username" value="${loggedInUser.getUsername()}"/>
      <c:set var ="roleType" value="USER"/>
      
      <c:if test="${empty username}">
      
       <%@include file="IndexHeader.jsp" %>
      </c:if>
      
      
      <c:set var="username" value="${loggedInUser.getUsername()}"/>
      <c:set var ="roleType" value="USER"/>
     

  <c:if test="${(not empty username ) and (role eq roleType ) }">
           <!-- HEADER  -->
     <header class="header-area z-index" >
         <!-- NAV BAR -->  
        <nav class="navbar navbar-expand-lg navbar-light sticky-top">
					 <div class="container-fluid ">
					
						<a class="navbar-brand logo_h" href="/index"><img src="img/logo.png" alt="">
               <span>Glance Your Skill</span>
             </a>
                       
							<ul class="nav navbar-nav  "  >
                                <li class="nav-item active">
									<a class="nav-link active" href="/user/home">Home</a>
								</li> 

                                 <li class="nav-item">
									<a class="nav-link" href="/${loggedInUser.getUsername()}">Profile</a>
								 </li>

                                 <li class="nav-item">
									<a class="nav-link" href="/feedback">Feedback</a>
								</li>

                                 <li class="nav-item">
									<a class="nav-link" href="/aboutus">About us</a>
								</li>

                                 <li class="nav-item">
									<a class="nav-link" href="/logout">Logout</a>
								</li> 
                                 <li class="nav-item">
                                  <a class="nav-link " role="button"  href="/uploadProject"> <span class="btn create-project-button">Create a Project</span> </a>
                                </li>
							</ul>
          
                      <!-- SEARCH BAR -->
                       <div class="search">
            	              <form  id="searchForm" action="">
            	              	 <input  type="text" class="search-input" placeholder="Enter Username Here" id="username" value="${searchUsername}" required/>
            	              	  <button  type="submit" class="search-button">
					                 <i class="fa fa-search fa-2x" aria-hidden="true" ></i>
				                   </button> 
           	                  </form>
           	             </div>
           	          <!-- END OF THE SEARCH BAR -->   
           	          
           	          
           	</div>
        </nav>
       <!-- END OF THE NAV BAR  -->
         
</header>
  <!-- END OF TEH HEADER -->

    </c:if>  


</body>
</html>